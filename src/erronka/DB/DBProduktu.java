package erronka.DB;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JComboBox;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JOptionPane;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import erronka.DBmain;

public class DBProduktu {

    private List<Produktu> produktuak;

    public DBProduktu() {
        this.produktuak = new ArrayList<>();
    }

    public DBProduktu(List<Produktu> produktuak) {
        if (produktuak == null) {
            throw new IllegalArgumentException("Produktuak zerrenda ezin da nulua izan.");
        }
        this.produktuak = new ArrayList<>(produktuak);
    }

    public void produktuakKargatu() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBmain.konexioa();
            stmt = conn.createStatement();
            String sql = "SELECT ID, IZENA, DESKRIBAPENA, BALIOA, SALNEURRIA, ID_KATEGORIA FROM PRODUKTU";
            rs = stmt.executeQuery(sql);
            produktuak.clear(); // Zerrenda garbitu
            while (rs.next()) {
                int id = rs.getInt("ID");
                String izena = rs.getString("IZENA");
                String deskribapena = rs.getString("DESKRIBAPENA");
                double balioa = rs.getDouble("BALIOA");
                double salneurria = rs.getDouble("SALNEURRIA");
                int idKategoria = rs.getInt("ID_KATEGORIA");
                
                // Produktua sortu eta zerrendan gehitu
                Produktu p = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
                produktuak.add(p);
            }
        } catch (SQLException e) {
            System.err.println("Errorea produktuak kargatzerakoan: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Errorea errekurtsoak ixterakoan: " + e.getMessage());
            }
        }
    }
    
    public static void kargatuProduktuak(JComboBox<String> comboBox, JTextField kategoria, JTextArea deskribapena, JTextField salneurria) {
	    DBProduktu dbProduktu = new DBProduktu();
	    dbProduktu.produktuakKargatu();

	    // ComboBox-a garbitu elementuak gehitu baino lehen
	    comboBox.removeAllItems();

	    // Produktuen lista rekorrito eta gehitu comboBox-ean
	    for (Produktu produktu : dbProduktu.getProduktuak()) {
	        comboBox.addItem(produktu.getIzena() + " (" + produktu.getIdKategoria() + ")");
	    }

	    // Añadir ActionListener al ComboBox
	    comboBox.addActionListener(new ActionListener() {
	        @Override
	        public void actionPerformed(ActionEvent e) {
	            String aukeratutakoProduktua = (String) comboBox.getSelectedItem();
	            if (aukeratutakoProduktua != null) {
	                String produktuaIzena = aukeratutakoProduktua.split(" \\(")[0];
	                kargatuProduktuarenInformazioa(produktuaIzena, kategoria, deskribapena, salneurria, dbProduktu);
	            }
	        }
	    });
	}

    private static void kargatuProduktuarenInformazioa(String produktua, JTextField kategoria, JTextArea deskribapena, JTextField salneurria, DBProduktu dbProduktu) {
        // Buscar el producto en la lista de productos
        for (Produktu produktu : dbProduktu.getProduktuak()) {
            if (produktu.getIzena().equals(produktua)) {
                // Obtener el nombre de la categoría desde la base de datos
                String kategoriaIzena = lortuKategoriaIzena(produktu.getIdKategoria());
                
                // Mostrar la información en los campos correspondientes
                kategoria.setText(kategoriaIzena); // Mostrar el nombre de la categoría
                deskribapena.setText(produktu.getDeskribapena());
                salneurria.setText(produktu.getSalneurria() + " €");
                return;
            }
        }

        // Si no se encuentra el producto, limpiar los campos
        kategoria.setText("");
        deskribapena.setText("");
        salneurria.setText("");
    }

    private static String lortuKategoriaIzena(int idKategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String kategoriaIzena = "";

        try {
            conn = DBmain.konexioa();
            String sql = "SELECT IZENA FROM KATEGORIA WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idKategoria);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                kategoriaIzena = rs.getString("IZENA");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea kategoria izena lortzean.");
            ex.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                System.err.println("Errorea resursoak ixterakoan: " + ex.getMessage());
            }
        }

        return kategoriaIzena;
    }

    public List<Produktu> getProduktuak() {
        return new ArrayList<>(produktuak);
    }

    public void setProduktuak(List<Produktu> produktuak) {
        if (produktuak == null) {
            throw new IllegalArgumentException("Produktuak zerrenda ezin da nulua izan.");
        }
        this.produktuak = new ArrayList<>(produktuak);
    }

    public void gehituProduktua(Produktu produktua) {
        if (produktua == null) {
            throw new IllegalArgumentException("Produktua ezin da nulua izan.");
        }
        this.produktuak.add(produktua);
    }

    public void ezabatuProduktua(Produktu produktua) {
        if (produktua == null) {
            throw new IllegalArgumentException("Produktua ezin da nulua izan.");
        }
        if (!this.produktuak.remove(produktua)) {
            throw new IllegalArgumentException("Produktua ez dago zerrendan.");
        }
    }
}