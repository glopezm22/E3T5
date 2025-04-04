package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DBErabiltzaile;
import com.gamestop.db.DatabaseManager;
import com.gamestop.model.user.Erabiltzaile;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;

@SuppressWarnings("unused")
public class ErabiltzaileakPanels {

    public static JPanel saltzaileaGehitu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        String[] labels = { "Izena:", "Abizena:", "Emaila:", "Telefonoa:", "ID Nagusia:" };
        JTextField[] textFields = new JTextField[labels.length];

        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i;
            panel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            gbc.gridx = 1;
            panel.add(textFields[i], gbc);
        }

        JButton gehituSaltzailea = new JButton("Gehitu");
        gbc.gridx = 0;
        gbc.gridy = labels.length;
        gbc.gridwidth = 2;
        panel.add(gehituSaltzailea, gbc);

        gehituSaltzailea.addActionListener(e -> {
            if (textFields[4].getText().isEmpty()) {
                DatabaseManager.saltzaileEdoBezeroSortu("LANGILE",
                        "ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA",
                        "(SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), '" + textFields[0].getText() + "', '"
                                + textFields[1].getText() + "', '" + textFields[2].getText() + "', '"
                                + textFields[3].getText() + "', SYSDATE, NULL, 30000");

            } else {
                DatabaseManager.saltzaileEdoBezeroSortu("LANGILE",
                        "ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA",
                        "(SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), '" + textFields[0].getText() + "', '"
                                + textFields[1].getText() + "', '" + textFields[2].getText() + "', '"
                                + textFields[3].getText() + "', SYSDATE, " + textFields[4].getText() + ", 30000");

            }
            DatabaseManager.erabiltzaileaSortu("ERABILTZAILEAK", "ID, ERABILTZAILEA, PASAHITZA, MOTA",
                    "ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS ERABILTZAILEA, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS PASAHITZA, 'S' AS MOTA FROM LANGILE WHERE ID = (SELECT MAX(ID) FROM LANGILE)");
            for (int i = 0; i < labels.length; i++) {
                textFields[i].setText("");
            }

            DBErabiltzaile db = new DBErabiltzaile();
            db.erabiltzaileakKargatu();
        });
        return panel;
    }

    public static JPanel bezeroaGehitu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        String[] labels = { "Izena:", "Abizena:", "Emaila:", "Helbidea:" };
        JTextField[] textFields = new JTextField[labels.length];

        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i;
            panel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            gbc.gridx = 1;
            panel.add(textFields[i], gbc);
        }

        JButton gehituBezeroa = new JButton("Gehitu");
        gbc.gridx = 0;
        gbc.gridy = labels.length;
        gbc.gridwidth = 2;
        panel.add(gehituBezeroa, gbc);

        gehituBezeroa.addActionListener(e -> {
            try {
                Connection conn = DatabaseManager.konexioa();
                Statement stmt = conn.createStatement();
                String sqlInsertBEZERO = "INSERT INTO BEZERO (ID, IZENA, ABIZENA, EMAILA, HELBIDEA) VALUES ((SELECT NVL(MAX(ID), 0) + 1 FROM BEZERO),'"
                        + textFields[0].getText() + "', '" + textFields[1].getText() + "', '" + textFields[2].getText()
                        + "', '" + textFields[3].getText() + "')";
                stmt.executeUpdate(sqlInsertBEZERO);
                String sqlInsertERABILTZAILEAK = "INSERT INTO ERABILTZAILEAK (ID, ERABILTZAILEA, PASAHITZA, MOTA) SELECT ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS ERABILTZAILEA, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS PASAHITZA, 'B' AS MOTA FROM BEZERO WHERE ID = (SELECT MAX(ID) FROM BEZERO)";
                stmt.executeUpdate(sqlInsertERABILTZAILEAK);
                conn.close();
                JOptionPane.showMessageDialog(null, "Bezeroa gehitu da.");
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Errorea: bezeroa ezin da gehitu.");
                ex.printStackTrace();
            }
            for (int i = 0; i < labels.length; i++) {
                textFields[i].setText("");
            }

            DBErabiltzaile db = new DBErabiltzaile();
            db.erabiltzaileakKargatu();
        });
        return panel;
    }

    public static JPanel erabiltzaileaEzabatu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        JComboBox<Erabiltzaile> comboBoxErabiltzaileak = new JComboBox<>();
        JTextField izenaField = Login.sortuTextFieldEditatugabea(20);
        JTextField abizenaField = Login.sortuTextFieldEditatugabea(20);
        JTextField motaField = Login.sortuTextFieldEditatugabea(20);
        JButton ezabatuButton = new JButton("Ezabatu");

        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Aukeratu erabiltzailea:", comboBoxErabiltzaileak, 0, 0);
        
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel.add(new JSeparator(), gbc);
        gbc.gridwidth = 1;
        gbc.fill = GridBagConstraints.NONE;
        
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Izena:", izenaField, 0, 2);
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Abizena:", abizenaField, 0, 4);
        Login.sortuKonponenteaEtiketarekin(panel, gbc, "Mota:", motaField, 0, 6);
            
        gbc.gridx = 0;
        gbc.gridy = 8;
        gbc.gridwidth = 2;
        panel.add(ezabatuButton, gbc);
        
        DBErabiltzaile.kargatuErabiltzaileak(comboBoxErabiltzaileak, izenaField, abizenaField, motaField);

        ezabatuButton.addActionListener(e -> {
            Erabiltzaile selected = (Erabiltzaile) comboBoxErabiltzaileak.getSelectedItem();
            if (selected != null) {
                int erantzuna = JOptionPane.showConfirmDialog(panel, 
                    "Ziur zaude " + selected.getIzena() + " " + selected.getAbizena() + " ezabatu nahi duzula?", 
                    "Berretsi Ezabatzea", JOptionPane.YES_NO_OPTION);

                if (erantzuna == JOptionPane.YES_OPTION) {
                	int idDB = Integer.parseInt(selected.getId().substring(0, selected.getId().length() - 1));
                    DBErabiltzaile.ezabatuErabiltzailea(idDB, selected.getMota());
                    DBErabiltzaile.kargatuErabiltzaileak(comboBoxErabiltzaileak, izenaField, abizenaField, motaField);
                }
            }
        });

        return panel;
    }

    @SuppressWarnings("serial")
    public static JPanel erabiltzaileakKontsultatu() {
        JPanel panel = new JPanel(new BorderLayout(10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        @SuppressWarnings("unchecked")
		final List<Erabiltzaile>[] erabiltzaileakHolder = new List[]{null};

        JLabel goiburukoa = new JLabel("Erabiltzaileen zerrenda", SwingConstants.CENTER);
        goiburukoa.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(goiburukoa, BorderLayout.NORTH);

        // Taularen modeloaren definizioa
        String[] zutabeIzenak = {"ID", "Izena", "Abizena", "Emaila", "Mota"};
        DefaultTableModel modeloa = new DefaultTableModel(zutabeIzenak, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        // Datu-baseko erabiltzaileak kargatu
        DBErabiltzaile db = new DBErabiltzaile();
        db.erabiltzaileakKargatu();
        List<Erabiltzaile> erabiltzaileak = db.getErabiltzaileak();

        // Erabiltzaileak taulara gehitu, zutabez zutabe
        for (Erabiltzaile e : erabiltzaileak) {
            modeloa.addRow(new Object[]{
                e.getId().replaceAll("[^0-9]", ""),
                e.getIzena(),
                e.getAbizena(),
                e.getEmaila(),
                e.getMota().equals("S") ? "Saltzailea" : "Bezeroa"
            });
        }

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
                
                // Erabiltzaileen lista eguneratu
                db.erabiltzaileakKargatu();
                erabiltzaileakHolder[0] = db.getErabiltzaileak();
                
                // Aurkitutako erabiltzailea bilatu
                Erabiltzaile erabiltzailea = null;
                for (Erabiltzaile erab : erabiltzaileak) {
                    if (erab.getId().replaceAll("[^0-9]", "").equals(id) && 
                        erab.getMota().equals(mota)) {
                        erabiltzailea = erab;
                        break;
                    }
                }
                
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
            db.erabiltzaileakKargatu();
            for (Erabiltzaile ee : db.getErabiltzaileak()) {
                modeloa.addRow(new Object[]{
                    ee.getId().replaceAll("[^0-9]", ""),
                    ee.getIzena(),
                    ee.getAbizena(),
                    ee.getEmaila(),
                    ee.getMota().equals("S") ? "Saltzailea" : "Bezeroa"
                });
            }
        });

        JPanel botoiPanela = new JPanel();
        botoiPanela.add(eguneratuBotoia);
        panel.add(botoiPanela, BorderLayout.SOUTH);

        return panel;
    }

    /**
     * Erabiltzailea editatzeko panela sortzen du
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

        // Datuak erakusteko testu-eremuak (editaezinak)
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