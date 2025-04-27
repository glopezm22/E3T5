package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DatabaseManager;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import java.text.SimpleDateFormat;

/**
 * Eskariak kudeatzeko panelak sortzen dituen klasea.
 * Bezeroen eta saltzaileen eskariak kontsultatzeko aukerak eskaintzen ditu.
 */
@SuppressWarnings("unused")
public class EskariakPanels {

    /**
     * Saltzaileen eskariak bistaratzeko panela sortzen du.
     * @return Eskarien historiala erakusten duen JPanel objektua
     */
    public static JPanel eskariakBistaratu() {
        JPanel panel = new JPanel(new BorderLayout());
        JLabel goiburua = new JLabel("Historiala", SwingConstants.CENTER);
        goiburua.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(goiburua, BorderLayout.NORTH);

        JPanel erdikoPanela = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.WEST;

        // UI osagaiak sortu
        JComboBox<String> comboBoxHistoriala = new JComboBox<>();
        JTextField txtEskariId = Login.sortuTextFieldEditatugabea(10);
        JTextField txtBezeroa = Login.sortuTextFieldEditatugabea(20);
        JTextField txtData = Login.sortuTextFieldEditatugabea(15);
        JTextField txtEgoera = Login.sortuTextFieldEditatugabea(15);

        // Erabiltzaile ID balidatu
        int id = Login.id;
        if (id <= 0) {
            JOptionPane.showMessageDialog(null, "Errorea: Erabiltzaile ID baliogabea.");
            return panel;
        }

        // Eskariak kargatu
        kargatuSaltzaileenEskariak(comboBoxHistoriala, id);

        // ComboBox-aren listener-a gehitu
        comboBoxHistoriala.addActionListener(e -> {
            String aukeratutakoEskaria = (String) comboBoxHistoriala.getSelectedItem();
            if (aukeratutakoEskaria != null && !aukeratutakoEskaria.isEmpty()) {
                try {
                    int eskariId = Integer.parseInt(aukeratutakoEskaria.split(" ")[1]);
                    kargatuSaltzaileenEskarienInformazioa(eskariId, txtEskariId, txtBezeroa, txtData, txtEgoera);
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(null, "Errorea: Eskari ID formatu okerra.");
                }
            }
        });

        // Osagaiak panelera gehitu
        Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Aukeratu eskaria:", comboBoxHistoriala, 0, 0);
        Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Eskari ID:", txtEskariId, 0, 1);
        Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Bezeroa:", txtBezeroa, 0, 2);
        Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Data:", txtData, 0, 3);
        Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Egoera:", txtEgoera, 0, 4);

        panel.add(erdikoPanela, BorderLayout.CENTER);
        return panel;
    }

