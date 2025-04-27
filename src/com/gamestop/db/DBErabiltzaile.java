package com.gamestop.db;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JComboBox;
import javax.swing.JTextField;

import com.gamestop.model.user.Erabiltzaile;

import javax.swing.JOptionPane;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Erabiltzaileak datubasean kudeatzeko klasea.
 */
public class DBErabiltzaile {

    private List<Erabiltzaile> erabiltzaileak;

    /**
     * DBErabiltzaile klasearen eraikitzailea.
     */
    public DBErabiltzaile() {
        this.erabiltzaileak = new ArrayList<>();
    }

    /**
     * DBErabiltzaile klasearen eraikitzailea.
     * 
     * @param erabiltzaileak erabiltzaileen zerrenda
     * @throws IllegalArgumentException erabiltzaileak nulua bada
     */
    public DBErabiltzaile(List<Erabiltzaile> erabiltzaileak) {
        if (erabiltzaileak == null) {
            throw new IllegalArgumentException("Erabiltzaileak zerrenda ezin da nulua izan.");
        }
        this.erabiltzaileak = new ArrayList<>(erabiltzaileak);
    }

    /**
     * Datubasetik erabiltzaileak kargatzen ditu.
     */
    public void erabiltzaileakKargatu() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseManager.konexioa();
            stmt = conn.createStatement();
            String sql = "SELECT E.ID, E.ERABILTZAILEA, E.PASAHITZA, E.MOTA, "
                    + "L.IZENA AS LANGILE_IZENA, L.ABIZENA AS LANGILE_ABIZENA, L.EMAILA AS LANGILE_EMAILA, "
                    + "B.IZENA AS BEZERO_IZENA, B.ABIZENA AS BEZERO_ABIZENA, B.EMAILA AS BEZERO_EMAILA "
                    + "FROM ERABILTZAILEAK E " + "LEFT JOIN LANGILE L ON E.ID = L.ID AND E.MOTA = 'S' "
                    + "LEFT JOIN BEZERO B ON E.ID = B.ID AND E.MOTA = 'B'";
            rs = stmt.executeQuery(sql);
            erabiltzaileak.clear();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String mota = rs.getString("MOTA");
                String izena = mota.equals("S") ? rs.getString("LANGILE_IZENA") : rs.getString("BEZERO_IZENA");
                String abizena = mota.equals("S") ? rs.getString("LANGILE_ABIZENA") : rs.getString("BEZERO_ABIZENA");
                String emaila = mota.equals("S") ? rs.getString("LANGILE_EMAILA") : rs.getString("BEZERO_EMAILA");
                String erabiltzailea = rs.getString("ERABILTZAILEA");
                String pasahitza = rs.getString("PASAHITZA");

                String kodea = id+mota;
                Erabiltzaile e = new Erabiltzaile(kodea, izena, abizena, emaila,
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
    
    /**
     * Erabiltzaileak kargatzen ditu JComboBox batean eta informazioa erakusten du testu-eremuetan.
     * 
     * @param comboBox erabiltzaileak erakusteko JComboBox
     * @param izena erabiltzailearen izena erakusteko testu-eremua
     * @param abizena erabiltzailearen abizena erakusteko testu-eremua
     * @param mota erabiltzailearen mota erakusteko testu-eremua
     */
    public static void kargatuErabiltzaileak(JComboBox<Erabiltzaile> comboBox, JTextField izena, JTextField abizena, JTextField mota) {
        DBErabiltzaile dbErabiltzaileak = new DBErabiltzaile();
        dbErabiltzaileak.erabiltzaileakKargatu();

        comboBox.removeAllItems();

        for (Erabiltzaile erabiltzailea : dbErabiltzaileak.getErabiltzaileak()) {
            comboBox.addItem(erabiltzailea);
            
        }
        
        List<Erabiltzaile> myErabiltzaileak = new ArrayList<>();
        for (int i = 0; i < comboBox.getItemCount(); i++) {
            myErabiltzaileak.add(comboBox.getItemAt(i));
        }
        
        comboBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Erabiltzaile selected = (Erabiltzaile) comboBox.getSelectedItem();
                if (selected != null) {
                    izena.setText(selected.getIzena());
                    abizena.setText(selected.getAbizena());
                    mota.setText(selected.getMota().equals("S") ? "Saltzailea" : "Bezeroa");
                }
            }
        });
    }

    /**
     * Erabiltzaileen zerrenda itzultzen du.
     * 
     * @return erabiltzaileen zerrenda
     */
    public List<Erabiltzaile> getErabiltzaileak() {
        return new ArrayList<>(erabiltzaileak);
    }

    /**
     * Erabiltzaileen zerrenda ezartzen du.
     * 
     * @param erabiltzaileak erabiltzaileen zerrenda
     * @throws IllegalArgumentException erabiltzaileak nulua bada
     */
    public void setErabiltzaileak(List<Erabiltzaile> erabiltzaileak) {
        if (erabiltzaileak == null) {
            throw new IllegalArgumentException("Erabiltzaileen zerrenda ezin da nulua izan.");
        }
        this.erabiltzaileak = new ArrayList<>(erabiltzaileak);
    }

    /**
     * Erabiltzaile bat gehitzen du zerrendara.
     * 
     * @param erabiltzailea gehituko den erabiltzailea
     * @throws IllegalArgumentException erabiltzailea nulua bada
     */
    public void gehituErabiltzailea(Erabiltzaile erabiltzailea) {
        if (erabiltzailea == null) {
            throw new IllegalArgumentException("Erabiltzailea ezin da nulua izan.");
        }
        this.erabiltzaileak.add(erabiltzailea);
    }

    /**
     * Erabiltzaile bat ezabatzen du datubasetik.
     * 
     * @param id ezabatzeko erabiltzailearen IDa
     * @param mota erabiltzailearen mota ('S' saltzailea edo 'B' bezeroa)
     */
    public static void ezabatuErabiltzailea(int id, String mota) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean eginda = false;

        try {
            conn = DatabaseManager.konexioa();
            String sql = "DELETE FROM ERABILTZAILEAK WHERE ID = ? AND MOTA = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, mota);
            int deletedRows = pstmt.executeUpdate();
            
            if (deletedRows > 0) {
                if (mota.equals("S")) {
                    sql = "DELETE FROM LANGILE WHERE ID = ?";
                } else if (mota.equals("B")) {
                    sql = "DELETE FROM BEZERO WHERE ID = ?";
                }
                
                pstmt.close();
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                pstmt.executeUpdate();
                
                eginda = true;
                JOptionPane.showMessageDialog(null, "Erabiltzailea ezabatu da!");
            } else {
                JOptionPane.showMessageDialog(null, "Ez da erabiltzailerik aurkitu.");
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Errorea erabiltzailea ezabatzean: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Errorea konexioa ixterakoan: " + e.getMessage());
            }
        }
        
        if (!eginda) {
            JOptionPane.showMessageDialog(null, "Erabiltzailea ezin izan da ezabatu.");
        }
    }
}