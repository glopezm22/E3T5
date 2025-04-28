package com.gamestop.db;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JComboBox;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.gamestop.model.product.Produktu;

import javax.swing.JOptionPane;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Produktuak datubasean kudeatzeko klasea.
 */
public class DBProduktu {

    private List<Produktu> produktuak;

    /**
     * DBProduktu klasearen eraikitzailea.
     */
    public DBProduktu() {
        this.produktuak = new ArrayList<>();
    }

    /**
     * DBProduktu klasearen eraikitzailea.
     * 
     * @param produktuak produktuen zerrenda
     * @throws IllegalArgumentException produktuak nulua bada
     */
    public DBProduktu(List<Produktu> produktuak) {
        if (produktuak == null) {
            throw new IllegalArgumentException("Produktuak zerrenda ezin da nulua izan.");
        }
        this.produktuak = new ArrayList<>(produktuak);
    }

    /**
     * Datubasetik produktuak kargatzen ditu.
     */
    public void produktuakKargatu() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseManager.konexioa();
            stmt = conn.createStatement();
            String sql = "SELECT ID, IZENA, DESKRIBAPENA, BALIOA, SALNEURRIA, ID_KATEGORIA FROM PRODUKTU";
            rs = stmt.executeQuery(sql);
            produktuak.clear();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String izena = rs.getString("IZENA");
                String deskribapena = rs.getString("DESKRIBAPENA");
                double balioa = rs.getDouble("BALIOA");
                double salneurria = rs.getDouble("SALNEURRIA");
                int idKategoria = rs.getInt("ID_KATEGORIA");
                
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
    
    /**
     * Produktuak kargatzen ditu JComboBox batean eta informazioa erakusten du testu-eremuetan.
     * 
     * @param comboBox produktuak erakusteko JComboBox
     * @param kategoria produktuaren kategoria erakusteko testu-eremua
     * @param deskribapena produktuaren deskribapena erakusteko testu-eremua
     * @param salneurria produktuaren salneurria erakusteko testu-eremua
     */
    public static void kargatuProduktuak(JComboBox<String> comboBox, JTextField kategoria, JTextArea deskribapena, JTextField salneurria) {
        DBProduktu dbProduktu = new DBProduktu();
        dbProduktu.produktuakKargatu();

        comboBox.removeAllItems();

        for (Produktu produktu : dbProduktu.getProduktuak()) {
            comboBox.addItem(produktu.getIzena() + " (" + produktu.getIdKategoria() + ")");
        }

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

    /**
     * Produktu baten informazioa kargatzen du testu-eremuetan.
     * 
     * @param produktua produktuaren izena
     * @param kategoria kategoria erakusteko testu-eremua
     * @param deskribapena deskribapena erakusteko testu-eremua
     * @param salneurria salneurria erakusteko testu-eremua
     * @param dbProduktu DBProduktu instantzia
     */
    private static void kargatuProduktuarenInformazioa(String produktua, JTextField kategoria, JTextArea deskribapena, JTextField salneurria, DBProduktu dbProduktu) {
        for (Produktu produktu : dbProduktu.getProduktuak()) {
            if (produktu.getIzena().equals(produktua)) {
                String kategoriaIzena = lortuKategoriaIzena(produktu.getIdKategoria());
                
                kategoria.setText(kategoriaIzena);
                deskribapena.setText(produktu.getDeskribapena());
                salneurria.setText(String.valueOf(produktu.getSalneurria()));
                return;
            }
        }

        kategoria.setText("");
        deskribapena.setText("");
        salneurria.setText("");
    }

    /**
     * Kategoria baten izena lortzen du IDaren arabera.
     * 
     * @param idKategoria kategoriaren IDa
     * @return kategoriaren izena
     */
    private static String lortuKategoriaIzena(int idKategoria) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String kategoriaIzena = "";

        try {
            conn = DatabaseManager.konexioa();
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

    /**
     * Produktu bat eguneratzen du datubasean.
     * 
     * @param izena produktuaren izena
     * @param deskribapena produktuaren deskribapena
     * @param salneurria produktuaren salneurria
     */
    public static void eguneratuProduktua(String izena, String deskribapena, double salneurria) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseManager.konexioa();
            String sql = "UPDATE PRODUKTU SET DESKRIBAPENA = ?, SALNEURRIA = ? WHERE IZENA = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, deskribapena);
            pstmt.setDouble(2, salneurria);
            pstmt.setString(3, izena);

            int updatedRows = pstmt.executeUpdate();
            if (updatedRows > 0) {
                JOptionPane.showMessageDialog(null, "Produktua eguneratu da!");
            } else {
                JOptionPane.showMessageDialog(null, "Ezin da produktua eguneratu. Ziurtatu izena zuzena dela.");
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Errorea produktua eguneratzean: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Errorea konexioa ixterakoan: " + e.getMessage());
            }
        }
    }

    /**
     * Produktuen zerrenda itzultzen du.
     * 
     * @return produktuen zerrenda
     */
    public List<Produktu> getProduktuak() {
        return new ArrayList<>(produktuak);
    }

    /**
     * Produktuen zerrenda ezartzen du.
     * 
     * @param produktuak produktuen zerrenda
     * @throws IllegalArgumentException produktuak nulua bada
     */
    public void setProduktuak(List<Produktu> produktuak) {
        if (produktuak == null) {
            throw new IllegalArgumentException("Produktuak zerrenda ezin da nulua izan.");
        }
        this.produktuak = new ArrayList<>(produktuak);
    }

    /**
     * Produktu bat gehitzen du zerrendara.
     * 
     * @param produktua gehituko den produktua
     * @throws IllegalArgumentException produktua nulua bada
     */
    public void gehituProduktua(Produktu produktua) {
        if (produktua == null) {
            throw new IllegalArgumentException("Produktua ezin da nulua izan.");
        }
        this.produktuak.add(produktua);
    }

    /**
     * Produktu bat ezabatzen du datubasetik.
     * 
     * @param id ezabatzeko produktuaren IDa
     */
    public static void ezabatuProduktua(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseManager.konexioa();
            String sql = "DELETE FROM PRODUKTU WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            int deletedRows = pstmt.executeUpdate();
            if (deletedRows > 0) {
                JOptionPane.showMessageDialog(null, "Produktua ezabatu da!");
            } else {
                JOptionPane.showMessageDialog(null, "Ez da produkturik aurkitu izen horrekin.");
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Errorea produktua ezabatzean: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Errorea konexioa ixterakoan: " + e.getMessage());
            }
        }
    }
}