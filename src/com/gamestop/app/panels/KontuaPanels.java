package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DatabaseManager;
import com.gamestop.db.DBErabiltzaile;
import com.gamestop.model.user.Erabiltzaile;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.sql.*;
import java.util.Locale;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.text.NumberFormat;

/**
 * Erabiltzaileen kontuaren kudeaketa panelak sortzeko klasea.
 */
@SuppressWarnings("unused")
public class KontuaPanels {

    /**
     * Saltzaileen datu pertsonalak bistaratzeko panela sortzen du.
     * 
     * @return datu pertsonalak erakusten dituen JPanel
     */
    public static JPanel saltzaileenDatuPertsonalak() {
        JPanel panel = new JPanel(new BorderLayout());

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        // Nire kontua etiketa sortu
        JLabel nireKontuaLabel = new JLabel("Nire kontua", SwingConstants.CENTER);
        nireKontuaLabel.setFont(new Font("Arial", Font.BOLD, 26));
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(nireKontuaLabel, gbc);

        String[] labels = { "Izena:", "Abizena:", "Emaila:", "Telefonoa:", "Kontratazio data:", "ID Nagusia:" };
        String[] values = { Login.izena, Login.abizena, Login.emaila, Login.telefonoa,
                String.valueOf(Login.kontratazioData), String.valueOf(Login.idnagusi) };
        JTextField[] textFields = new JTextField[labels.length];

        // Etiketak eta testu-eremuak gehitu
        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i + 1;
            gbc.gridwidth = 1;
            gbc.anchor = GridBagConstraints.WEST;
            centerPanel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            textFields[i].setEditable(i != 0 && i != 1 && i != 4 && i != 5); // Izena, abizena, kontratazio data eta ID ezin dira editatu
            textFields[i].setText(values[i]);
            gbc.gridx = 1;
            centerPanel.add(textFields[i], gbc);
        }

        // Gorde botoia gehitu
        JButton gordeButton = new JButton("Gorde");
        gbc.gridx = 0;
        gbc.gridy = labels.length + 1;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(gordeButton, gbc);

        // Gorde botoiaren ekintza konfiguratu
        gordeButton.addActionListener(e -> {
            String emaila = textFields[2].getText();
            String telefonoa = textFields[3].getText();

            try {
                Connection conn = DatabaseManager.konexioa();
                Statement stmt = conn.createStatement();
                String sql = "UPDATE LANGILE SET EMAILA = '" + emaila + "', TELEFONOA = '" + telefonoa
                        + "' WHERE ID = '" + Login.id + "'";
                stmt.executeUpdate(sql);
                conn.close();
                JOptionPane.showMessageDialog(null, "Datuak eguneratu dira.");
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Errorea: ezin dira datuak eguneratu.");
                ex.printStackTrace();
            }
        });

