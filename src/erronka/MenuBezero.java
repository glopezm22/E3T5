package erronka;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class MenuBezero {
    public static void main(String[] args) {
        JFrame frame = new JFrame("GameStop | Bezeroen menua");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        frame.setSize(1920, 1080);
        CardLayout cardLayout = new CardLayout();
        frame.setLayout(cardLayout);

        JPanel blankPanel = new JPanel();
        frame.add(blankPanel, "BlankPanel");

        JMenuBar menuBar = new JMenuBar();
        JMenu menu = new JMenu("Nire kontua");
        JMenuItem menuItem1 = new JMenuItem("Datu pertsonalak");
        JMenuItem menuItem2 = new JMenuItem("Itxi saioa");
        menu.add(menuItem1);
        menu.add(menuItem2);
        menuBar.add(menu);

        JPanel datuPertsonalakPanel = datuPertsonalakPanelSortu();
        frame.add(datuPertsonalakPanel, "NireKontua");

        menuItem1.addActionListener(e -> cardLayout.show(frame.getContentPane(), "NireKontua"));
        menuItem2.addActionListener(e -> System.exit(0));
        
        JMenu menu2 = new JMenu("Nire eskariak");
        JMenuItem menuItem01 = new JMenuItem("Historiala bistaratu");
        JMenuItem menuItem02 = new JMenuItem("Egoera");
        menu2.add(menuItem01);
        menu2.add(menuItem02);
        menuBar.add(menu2);
        
        JPanel historialaPanel =  historialaikusiSortu();
        frame.add(historialaPanel, "Historiala");
        menuItem01.addActionListener(e -> cardLayout.show(frame.getContentPane(), "Historiala"));
        menuItem02.addActionListener(e -> cardLayout.show(frame.getContentPane(), "EgoeraBistaratu"));

        JMenu menu3 = new JMenu("Produktuak");
        JMenuItem menuItem001 = new JMenuItem("Ikusi");
        menu3.add(menuItem001);
        menuBar.add(menu3);

        JPanel produktuakPanel = produktuakikusiSortu();
        frame.add(produktuakPanel, "ProduktuakIkusi");
        
        menuItem001.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakIkusi"));
        
        frame.setJMenuBar(menuBar);
        cardLayout.show(frame.getContentPane(), "BlankPanel");

        frame.setVisible(true);
    }

    private static JPanel historialaikusiSortu() {
    	
    	JPanel panel = new JPanel(new BorderLayout());
        JLabel label = new JLabel("Historiala", SwingConstants.CENTER);
        label.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(label, BorderLayout.NORTH);
    }
    private static JPanel produktuakikusiSortu() {
        JPanel panel = new JPanel(new BorderLayout());
        JLabel label = new JLabel("Produktuak", SwingConstants.CENTER);
        label.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(label, BorderLayout.NORTH);

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.WEST;

        JComboBox<String> comboBoxProduktuak = new JComboBox<>();

        JLabel deskribapenaLabel = new JLabel("Deskribapena:");
        JTextArea deskribapenaArea = new JTextArea(3, 20);
        deskribapenaArea.setEditable(false);
        deskribapenaArea.setLineWrap(true);
        deskribapenaArea.setWrapStyleWord(true);
        JScrollPane deskribapenaScroll = new JScrollPane(deskribapenaArea);

        JLabel balioaLabel = new JLabel("Balioa:");
        JTextArea balioaArea = new JTextArea(1, 10);
        balioaArea.setEditable(false);
        JScrollPane balioaScroll = new JScrollPane(balioaArea);

        // Añadir ComboBox
        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(new JLabel("Aukeratu produktua:"), gbc);
        gbc.gridx = 1;
        centerPanel.add(comboBoxProduktuak, gbc);

        // Añadir descripción
        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(deskribapenaLabel, gbc);
        gbc.gridx = 1;
        centerPanel.add(deskribapenaScroll, gbc);

        // Añadir valor (balioa)
        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(balioaLabel, gbc);
        gbc.gridx = 1;
        centerPanel.add(balioaScroll, gbc);

        kargatuProduktuak(comboBoxProduktuak, deskribapenaArea, balioaArea);

        panel.add(centerPanel, BorderLayout.CENTER);
        return panel;
    }

    private static void kargatuProduktuak(JComboBox<String> comboBox, JTextArea deskribapenaArea, JTextArea balioaArea) {
        try {
            Connection conn = DBmain.konexioa();
            Statement stmt = conn.createStatement();

            String query = "SELECT P.IZENA AS PRODUKTU_IZENA, K.IZENA AS KATEGORIA_IZENA " +
                           "FROM PRODUKTU P " +
                           "JOIN KATEGORIA K ON P.ID_KATEGORIA = K.ID";

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                String produktua = rs.getString("PRODUKTU_IZENA");
                String kategoria = rs.getString("KATEGORIA_IZENA");
                comboBox.addItem(produktua + " (" + kategoria + ")");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea produktuak kargatzean.");
            ex.printStackTrace();
        }

        comboBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String aukeratutakoProduktua = (String) comboBox.getSelectedItem();
                if (aukeratutakoProduktua != null) {
                    String produktuaIzena = aukeratutakoProduktua.split(" \\(")[0]; // Elimina la categoría de la selección
                    kargatuProduktuarenInformazioa(produktuaIzena, deskribapenaArea, balioaArea);
                }
            }
        });
    }

    private static void kargatuProduktuarenInformazioa(String produktua, JTextArea deskribapenaArea, JTextArea balioaArea) {
        try {
            Connection conn = DBmain.konexioa();
            PreparedStatement pstmt = conn.prepareStatement("SELECT DESKRIBAPENA, BALIOA FROM PRODUKTU WHERE IZENA = ?");
            pstmt.setString(1, produktua);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String deskribapena = rs.getString("DESKRIBAPENA");
                double balioa = rs.getDouble("BALIOA");

                deskribapenaArea.setText(deskribapena);
                balioaArea.setText(balioa + " €");
            } else {
                deskribapenaArea.setText("");
                balioaArea.setText("");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea produktuen informazioa kargatzean.");
            ex.printStackTrace();
        }
    }

    private static JPanel datuPertsonalakPanelSortu() {
        JPanel panel = new JPanel(new BorderLayout());
        JLabel label = new JLabel("Nire Kontua", SwingConstants.CENTER);
        label.setFont(new Font("Arial", Font.BOLD, 24));
        panel.add(label, BorderLayout.NORTH);

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        String[] labels = { "Izena:", "Abizena:", "Emaila:", "Telefonoa:" };
        JTextField[] textFields = new JTextField[labels.length];

        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i;
            centerPanel.add(new JLabel(labels[i]), gbc);

            textFields[i] = new JTextField(10);
            gbc.gridx = 1;
            centerPanel.add(textFields[i], gbc);
        }

        JButton gordeButton = new JButton("Gorde");
        gbc.gridx = 0;
        gbc.gridy = labels.length;
        gbc.gridwidth = 2;
        centerPanel.add(gordeButton, gbc);

        panel.add(centerPanel, BorderLayout.CENTER);
        return panel;
    }
}