    /**
     * Saltzaileen eskariak kargatzen ditu ComboBox batean.
     * @param comboBox Datuak kargatzeko ComboBox
     * @param saltzaileId Saltzailearen ID-a
     */
    private static void kargatuSaltzaileenEskariak(JComboBox<String> comboBox, int saltzaileId) {
        if (comboBox == null) {
            JOptionPane.showMessageDialog(null, "Errorea: ComboBox ezin da null izan.");
            return;
        }

        if (saltzaileId <= 0) {
            JOptionPane.showMessageDialog(null, "Errorea: Saltzaile ID baliogabea.");
            return;
        }

        try (Connection conn = DatabaseManager.konexioa();
             PreparedStatement pstmt = conn.prepareStatement(
                 "SELECT E.ID FROM ESKARI E WHERE E.ID_SALTZAILE = ?")) {
            
            pstmt.setInt(1, saltzaileId);
            try (ResultSet rs = pstmt.executeQuery()) {
                comboBox.removeAllItems();
                
                while (rs.next()) {
                    comboBox.addItem("Eskaria " + rs.getInt("ID"));
                }
                
                if (comboBox.getItemCount() == 0) {
                    comboBox.addItem("Ez dago eskarririk");
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea eskariak kargatzean: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Saltzaileen eskariaren informazioa kargatzen du testu-eremuetan.
     * @param eskariId Kargatzeko eskariaren ID-a
     * @param eremuak Informazioa erakutsiko duten testu-eremuak
     */
    private static void kargatuSaltzaileenEskarienInformazioa(int eskariId, JTextField... eremuak) {
        if (eremuak == null || eremuak.length != 4) {
            JOptionPane.showMessageDialog(null, "Errorea: Parametro kopuru okerra");
            return;
        }

        try (Connection conn = DatabaseManager.konexioa();
             PreparedStatement pstmt = conn.prepareStatement(
                 "SELECT E.ID, B.IZENA, B.ABIZENA, E.ESKAERA_DATA, EG.DESKRIBAPENA " +
                 "FROM ESKARI E " +
                 "JOIN BEZERO B ON E.ID_BEZERO = B.ID " +
                 "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " +
                 "WHERE E.ID = ?")) {
            
            pstmt.setInt(1, eskariId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    eremuak[0].setText(String.valueOf(rs.getInt("ID")));
                    eremuak[1].setText(izenabizenak(rs));
                    eremuak[2].setText(dataFormateatu(rs.getTimestamp("ESKAERA_DATA")));
                    eremuak[3].setText(egoeraItzuli(rs.getString("DESKRIBAPENA")));
                } else {
                    eremuakGarbitu(eremuak);
                    JOptionPane.showMessageDialog(null, "Ez da eskaria aurkitu ID honekin: " + eskariId);
                }
            }
        } catch (SQLException ex) {
            eremuakGarbitu(eremuak);
            JOptionPane.showMessageDialog(null, "Errorea eskariaren informazioa kargatzean: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Bezeroen eskariak bistaratzeko panela sortzen du.
     * @return Eskarien historiala erakusten duen JPanel objektua
     */
    public static JPanel historialaikusiSortu() {
        JPanel panel = new JPanel(new BorderLayout());
        
        // Goiburukoa
        JLabel label = new JLabel("Historiala", SwingConstants.CENTER);
        label.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(label, BorderLayout.NORTH);

        // Erdiko panela
        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.WEST;

        // UI osagaiak sortu
        JComboBox<String> comboBoxHistoriala = new JComboBox<>();
        JTextField txtEskariId = Login.sortuTextFieldEditatugabea(10);
        JTextField txtSaltzailea = Login.sortuTextFieldEditatugabea(20);
        JTextField txtData = Login.sortuTextFieldEditatugabea(15);
        JTextField txtEgoera = Login.sortuTextFieldEditatugabea(15);

        // Erabiltzaile ID balidatu
        int id = Login.id;
        if (id <= 0) {
            JOptionPane.showMessageDialog(null, "Errorea: Erabiltzaile ID baliogabea");
            return panel;
        }

        // Eskariak kargatu
        kargatuBezeroenEskariak(comboBoxHistoriala, id);

        // ComboBox-aren listener-a gehitu
        comboBoxHistoriala.addActionListener(e -> {
            String aukeratutakoEskaria = (String) comboBoxHistoriala.getSelectedItem();
            if (aukeratutakoEskaria != null && !aukeratutakoEskaria.isEmpty()) {
                try {
                    int eskariId = Integer.parseInt(aukeratutakoEskaria.split(" ")[1]);
                    kargatuBezeroenEskarienInformazioa(eskariId, txtEskariId, txtSaltzailea, txtData, txtEgoera);
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(null, "Errorea: Eskari ID formatu okerra");
                }
            }
        });

        // Osagaiak panelera gehitu
        Login.sortuKonponenteaEtiketarekin(centerPanel, gbc, "Aukeratu eskaria:", comboBoxHistoriala, 0, 0);
        Login.sortuKonponenteaEtiketarekin(centerPanel, gbc, "Eskari ID:", txtEskariId, 0, 1);
        Login.sortuKonponenteaEtiketarekin(centerPanel, gbc, "Saltzailea:", txtSaltzailea, 0, 2);
        Login.sortuKonponenteaEtiketarekin(centerPanel, gbc, "Data:", txtData, 0, 3);
        Login.sortuKonponenteaEtiketarekin(centerPanel, gbc, "Egoera:", txtEgoera, 0, 4);

        panel.add(centerPanel, BorderLayout.CENTER);
        return panel;
    }

    /**
     * Bezeroen eskariak kargatzen ditu ComboBox batean.
     * @param comboBox Datuak kargatzeko ComboBox
     * @param bezeroId Bezeroaren ID-a
     */
    private static void kargatuBezeroenEskariak(JComboBox<String> comboBox, int bezeroId) {
        if (comboBox == null) {
            JOptionPane.showMessageDialog(null, "Errorea: ComboBox ezin da null izan");
            return;
        }

        if (bezeroId <= 0) {
            JOptionPane.showMessageDialog(null, "Errorea: Bezero ID baliogabea");
            return;
        }

        try (Connection conn = DatabaseManager.konexioa();
             PreparedStatement pstmt = conn.prepareStatement(
                 "SELECT E.ID FROM ESKARI E WHERE E.ID_BEZERO = ?")) {
            
            pstmt.setInt(1, bezeroId);
            try (ResultSet rs = pstmt.executeQuery()) {
                comboBox.removeAllItems();
                
                while (rs.next()) {
                    comboBox.addItem("Eskaria " + rs.getInt("ID"));
                }
                
                if (comboBox.getItemCount() == 0) {
                    comboBox.addItem("Ez dago eskarririk");
                }
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea eskariak kargatzean: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Bezeroen eskariaren informazioa kargatzen du testu-eremuetan.
     * @param eskariId Kargatzeko eskariaren ID-a
     * @param campos Informazioa erakutsiko duten testu-eremuak
     */
    private static void kargatuBezeroenEskarienInformazioa(int eskariId, JTextField... campos) {
        if (campos == null || campos.length != 4) {
            JOptionPane.showMessageDialog(null, "Errorea: Parametro kopuru okerra");
            return;
        }

        try (Connection conn = DatabaseManager.konexioa();
             PreparedStatement pstmt = conn.prepareStatement(
                 "SELECT E.ID, L.IZENA, L.ABIZENA, E.ESKAERA_DATA, EG.DESKRIBAPENA " +
                 "FROM ESKARI E " +
                 "JOIN LANGILE L ON E.ID_SALTZAILE = L.ID " +
                 "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " +
                 "WHERE E.ID = ?")) {
            
            pstmt.setInt(1, eskariId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    campos[0].setText(String.valueOf(rs.getInt("ID")));
                    campos[1].setText(izenabizenak(rs));
                    campos[2].setText(dataFormateatu(rs.getTimestamp("ESKAERA_DATA")));
                    campos[3].setText(egoeraItzuli(rs.getString("DESKRIBAPENA")));
                } else {
                    eremuakGarbitu(campos);
                    JOptionPane.showMessageDialog(null, "Ez da eskaria aurkitu ID honekin: " + eskariId);
                }
            }
        } catch (SQLException ex) {
            eremuakGarbitu(campos);
            JOptionPane.showMessageDialog(null, "Errorea eskariaren informazioa kargatzean: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    // ==================== METODO LAGUNTZAILEAK ====================

    /**
     * Izena eta abizena batzen ditu kate bakar batean.
     * @param rs Datuak dauzkan ResultSet objektua
     * @return Izena eta abizena batuta
     * @throws SQLException Errorea gertatzen bada
     */
    private static String izenabizenak(ResultSet rs) throws SQLException {
        String izena = rs.getString("IZENA");
        String abizena = rs.getString("ABIZENA");
        return (izena != null ? izena : "") + " " + (abizena != null ? abizena : "");
    }

    /**
     * Data formateatzen du "yyyy-MM-dd" formatuan.
     * @param timestamp Formateatzeko data
     * @return Formateatutako data edo mezu bat data null bada
     */
    private static String dataFormateatu(Timestamp timestamp) {
        if (timestamp == null) return "Data ez dago eskuragarri";
        return new SimpleDateFormat("yyyy-MM-dd").format(timestamp);
    }

    /**
     * Eskariaren egoera itzultzen du euskaraz.
     * @param egoera Ingeleseko egoera
     * @return Euskarazko egoera
     */
    private static String egoeraItzuli(String egoera) {
        if (egoera == null) return "Egoera ezezaguna";
        
        switch (egoera) {
            case "Pending": return "Bidalita";
            case "Shipped": return "Entregatua";
            case "Cancelled": return "Ezeztatua";
            default: return egoera;
        }
    }

    /**
     * Testu-eremu guztiak garbitzen ditu.
     * @param campos Garbitzeko testu-eremuak
     */
    private static void eremuakGarbitu(JTextField[] campos) {
        for (JTextField campo : campos) {
            campo.setText("");
        }
    }
}