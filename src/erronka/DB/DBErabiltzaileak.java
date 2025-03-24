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

public class DBErabiltzaileak {

    private List<Erabiltzaileak> erabiltzaileak;

    public DBErabiltzaileak() {
        this.erabiltzaileak = new ArrayList<>();
    }

    public DBErabiltzaileak(List<Erabiltzaileak> erabiltzaileak) {
        if (erabiltzaileak == null) {
            throw new IllegalArgumentException("Erabiltzaileak zerrenda ezin da nulua izan.");
        }
        this.erabiltzaileak = new ArrayList<>(erabiltzaileak);
    }

    public void erabiltzaileakKargatu() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBmain.konexioa();
            stmt = conn.createStatement();
            String sql = "SELECT E.ID, E.ERABILTZAILEA, E.PASAHITZA, E.MOTA, "
					+ "L.IZENA AS LANGILE_IZENA, L.ABIZENA AS LANGILE_ABIZENA, L.EMAILA AS LANGILE_EMAILA, "
					+ "B.IZENA AS BEZERO_IZENA, B.ABIZENA AS BEZERO_ABIZENA, B.EMAILA AS BEZERO_EMAILA "
					+ "FROM ERABILTZAILEAK E " + "LEFT JOIN LANGILE L ON E.ID = L.ID AND E.MOTA = 'S' "
					+ "LEFT JOIN BEZERO B ON E.ID = B.ID AND E.MOTA = 'B'";
            rs = stmt.executeQuery(sql);
            erabiltzaileak.clear();
            while (rs.next()) {
				String mota = rs.getString("MOTA");
				String izena = mota.equals("S") ? rs.getString("LANGILE_IZENA") : rs.getString("BEZERO_IZENA");
				String abizena = mota.equals("S") ? rs.getString("LANGILE_ABIZENA") : rs.getString("BEZERO_ABIZENA");
				String emaila = mota.equals("S") ? rs.getString("LANGILE_EMAILA") : rs.getString("BEZERO_EMAILA");
				String erabiltzailea = rs.getString("ERABILTZAILEA");
				String pasahitza = rs.getString("PASAHITZA");

				Erabiltzaileak e = new Erabiltzaileak(rs.getInt("ID"), izena, abizena, emaila,
						erabiltzailea, pasahitza, mota);
				erabiltzaileak.add(e);
			}
        } catch (SQLException e) {
            System.err.println("Errorea erabiltzaileak kargatzerakoan: " + e.getMessage());
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
    
    public static void kargatuErabiltzaileak(JComboBox<String> comboBox, JTextField kategoria, JTextArea deskribapena, JTextField salneurria) {
	    DBErabiltzaileak dbErabiltzaileak = new DBErabiltzaileak();
	    dbErabiltzaileak.erabiltzaileakKargatu();

	    // ComboBox-a garbitu elementuak gehitu baino lehen
	    comboBox.removeAllItems();

	    // Produktuen lista rekorrito eta gehitu comboBox-ean
	    for (Erabiltzaileak erabiltzailea : dbErabiltzaileak.getErabiltzaileak()) {
	        comboBox.addItem(erabiltzailea.toString());
	    }

	    // Añadir ActionListener al ComboBox
	    comboBox.addActionListener(new ActionListener() {
	        @Override
	        public void actionPerformed(ActionEvent e) {
	            String aukeratutakoErabiltzailea = (String) comboBox.getSelectedItem();
	            if (aukeratutakoErabiltzailea != null) {
	                String produktuaIzena = aukeratutakoErabiltzailea.split(" \\(")[0];
	                kargatuErabiltzailearenInformazioa(produktuaIzena, kategoria, deskribapena, salneurria, dbErabiltzaileak);
	                
	            }
	        }
	    });
	}

    private static void kargatuErabiltzailearenInformazioa(String produktua, JTextField izena,  JTextField abizena, JTextField mota, DBErabiltzaileak dbErabiltzaileak) {
        // Buscar el producto en la lista de productos
        for (Erabiltzaileak erabiltzailea : dbErabiltzaileak.getErabiltzaileak()) {
            if (erabiltzailea.getIzena().equals(erabiltzailea)) {
            	izena.setText(erabiltzailea.getIzena());
				abizena.setText(erabiltzailea.getAbizena());
				mota.setText(erabiltzailea.getMota());
				if (mota.getText().equals("S")) {
					mota.setText("Saltzailea");
				} else if (mota.getText().equals("B")) {
					mota.setText("Bezeroa");
				}
                return;
            }
        }

        // Si no se encuentra el producto, limpiar los campos
        izena.setText("");
        abizena.setText("");
        mota.setText("");
    }

    public List<Erabiltzaileak> getErabiltzaileak() {
        return new ArrayList<>(erabiltzaileak);
    }

    public void setErabiltzaileak(List<Erabiltzaileak> erabiltzaileak) {
        if (erabiltzaileak == null) {
            throw new IllegalArgumentException("Erabiltzaileen zerrenda ezin da nulua izan.");
        }
        this.erabiltzaileak = new ArrayList<>(erabiltzaileak);
    }

    public void gehituErabiltzailea(Erabiltzaileak erabiltzailea) {
        if (erabiltzailea == null) {
            throw new IllegalArgumentException("Erabiltzailea ezin da nulua izan.");
        }
        this.erabiltzaileak.add(erabiltzailea);
    }

    public void ezabatuErabiltzailea(Erabiltzaileak erabiltzailea) {
        if (erabiltzailea == null) {
            throw new IllegalArgumentException("Erabiltzailea ezin da nulua izan.");
        }
        if (!this.erabiltzaileak.remove(erabiltzailea)) {
            throw new IllegalArgumentException("Erabiltzailea ez dago zerrendan.");
        }
    }
}