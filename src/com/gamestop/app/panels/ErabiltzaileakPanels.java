package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DBErabiltzaile;
import com.gamestop.db.DatabaseManager;
import com.gamestop.model.user.Erabiltzaile;

import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

/**
 * Erabiltzaileak kudeatzeko panelak sortzen dituen klasea.
 * Klase honek saltzaileak eta bezeroak gehitzeko, ezabatzeko eta editatzeko aukerak eskaintzen ditu.
 */
@SuppressWarnings("unused")
public class ErabiltzaileakPanels {

    /**
     * Saltzailea gehitzeko panela sortzen du.
     * 
     * @return Saltzailea gehitzeko JPanel objektua
     */
    public static JPanel saltzaileaGehitu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        String[] labels = {"Izena:", "Abizena:", "Emaila:", "Telefonoa:", "ID Nagusia:"};
        JTextField[] textFields = new JTextField[labels.length];

        // Etiketak eta testu-eremuak sortu
        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i;
            panel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            gbc.gridx = 1;
            panel.add(textFields[i], gbc);
        }

        JButton gehituBotoia = new JButton("Gehitu");
        gbc.gridx = 0;
        gbc.gridy = labels.length;
        gbc.gridwidth = 2;
        panel.add(gehituBotoia, gbc);

        gehituBotoia.addActionListener(e -> gehituSaltzailea(textFields));

        return panel;
    }

    /**
     * Saltzailea datu-basean gordetzen du.
     * 
     * @param textFields Datuak dituen testu-eremu array-a
     */
    private static void gehituSaltzailea(JTextField[] textFields) {
        try {
            String idNagusia = textFields[4].getText().isEmpty() ? "NULL" : textFields[4].getText();
            
            String sql = "INSERT INTO LANGILE (ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA) " +
                         "VALUES ((SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), ?, ?, ?, ?, SYSDATE, ?, 30000)";
            
            try (Connection conn = DatabaseManager.konexioa();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                pstmt.setString(1, textFields[0].getText());
                pstmt.setString(2, textFields[1].getText());
                pstmt.setString(3, textFields[2].getText());
                pstmt.setString(4, textFields[3].getText());
                pstmt.setString(5, idNagusia.equals("NULL") ? null : idNagusia);
                
                pstmt.executeUpdate();
                
                // Erabiltzailea sortu
                DatabaseManager.erabiltzaileaSortu("ERABILTZAILEAK", "ID, ERABILTZAILEA, PASAHITZA, MOTA",
                    "ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS ERABILTZAILEA, " +
                    "LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS PASAHITZA, 'S' AS MOTA " +
                    "FROM LANGILE WHERE ID = (SELECT MAX(ID) FROM LANGILE)");
                
                JOptionPane.showMessageDialog(null, "Saltzailea ondo gehitu da.");
                garbituEremuak(textFields);
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea saltzailea gehitzean: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Bezeroa gehitzeko panela sortzen du.
     * 
     * @return Bezeroa gehitzeko JPanel objektua
     */
    public static JPanel bezeroaGehitu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        String[] labels = {"Izena:", "Abizena:", "Emaila:", "Helbidea:"};
        JTextField[] textFields = new JTextField[labels.length];

        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i;
            panel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            gbc.gridx = 1;
            panel.add(textFields[i], gbc);
        }

        JButton gehituBotoia = new JButton("Gehitu");
        gbc.gridx = 0;
        gbc.gridy = labels.length;
        gbc.gridwidth = 2;
        panel.add(gehituBotoia, gbc);

        gehituBotoia.addActionListener(e -> gehituBezeroa(textFields));

        return panel;
    }

    /**
     * Bezeroa datu-basean gordetzen du.
     * 
     * @param textFields Datuak dituen testu-eremu array-a
     */
    private static void gehituBezeroa(JTextField[] textFields) {
        try (Connection conn = DatabaseManager.konexioa()) {
            // Bezeroa gehitu
            String sqlBezero = "INSERT INTO BEZERO (ID, IZENA, ABIZENA, EMAILA, HELBIDEA) " +
                               "VALUES ((SELECT NVL(MAX(ID), 0) + 1 FROM BEZERO), ?, ?, ?, ?)";
            
            try (PreparedStatement pstmtBezero = conn.prepareStatement(sqlBezero)) {
                pstmtBezero.setString(1, textFields[0].getText());
                pstmtBezero.setString(2, textFields[1].getText());
                pstmtBezero.setString(3, textFields[2].getText());
                pstmtBezero.setString(4, textFields[3].getText());
                pstmtBezero.executeUpdate();
            }

            // Erabiltzailea sortu
            String sqlErabiltzaile = "INSERT INTO ERABILTZAILEAK (ID, ERABILTZAILEA, PASAHITZA, MOTA) " +
                                     "SELECT ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA), " +
                                     "LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA), 'B' " +
                                     "FROM BEZERO WHERE ID = (SELECT MAX(ID) FROM BEZERO)";
            
            try (Statement stmtErabiltzaile = conn.createStatement()) {
                stmtErabiltzaile.executeUpdate(sqlErabiltzaile);
            }

            JOptionPane.showMessageDialog(null, "Bezeroa ondo gehitu da.");
            garbituEremuak(textFields);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea bezeroa gehitzean: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Erabiltzailea ezabatzeko panela sortzen du.
     * 
     * @return Erabiltzailea ezabatzeko JPanel objektua
     */
    public static JPanel erabiltzaileaEzabatu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        JComboBox<Erabiltzaile> comboBox = new JComboBox<>();
        JTextField izenaField = Login.sortuTextFieldEditatugabea(20);
        JTextField abizenaField = Login.sortuTextFieldEditatugabea(20);
        JTextField motaField = Login.sortuTextFieldEditatugabea(20);
        JButton ezabatuBotoia = new JButton("Ezabatu");

        // UI konfigurazioa
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Aukeratu erabiltzailea:", comboBox, 0, 0);
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 2;
        panel.add(new JSeparator(), gbc);
        gbc.gridwidth = 1;
        
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Izena:", izenaField, 0, 2);
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Abizena:", abizenaField, 0, 4);
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Mota:", motaField, 0, 6);
        
        gbc.gridx = 0;
        gbc.gridy = 8;
        gbc.gridwidth = 2;
        panel.add(ezabatuBotoia, gbc);

        // Datuak kargatu
        DBErabiltzaile.kargatuErabiltzaileak(comboBox, izenaField, abizenaField, motaField);

        // Ezabatzeko ekintza
        ezabatuBotoia.addActionListener(e -> {
            Erabiltzaile hautatua = (Erabiltzaile) comboBox.getSelectedItem();
            if (hautatua != null) {
                int erantzuna = JOptionPane.showConfirmDialog(panel, 
                    "Ziur zaude " + hautatua.getIzena() + " " + hautatua.getAbizena() + " ezabatu nahi duzula?", 
                    "Berretsi Ezabatzea", JOptionPane.YES_NO_OPTION);

                if (erantzuna == JOptionPane.YES_OPTION) {
                    int id = Integer.parseInt(hautatua.getId().replaceAll("[^0-9]", ""));
                    DBErabiltzaile.ezabatuErabiltzailea(id, hautatua.getMota());
                    DBErabiltzaile.kargatuErabiltzaileak(comboBox, izenaField, abizenaField, motaField);
                }
            }
        });

        return panel;
    }

    /**
     * Erabiltzaileak kontsultatzeko panela sortzen du.
     * 
     * @return Erabiltzaileen zerrenda erakusten duen JPanel objektua
     */
    public static JPanel erabiltzaileakKontsultatu() {
        JPanel panel = new JPanel(new BorderLayout(10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        JLabel goiburukoa = new JLabel("Erabiltzaileen zerrenda", SwingConstants.CENTER);
        goiburukoa.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(goiburukoa, BorderLayout.NORTH);

        // Taularen modeloaren definizioa
        String[] zutabeIzenak = {"ID", "Izena", "Abizena", "Emaila", "Mota"};
        @SuppressWarnings("serial")
        DefaultTableModel modeloa = new DefaultTableModel(zutabeIzenak, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        // Datu-baseko erabiltzaileak kargatu eta taulara gehitu, zutabez zutabe
        kargatuErabiltzaileak(modeloa);
        
        // Taula eta scrolla
        JTable taula = new JTable(modeloa);
        taula.setAutoCreateRowSorter(true);
        JScrollPane scrollPane = new JScrollPane(taula);
        panel.add(scrollPane, BorderLayout.CENTER);

        // Menu kontextuala sortu
        JPopupMenu popupMenu = new JPopupMenu();
        JMenuItem editatuItem = new JMenuItem("Editatu");
        JMenuItem ezabatuItem = new JMenuItem("Ezabatu");
        popupMenu.add(editatuItem);
        popupMenu.add(ezabatuItem);

        // Menu kontextuala gehitu taulara
        taula.setComponentPopupMenu(popupMenu);
        taula.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent e) {
                int row = taula.rowAtPoint(e.getPoint());
                taula.getSelectionModel().setSelectionInterval(row, row);
                
                if (SwingUtilities.isRightMouseButton(e)) {
                    popupMenu.show(taula, e.getX(), e.getY());
                }
            }
        });

        // Menu kontextualaren "editatu" botoia
        editatuItem.addActionListener(e -> {
            int selectedRow = taula.getSelectedRow();
            if (selectedRow >= 0) {
                int modelRow = taula.convertRowIndexToModel(selectedRow);
                String id = modeloa.getValueAt(modelRow, 0).toString();
                String mota = modeloa.getValueAt(modelRow, 4).toString().equals("Saltzailea") ? "S" : "B";
                
                DBErabiltzaile db = new DBErabiltzaile();
                db.erabiltzaileakKargatu();
                
                Erabiltzaile erabiltzailea = db.getErabiltzaileak().stream()
                    .filter(erab -> erab.getId().replaceAll("[^0-9]", "").equals(id) && erab.getMota().equals(mota))
                    .findFirst()
                    .orElse(null);
                
                if (erabiltzailea != null) {
                    JPanel editPanel = sortuEditatuPanela(erabiltzailea);
                    JOptionPane.showMessageDialog(panel, editPanel, "Erabiltzailea editatu", JOptionPane.PLAIN_MESSAGE);
                    
                    // Taula eguneratu
                    modeloa.setValueAt(erabiltzailea.getEmaila(), selectedRow, 3);
                } else {
                    JOptionPane.showMessageDialog(panel, 
                        "Ezin izan da erabiltzailea aurkitu. Saiatu zerrenda eguneratzen.", 
                        "Errorea", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        // Menu kontextualaren "ezabatu" botoia
        ezabatuItem.addActionListener(e -> {
            int selectedRow = taula.getSelectedRow();
            if (selectedRow >= 0) {
                String id = taula.getValueAt(selectedRow, 0).toString();
                String mota = taula.getValueAt(selectedRow, 4).toString().equals("Saltzailea") ? "S" : "B";
                
                int confirm = JOptionPane.showConfirmDialog(panel, 
                    "Ziur zaude erabiltzailea ezabatu nahi duzula?", 
                    "Berretsi ezabatzea", JOptionPane.YES_NO_OPTION);
                
                if (confirm == JOptionPane.YES_OPTION) {
                    DBErabiltzaile.ezabatuErabiltzailea(Integer.parseInt(id), mota);
                    modeloa.removeRow(selectedRow);
                }
            }
        });

        // Eguneratzeko botoia
        JButton eguneratuBotoia = new JButton("Eguneratu zerrenda");
        eguneratuBotoia.addActionListener(e -> {
            modeloa.setRowCount(0);
            kargatuErabiltzaileak(modeloa);
        });

        JPanel botoiPanela = new JPanel();
        botoiPanela.add(eguneratuBotoia);
        panel.add(botoiPanela, BorderLayout.SOUTH);

        return panel;
    }
    
    /**
     * Testu-eremuak garbitzen ditu.
     * 
     * @param eremuak Garbitu beharreko testu-eremu array-a
     */
    private static void garbituEremuak(JTextField[] eremuak) {
        for (JTextField eremua : eremuak) {
            eremua.setText("");
        }
    }

    /**
     * Erabiltzaileak kargatzen ditu taula modelo batean.
     * 
     * @param modeloa Datuak gehitzeko taula modelo
     */
    private static void kargatuErabiltzaileak(DefaultTableModel modeloa) {
        DBErabiltzaile db = new DBErabiltzaile();
        db.erabiltzaileakKargatu();
        
        for (Erabiltzaile e : db.getErabiltzaileak()) {
            modeloa.addRow(new Object[]{
                e.getId().replaceAll("[^0-9]", ""),
                e.getIzena(),
                e.getAbizena(),
                e.getEmaila(),
                e.getMota().equals("S") ? "Saltzailea" : "Bezeroa"
            });
        }
    }

    /**
     * Erabiltzailea editatzeko panela sortzen du.
     * 
     * @param erabiltzailea Editatu beharreko erabiltzailea
     * @return Editatzeko panela
     */
    private static JPanel sortuEditatuPanela(Erabiltzaile erabiltzailea) {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;

        // Datuak erakusteko etiketak
        gbc.gridx = 0; gbc.gridy = 0;
        panel.add(new JLabel("Izena:"), gbc);
        gbc.gridy++;
        panel.add(new JLabel("Abizena:"), gbc);
        gbc.gridy++;
        panel.add(new JLabel("Emaila:"), gbc);

        // Datuak erakusteko testu-eremuak
        gbc.gridx = 1; gbc.gridy = 0;
        JTextField izenaField = new JTextField(erabiltzailea.getIzena(), 20);
        izenaField.setEditable(false);
        panel.add(izenaField, gbc);
        
        gbc.gridy++;
        JTextField abizenaField = new JTextField(erabiltzailea.getAbizena(), 20);
        abizenaField.setEditable(false);
        panel.add(abizenaField, gbc);
        
        gbc.gridy++;
        JTextField emailaField = new JTextField(erabiltzailea.getEmaila(), 20);
        panel.add(emailaField, gbc);

        // Gorde botoia
        JButton gordeBotoia = new JButton("Gorde aldaketak");
        gbc.gridx = 0; gbc.gridy++;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        panel.add(gordeBotoia, gbc);

        gordeBotoia.addActionListener(e -> {
            // Emaila eguneratu
            erabiltzailea.setEmaila(emailaField.getText());
            
            // Datu-basean eguneratu
            try (Connection conn = DatabaseManager.konexioa()) {
                String sql;
                if (erabiltzailea.getMota().equals("S")) {
                    sql = "UPDATE LANGILE SET EMAILA = ? WHERE ID = ?";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, emailaField.getText());
                        pstmt.setInt(2, Integer.parseInt(erabiltzailea.getId().replaceAll("[^0-9]", "")));
                        pstmt.executeUpdate();
                    }
                } else {
                    sql = "UPDATE BEZERO SET EMAILA = ? WHERE ID = ?";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, emailaField.getText());
                        pstmt.setInt(2, Integer.parseInt(erabiltzailea.getId().replaceAll("[^0-9]", "")));
                        pstmt.executeUpdate();
                    }
                }
                
                JOptionPane.showMessageDialog(panel, "Aldaketak ongi gorde dira!", "Arrakasta", JOptionPane.INFORMATION_MESSAGE);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(panel, "Errorea datuak eguneratzean: " + ex.getMessage(), "Errorea", JOptionPane.ERROR_MESSAGE);
                ex.printStackTrace();
            }
        });

        return panel;
    }
}