        panel.add(centerPanel, BorderLayout.CENTER);
        return panel;
    }
    
    /**
     * Bezeroen datu pertsonalak bistaratzeko panela sortzen du.
     * 
     * @return datu pertsonalak erakusten dituen JPanel
     */
    public static JPanel bezeroenDatuPertsonalak() {
        JPanel panel = new JPanel(new BorderLayout());

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        // Nire kontua etiketa sortu
        JLabel nireKontuaLabel = new JLabel("Nire kontua", SwingConstants.CENTER);
        nireKontuaLabel.setFont(new Font("Arial", Font.BOLD, 26));
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(nireKontuaLabel, gbc);

        String[] labels = { "Izena:", "Abizena:", "Emaila:", "Helbidea:" };
        String[] values = { Login.izena, Login.abizena, Login.emaila, Login.helbidea };
        JTextField[] textFields = new JTextField[labels.length];

        // Etiketak eta testu-eremuak gehitu
        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i + 1;
            gbc.gridwidth = 1;
            gbc.anchor = GridBagConstraints.WEST;
            centerPanel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            textFields[i].setEditable(i != 0 && i != 1); // Izena eta abizena ezin dira editatu
            textFields[i].setText(values[i]);
            gbc.gridx = 1;
            centerPanel.add(textFields[i], gbc);
        }

        // Gorde botoia gehitu
        JButton gordeButton = new JButton("Gorde");
        gbc.gridx = 0;
        gbc.gridy = labels.length + 1;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(gordeButton, gbc);

        // Gorde botoiaren ekintza konfiguratu
        gordeButton.addActionListener(e -> {
            String emaila = textFields[2].getText();
            String helbidea = textFields[3].getText();

            try {
                Connection conn = DatabaseManager.konexioa();
                Statement stmt = conn.createStatement();
                String sql = "UPDATE BEZERO SET EMAILA = '" + emaila + "', HELBIDEA = '" + helbidea + "' WHERE ID = '"
                        + Login.id + "'";
                stmt.executeUpdate(sql);
                conn.close();
                JOptionPane.showMessageDialog(null, "Datuak eguneratu dira.");
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Errorea: ezin dira datuak eguneratu.");
                ex.printStackTrace();
            }
        });

        panel.add(centerPanel, BorderLayout.CENTER);
        return panel;
    }

    /**
     * Pasahitza aldatzeko panela sortzen du.
     * 
     * @return pasahitza aldatzeko aukerak erakusten dituen JPanel
     */
    public static JPanel pasahitzaPanela() {
        JPanel panel = new JPanel(new BorderLayout());

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        // Pasahitza aldatu etiketa sortu
        JLabel pasahitzaAldatuLabel = new JLabel("Pasahitza aldatu", SwingConstants.CENTER);
        pasahitzaAldatuLabel.setFont(new Font("Arial", Font.BOLD, 26));
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(pasahitzaAldatuLabel, gbc);

        String[] labels = { "Erabiltzaile-izena:", "Pasahitza:", "Pasahitza berria:", "Pasahitza berria errepikatu:" };
        String[] values = { Login.erabiltzailea, null, null, null };
        JTextField[] textFields = new JTextField[labels.length];

        // Etiketak eta testu-eremuak gehitu
        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i + 1;
            gbc.gridwidth = 1;
            gbc.anchor = GridBagConstraints.WEST;
            centerPanel.add(new JLabel(labels[i]), gbc);

            if (i == 1 || i == 2 || i == 3) {
                textFields[i] = new JPasswordField(10);
            } else {
                textFields[i] = new JTextField(10);
            }

            textFields[i].setEditable(i != 0); // Erabiltzaile-izena ezin da editatu
            textFields[i].setText(values[i]);
            gbc.gridx = 1;
            centerPanel.add(textFields[i], gbc);
        }

        // Gorde botoia gehitu
        JButton gordeButton = new JButton("Gorde");
        gbc.gridx = 0;
        gbc.gridy = labels.length + 1;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(gordeButton, gbc);

        // Gorde botoiaren ekintza konfiguratu
        gordeButton.addActionListener(e -> {
            String pasahitzaZaharra = new String(((JPasswordField) textFields[1]).getPassword());
            String pasahitzaBerria = new String(((JPasswordField) textFields[2]).getPassword());
            String pasahitzaBerriaErrepikatu = new String(((JPasswordField) textFields[3]).getPassword());

            // Pasahitz berriak berdinak direla egiaztatu
            if (!pasahitzaBerria.equals(pasahitzaBerriaErrepikatu)) {
                JOptionPane.showMessageDialog(null, "Errorea: pasahitzak ez datoz bat.");
                return;
            }

            try {
                Connection conn = DatabaseManager.konexioa();
                String sql = "{call PASAHITZA_EGUNERATU(?, ?, ?, ?, ?)}";
                CallableStatement cstmt = conn.prepareCall(sql);

                // Parametroak ezarri
                cstmt.setInt(1, Login.id);
                cstmt.setString(2, Login.erabiltzailea);
                cstmt.setString(3, Login.mota);
                cstmt.setString(4, pasahitzaZaharra);
                cstmt.setString(5, pasahitzaBerria);

                cstmt.execute();

                JOptionPane.showMessageDialog(null, "Pasahitza eguneratu da.");

                cstmt.close();
                conn.close();
            } catch (SQLException ex) {
                if (ex.getErrorCode() == 20001) {
                    JOptionPane.showMessageDialog(null, "Errorea: pasahitza okerra da.");
                } else {
                    JOptionPane.showMessageDialog(null, "Errorea: ezin da pasahitza eguneratu.");
                    ex.printStackTrace();
                }
            }
        });

        panel.add(centerPanel, BorderLayout.CENTER);
        return panel;
    }
    
    /**
     * Bezeroen informea sortzeko panela sortzen du.
     * 
     * @return informea sortzeko aukerak erakusten dituen JPanel
     */
    @SuppressWarnings("serial")
    public static JPanel informeakSortu() {
        JPanel mainPanel = new JPanel(new BorderLayout(5, 5));
        mainPanel.setBorder(new EmptyBorder(10, 10, 10, 10));
        
        // Panel superior con ComboBox
        JPanel topPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel label = new JLabel("Aukeratu bezeroa:");
        JComboBox<Erabiltzaile> clientComboBox = new JComboBox<>();
        topPanel.add(label);
        topPanel.add(clientComboBox);
        
        // Área de texto con scroll
        JTextArea textArea = new JTextArea(20, 50);
        textArea.setBorder(new EmptyBorder(10, 10, 10, 10));
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);
        
        // Botón de vale (inicialmente deshabilitado)
        JButton valeButton = new JButton("Balea sortu");
        valeButton.setEnabled(false);
        
        // Array para almacenar el dinero a devolver
        final double[] itzuliDirua = new double[1];
        
        try {
            // Cargar usuarios desde la base de datos
            DBErabiltzaile dbErabiltzaile = new DBErabiltzaile();
            dbErabiltzaile.erabiltzaileakKargatu();
            
            // Configurar modelo del ComboBox solo con clientes (tipo "B")
            DefaultComboBoxModel<Erabiltzaile> model = new DefaultComboBoxModel<>();
            for (Erabiltzaile erabiltzailea : dbErabiltzaile.getErabiltzaileak()) {
                if ("B".equals(erabiltzailea.getMota())) {
                    model.addElement(erabiltzailea);
                }
            }
            
            if (model.getSize() == 0) {
                textArea.setText("Ez daude bezeroak erregistratuta.");
            }
            
            clientComboBox.setModel(model);
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(mainPanel, 
                "Errorea bezeroak kargatzean: " + e.getMessage(), 
                "Errorea", 
                JOptionPane.ERROR_MESSAGE);
        }
        
        // Renderer personalizado para mostrar nombre y apellido
        clientComboBox.setRenderer(new DefaultListCellRenderer() {
            @Override
            public Component getListCellRendererComponent(JList<?> list, Object value, int index, 
                    boolean isSelected, boolean cellHasFocus) {
                super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
                if (value instanceof Erabiltzaile) {
                    Erabiltzaile e = (Erabiltzaile) value;
                    setText(e.getIzena() + " " + e.getAbizena());
                }
                return this;
            }
        });
        
        // Listener para cuando se selecciona un cliente
        clientComboBox.addItemListener(e -> {
            if (e.getStateChange() == ItemEvent.SELECTED) {
                Erabiltzaile selected = (Erabiltzaile) clientComboBox.getSelectedItem();
                if (selected != null && "B".equals(selected.getMota())) {
                    bezeroarenInformazioaKargatu(selected, textArea, valeButton, itzuliDirua);
                }
            }
        });
        
        // Listener para el botón de vale
        valeButton.addActionListener(crearValeListener(itzuliDirua));
        
        // Añadir componentes al panel principal
        mainPanel.add(topPanel, BorderLayout.NORTH);
        mainPanel.add(scrollPane, BorderLayout.CENTER);
        mainPanel.add(valeButton, BorderLayout.SOUTH);
        
        return mainPanel;
    }

    /**
     * Bezeroaren informazioa kargatzen du eta testu-eremuan bistaratzen du.
     */
    private static void bezeroarenInformazioaKargatu(Erabiltzaile erabiltzailea, JTextArea textArea, 
            JButton valeButton, double[] itzuliDirua) {
        textArea.setText(""); // Limpiar el área de texto
        
        try (Connection conn = DatabaseManager.getConnection()) {
            // Habilitar DBMS_OUTPUT con un tamaño adecuado
            try (CallableStatement enable = conn.prepareCall("BEGIN DBMS_OUTPUT.ENABLE(1000000); END;")) {
                enable.execute();
            }
            
            // Llamar al procedimiento almacenado
            try (CallableStatement cs = conn.prepareCall("{call P_INFO_BEZERO(?, ?)}")) {
                cs.setInt(1, Integer.parseInt(erabiltzailea.getId().replace("B", "")));
                cs.registerOutParameter(2, Types.NUMERIC);
                cs.execute();
                
                // Obtener el dinero a devolver
                itzuliDirua[0] = cs.getDouble(2);
                valeButton.setEnabled(itzuliDirua[0] > 0);
                
                // Leer la salida de DBMS_OUTPUT
                try (CallableStatement getLine = conn.prepareCall("BEGIN DBMS_OUTPUT.GET_LINE(?, ?); END;")) {
                    getLine.registerOutParameter(1, Types.VARCHAR);
                    getLine.registerOutParameter(2, Types.INTEGER);
                    
                    StringBuilder output = new StringBuilder();
                    while (true) {
                        getLine.execute();
                        if (getLine.getInt(2) != 0) break;
                        output.append(getLine.getString(1)).append("\n");
                    }
                    
                    textArea.setText(output.toString());
                }
            }
            
        } catch (SQLException e) {
            String errorMsg;
            switch (e.getErrorCode()) {
                case 20010:
                    errorMsg = "Bezeroa ez da existitzen.";
                    break;
                case 20001:
                    errorMsg = "Errorea datu-basean: " + e.getMessage();
                    break;
                default:
                    errorMsg = "Errore ezezaguna bezeroaren informazioa kargatzean.";
                    break;
            }
            
            JOptionPane.showMessageDialog(null, 
                errorMsg, 
                "Errorea", 
                JOptionPane.ERROR_MESSAGE);
            valeButton.setEnabled(false);
            textArea.setText("Ezin izan da bezeroaren informazioa kargatu.");
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(null, 
                "Bezeroaren ID-a ez da baliozkoa.", 
                "Errorea", 
                JOptionPane.ERROR_MESSAGE);
            valeButton.setEnabled(false);
        }
    }

    /**
     * Listenerra sortzen du, balearen informazioa erakusteko.
     */
    private static ActionListener crearValeListener(double[] itzuliDirua) {
        return e -> {
            try {
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.GERMANY);
                String formattedMoney = currencyFormat.format(itzuliDirua[0]);

                JTextArea valeArea = new JTextArea();
                valeArea.setEditable(false);
                valeArea.setText(
                    "=============================\n" +
                    "         ITZULKETA BALEA\n" +
                    "=============================\n" +
                    "Itzuli den diru kantitatea:\n" +
                    formattedMoney + "\n" +
                    "=============================\n" +
                    "   Eskerrik asko zure konfiantzagatik.\n"
                );

                JOptionPane.showMessageDialog(
                    null, 
                    new JScrollPane(valeArea), 
                    "Balea", 
                    JOptionPane.INFORMATION_MESSAGE);
                    
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(
                    null, 
                    "Errorea balea sortzean: " + ex.getMessage(), 
                    "Errorea", 
                    JOptionPane.ERROR_MESSAGE);
            }
        };
    }
}