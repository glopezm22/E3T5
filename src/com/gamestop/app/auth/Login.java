package com.gamestop.app.auth;

import com.gamestop.db.DatabaseManager;
import com.gamestop.app.main.MenuBezero;
import com.gamestop.app.main.MenuSaltzaile;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;
import java.time.LocalDate;
import javax.imageio.ImageIO;
import java.io.IOException;
import java.io.InputStream;

/**
 * Saioa hasteko eta erabiltzailea autentifikatzeko klasea.
 * Erabiltzailearen datuak egiaztatzen ditu datu-basearekin eta sesioa hasten du.
 */
public class Login {

    // Saioa hasteko gehienezko saiakerak
    public static final int MAX_SAIAKERAK = 3;

    // Erabiltzailearen datuak gordetzeko aldagaiak
    public static int id = 0;
    public static String izena = null;
    public static String abizena = null;
    public static String helbidea = null;
    public static String emaila = null;
    public static String telefonoa = null;
    public static LocalDate kontratazioData = null;
    public static int idnagusi = 0;
    public static String erabiltzailea = null;
    public static String pasahitza = null;
    public static String mota = null;

    /**
     * Aplikazioa abiarazten duen metodoa. Login interfazea bistaratzen du.
     * @param args Komando-lerroko argumentuak (ez dira erabiltzen)
     */
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = sortuFrameNagusia();
            sortuLoginPanela(frame);
            frame.setVisible(true);
        });
    }

    /**
     * Frame nagusia konfiguratzen du: tamaina, titulua eta leihoaren portaera.
     * @return Konfiguratutako JFrame objektua
     */
    private static JFrame sortuFrameNagusia() {
        JFrame frame = new JFrame("GameStop | Saioa hasi");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setResizable(false);
        frame.setSize(450, 400);
        frame.setLocationRelativeTo(null);
        frame.setLayout(new GridBagLayout());
        kargatuIkonoa(frame);
        kargatuAtzekoIrudia(frame);
        return frame;
    }

    /**
     * Login panela osatzen du, erabiltzailearen datuak jasotzeko.
     * @param frame Leiho nagusia, non panela gehitu behar den
     */
    private static void sortuLoginPanela(JFrame frame) {
        JPanel panel = new JPanel(new GridLayout(6, 1, 5, 5));
        panel.setOpaque(false);
        
        // Konponenteak sortu
        JLabel erabiltzaileLabel = new JLabel("Erabiltzailea:", SwingConstants.CENTER);
        erabiltzaileLabel.setForeground(Color.WHITE);
        erabiltzaileLabel.setFont(new Font("Arial", Font.BOLD, 14));
        
        JTextField erabiltzaileEremua = new JTextField(10);
        estilizarTextField(erabiltzaileEremua);
        
        JLabel pasahitzaLabel = new JLabel("Pasahitza:", SwingConstants.CENTER);
        pasahitzaLabel.setForeground(Color.WHITE);
        pasahitzaLabel.setFont(new Font("Arial", Font.BOLD, 14));
        
        JPasswordField pasahitzaEremua = new JPasswordField(10);
        estilizarTextField(pasahitzaEremua);
        
        JButton saioaHasiBotoia = new JButton("Saioa hasi");
        estilizarBotoia(saioaHasiBotoia);
        
        JLabel mezua = new JLabel("", SwingConstants.CENTER);
        mezua.setForeground(Color.WHITE);
        
        // Konponenteak panelari gehitu
        panel.add(erabiltzaileLabel);
        panel.add(erabiltzaileEremua);
        panel.add(pasahitzaLabel);
        panel.add(pasahitzaEremua);
        panel.add(saioaHasiBotoia);
        panel.add(mezua);

        int[] saiakerak = {0};

        saioaHasiBotoia.addActionListener(e -> {
            String erabiltzailea = erabiltzaileEremua.getText().trim();
            String pasahitza = new String(pasahitzaEremua.getPassword()).trim();

            if (autentifikatuErabiltzailea(frame, erabiltzailea, pasahitza, mezua, saiakerak)) {
                kudeatuSesioa(frame);
            }
            erabiltzaileEremua.setText("");
            pasahitzaEremua.setText("");
        });
        
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.CENTER;
        frame.getContentPane().add(panel, gbc);
    }
    
    /**
     * Ongi etorri mezua eta logoa erakusten duen panela sortzen du.
     * @return Osatutako JPanel objektua
     */
    public static JPanel ongietorria() {
        JPanel panel = new JPanel(new BorderLayout());
        panel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        JPanel contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
        contentPanel.setAlignmentX(Component.CENTER_ALIGNMENT);
        contentPanel.setAlignmentY(Component.CENTER_ALIGNMENT);

        JLabel ongiEtorri = new JLabel("Ongi etorri, " + izena + "!", SwingConstants.CENTER);
        ongiEtorri.setFont(new Font("Arial", Font.BOLD, 26));
        ongiEtorri.setAlignmentX(Component.CENTER_ALIGNMENT);
        ongiEtorri.setBorder(BorderFactory.createEmptyBorder(0, 0, 20, 0));

        ImageIcon scaledIcon = null;
        try {
            ImageIcon originalIcon = new ImageIcon(Login.class.getResource("/images/GameStop.png"));
            
            if (originalIcon.getImageLoadStatus() == MediaTracker.COMPLETE) {
                Image scaledImage = originalIcon.getImage().getScaledInstance(300, 57, Image.SCALE_SMOOTH);
                scaledIcon = new ImageIcon(scaledImage);
            } else {
                System.err.println("Ezin izan da irudia kargatu: images/GameStop.png");
            }
        } catch (Exception e) {
            System.err.println("Errorea irudia kargatzerakoan: " + e.getMessage());
        }
        
        JLabel imageLabel = new JLabel(scaledIcon);
        imageLabel.setAlignmentX(Component.CENTER_ALIGNMENT);

        contentPanel.add(ongiEtorri);
        contentPanel.add(imageLabel);
        
        JPanel centerWrapper = new JPanel(new GridBagLayout());
        centerWrapper.add(contentPanel);
        
        panel.add(centerWrapper, BorderLayout.CENTER);
        
        return panel;
    }

    /**
     * Erabiltzailea autentifikatzen du datu-basearekin.
     * @param frame Leiho nagusia
     * @param erabiltzailea Erabiltzaile izena
     * @param pasahitza Erabiltzailearen pasahitza
     * @param mezua Errore mezuak erakusteko etiketa
     * @param saiakerak Saiakeren kopurua gordetzen duen array-a
     * @return true saioa ondo hasi bada, false bestela
     */
    private static boolean autentifikatuErabiltzailea(JFrame frame, String erabiltzailea, String pasahitza, JLabel mezua, int[] saiakerak) {
        if (erabiltzailea.isEmpty() || pasahitza.isEmpty()) {
            mezua.setText("Erabiltzailea eta pasahitza beharrezkoak dira");
            return false;
        }

        try {
            mota = loginSistema(erabiltzailea, pasahitza);
            if (mota != null) {
                logeatutakoProfila(id);
                mezua.setText("Ongi etorri, " + izena + "!");
                return true;
            } else {
                saiakerak[0]++;
                if (saiakerak[0] >= MAX_SAIAKERAK) {
                    JOptionPane.showMessageDialog(frame, "Saiakera kopurua gainditu duzu.", "Errorea", JOptionPane.ERROR_MESSAGE);
                    System.exit(0);
                }
                mezua.setText("Saioa huts eginda. Saiakera " + saiakerak[0] + "/" + MAX_SAIAKERAK);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(frame, "Errorea: " + ex.getMessage(), "Errorea", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }

    /**
     * Erabiltzailearen motaren arabera menua kargatzen du.
     * @param frame Itxi beharreko frame-a
     */
    private static void kudeatuSesioa(JFrame frame) {
        if ("S".equals(mota)) {
            MenuSaltzaile.main(null);
        } else if ("B".equals(mota)) {
            MenuBezero.main(null);
        }
        frame.dispose();
    }

    /**
     * Erabiltzailea eta pasahitza egiaztatzen ditu datu-basean.
     * @param erabiltzailea Egiaztatu beharreko erabiltzaile izena
     * @param pasahitza Egiaztatu beharreko pasahitza
     * @return Erabiltzaile mota ("S" saltzailea, "B" bezeroa) edo null balio hutsa bada
     */
    public static String loginSistema(String erabiltzailea, String pasahitza) {
        String kontsultaLogin = "SELECT * FROM ERABILTZAILEAK WHERE ERABILTZAILEA = ? AND PASAHITZA = ?";

        try (Connection con = DatabaseManager.konexioa();
             PreparedStatement statement = con.prepareStatement(kontsultaLogin)) {
            
            statement.setString(1, erabiltzailea);
            statement.setString(2, pasahitza);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    id = resultSet.getInt("ID");
                    mota = resultSet.getString("MOTA");
                    return mota;
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL errorea: " + e.getMessage());
        }
        return null;
    }

    /**
     * Saioan logeatutako erabiltzailearen datuak kargatzen ditu.
     * @param id Erabiltzailearen ID-a
     */
    public static void logeatutakoProfila(int id) {
        if (mota == null) return;

        String taula = "S".equals(mota) ? "LANGILE" : "BEZERO";
        String kontsulta = "SELECT * FROM " + taula + " WHERE ID = ?";

        try (Connection con = DatabaseManager.konexioa();
             PreparedStatement statement = con.prepareStatement(kontsulta)) {
            
            statement.setInt(1, id);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    izena = resultSet.getString("IZENA");
                    abizena = resultSet.getString("ABIZENA");
                    emaila = resultSet.getString("EMAILA");
                    
                    if ("S".equals(mota)) {
                        telefonoa = resultSet.getString("TELEFONOA");
                        kontratazioData = resultSet.getDate("KONTRATAZIO_DATA").toLocalDate();
                        idnagusi = resultSet.getInt("ID_NAGUSI");
                    } else {
                        helbidea = resultSet.getString("HELBIDEA");
                    }
                }
            }
            
            // Erabiltzailearen datuak kargatu
            String kontsultaErabiltzaile = "SELECT ERABILTZAILEA, PASAHITZA FROM ERABILTZAILEAK WHERE ID = ? AND MOTA = ?";
            try (PreparedStatement stmtErabiltzaile = con.prepareStatement(kontsultaErabiltzaile)) {
                stmtErabiltzaile.setInt(1, id);
                stmtErabiltzaile.setString(2, mota);
                
                try (ResultSet rsErabiltzaile = stmtErabiltzaile.executeQuery()) {
                    if (rsErabiltzaile.next()) {
                        Login.erabiltzailea = rsErabiltzaile.getString("ERABILTZAILEA");
                        Login.pasahitza = rsErabiltzaile.getString("PASAHITZA");
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL errorea: " + e.getMessage());
        }
    }
    
    /**
     * Saioa ixteko dialogoa erakusten du.
     * @param frame Amaitzeko frame-a
     * @return Sortutako dialogoa
     */
    public static JDialog saioaItxi(JFrame frame) {
        JDialog dialog = new JDialog();
        dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
        dialog.setSize(400, 200);
        dialog.setLayout(new GridBagLayout());
        dialog.setTitle("Saioa itxi");
        dialog.setLocationRelativeTo(frame);
        
        JLabel label = new JLabel("Saioa itxi nahi duzu?");
        JButton baiButton = new JButton("Bai");
        JButton ezButton = new JButton("Ez");
        
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.gridx = 0;
        gbc.gridy = 0;
        dialog.add(label, gbc);
        
        gbc.gridy = 1;
        dialog.add(baiButton, gbc);
        
        gbc.gridx = 1;
        dialog.add(ezButton, gbc);
        
        baiButton.addActionListener(e -> {
            loginDatuakGarbitu();
            frame.dispose();
            dialog.dispose();
            Login.main(null);
        });
        
        ezButton.addActionListener(e -> dialog.dispose());
        dialog.setVisible(true);
        
        return dialog;
    }
    
    /**
     * Sesioko datu guztiak garbitzen ditu.
     */
    private static void loginDatuakGarbitu() {
        id = 0;
        izena = null;
        abizena = null;
        helbidea = null;
        emaila = null;
        telefonoa = null;
        kontratazioData = null;
        idnagusi = 0;
        erabiltzailea = null;
        pasahitza = null;
        mota = null;
    }
    
    /**
     * Aplikazioaren ikonoa kargatzen du leiho nagusirako.
     * @param frame Ikonoa gehitzeko JFrame objektua
     */
    public static void kargatuIkonoa(JFrame frame) {
        try {
            InputStream is = Login.class.getClassLoader().getResourceAsStream("images/GameStopIcon.png");
            if (is != null) {
                frame.setIconImage(ImageIO.read(is));
            } else {
                System.err.println("[ERROR] Ikonoaren fitxategia ez da aurkitu: images/GameStopIcon.png");
            }
        } catch (IOException e) {
            JOptionPane.showMessageDialog(
                frame,
                "Ezin izan da aplikazioaren ikonoa kargatu: " + e.getMessage(),
                "Errorea",
                JOptionPane.ERROR_MESSAGE
            );
            System.err.println("[ERROR] Ikonoa ezin kargatu: " + e.getMessage());
        }
    }
    
    /**
     * Atzeko planoko irudia kargatzen du.
     * @param frame Irudia gehitzeko JFrame objektua
     */
    private static void kargatuAtzekoIrudia(JFrame frame) {
        try (InputStream imgStream = Login.class.getResourceAsStream("/images/LoginBackground.jpg")) {
            if (imgStream != null) {
                Image originalImage = ImageIO.read(imgStream);
                
                @SuppressWarnings("serial")
                JPanel backgroundPanel = new JPanel() {
                    @Override
                    protected void paintComponent(Graphics g) {
                        super.paintComponent(g);
                        Graphics2D g2d = (Graphics2D) g.create();
                        g2d.drawImage(originalImage, 0, 0, getWidth(), getHeight(), this);
                        g2d.setColor(new Color(0, 0, 0, 165));
                        g2d.fillRect(0, 0, getWidth(), getHeight());
                        g2d.dispose();
                    }
                };
                backgroundPanel.setLayout(new GridBagLayout());
                frame.setContentPane(backgroundPanel);
            } else {
                System.err.println("Errorea: Ez da irudia aurkitu /images/LoginBackground.jpg bidean");
            }
        } catch (IOException e) {
            System.err.println("Errorea irudia kargatzerakoan:");
            e.printStackTrace();
        }
    }
    
    /**
     * Editatu ezin den testu-eremua sortzen du.
     * @param columns Testu-eremuaren zabalera
     * @return Sortutako JTextField objektua
     */
    public static JTextField sortuTextFieldEditatugabea(int columns) {
        JTextField eremua = new JTextField(columns);
        eremua.setEditable(false);
        return eremua;
    }

    /**
     * Konponente bat sortzen du etiketa batekin.
     * @param panel Konponentea gehitzeko panela
     * @param gbc GridBagConstraints objektua
     * @param etiketa Konponentearen etiketa
     * @param konponentea Gehitzeko konponentea
     * @param x X posizioa
     * @param y Y posizioa
     */
    public static void sortuKonponenteaEtiketarekin(JPanel panel, GridBagConstraints gbc, 
        String etiketa, JComponent konponentea, int x, int y) {
        gbc.gridx = 0;
        gbc.gridy = y;
        panel.add(new JLabel(etiketa), gbc);
        gbc.gridx = 1;
        panel.add(konponentea, gbc);
    }
    
    /**
     * Testu-eremu baten estiloa ezartzen du.
     * @param textField Estilizatu beharreko testu-eremua
     */
    private static void estilizarTextField(JTextField textField) {
        textField.setOpaque(true);
        textField.setBackground(new Color(255, 255, 255, 255));
        textField.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(Color.BLACK, 1),
            BorderFactory.createEmptyBorder(5, 5, 5, 5)
        ));
        textField.setFont(new Font("Arial", Font.PLAIN, 14));
    }

    /**
     * Botoi baten estiloa ezartzen du.
     * @param button Estilizatu beharreko botoia
     */
    private static void estilizarBotoia(JButton button) {
        button.setOpaque(false);
        button.setContentAreaFilled(false);
        button.setBorderPainted(true);
        button.setBorder(BorderFactory.createLineBorder(Color.WHITE, 1));
        button.setForeground(Color.WHITE);
        button.setFont(new Font("Arial", Font.BOLD, 14));
        button.setBackground(new Color(255, 255, 255, 128));
        
        button.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                button.setBackground(new Color(255, 255, 255, 255));
            }
            
            @Override
            public void mouseExited(MouseEvent e) {
                button.setBackground(new Color(255, 255, 255, 128));
            }
        });
    }
}