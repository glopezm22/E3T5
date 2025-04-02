package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DBErabiltzaile;
import com.gamestop.db.DatabaseManager;
import com.gamestop.model.user.Erabiltzaile;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JSeparator;
import javax.swing.JTextField;

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

    public static JPanel erabiltzaileakKontsultatu() {
        JPanel panel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        JLabel labelComboBox = new JLabel("Aukeratu erabiltzailea:");
        gbc.gridx = 0;
        gbc.gridy = 0;
        panel.add(labelComboBox, gbc);

        JComboBox<Erabiltzaile> comboBoxErabiltzaileak = new JComboBox<>();
        gbc.gridx = 1;
        panel.add(comboBoxErabiltzaileak, gbc);

        JSeparator separator = new JSeparator();
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        panel.add(separator, gbc);

        JTextField izenaField = Login.sortuTextFieldEditatugabea(20);
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        panel.add(new JLabel("Izena:"), gbc);
        gbc.gridy = 3;
        panel.add(izenaField, gbc);

        JTextField abizenaField = Login.sortuTextFieldEditatugabea(20);
        gbc.gridy = 4;
        panel.add(new JLabel("Abizena:"), gbc);
        gbc.gridy = 5;
        panel.add(abizenaField, gbc);

        JTextField motaField = Login.sortuTextFieldEditatugabea(20);
        gbc.gridy = 6;
        panel.add(new JLabel("Mota:"), gbc);
        gbc.gridy = 7;
        panel.add(motaField, gbc);

        DBErabiltzaile.kargatuErabiltzaileak(comboBoxErabiltzaileak, izenaField, abizenaField, motaField);

        return panel;
    }
}