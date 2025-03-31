package erronka;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import erronka.DB.DBProduktu;
import erronka.DB.Produktu;

public class ProduktuakMenu {
	
	public static JPanel produktuakBistaratu() {
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

		JLabel kategoriaLabel = new JLabel("Kategoria:");
		JTextField kategoriaField = new JTextField(10);
		kategoriaField.setEditable(false);

		JLabel deskribapenaLabel = new JLabel("Deskribapena:");
		JTextArea deskribapenaArea = new JTextArea(3, 20);
		deskribapenaArea.setEditable(false);
		deskribapenaArea.setLineWrap(true);
		deskribapenaArea.setWrapStyleWord(true);
		JScrollPane deskribapenaScroll = new JScrollPane(deskribapenaArea);

		JLabel salneurriaLabel = new JLabel("Balioa:");
		JTextField salneurriaField = new JTextField(10);
		salneurriaField.setEditable(false);

		// ComboBox gehitu
		gbc.gridx = 0;
		gbc.gridy = 0;
		centerPanel.add(new JLabel("Aukeratu produktua:"), gbc);
		gbc.gridx = 1;
		centerPanel.add(comboBoxProduktuak, gbc);

		// Kategoria gehitu
		gbc.gridx = 0;
		gbc.gridy = 1;
		centerPanel.add(kategoriaLabel, gbc);
		gbc.gridx = 1;
		centerPanel.add(kategoriaField, gbc);

		// Deskribapena gehitu
		gbc.gridx = 0;
		gbc.gridy = 2;
		centerPanel.add(deskribapenaLabel, gbc);
		gbc.gridx = 1;
		centerPanel.add(deskribapenaScroll, gbc);

		// Salneurria gehitu
		gbc.gridx = 0;
		gbc.gridy = 3;
		centerPanel.add(salneurriaLabel, gbc);
		gbc.gridx = 1;
		centerPanel.add(salneurriaField, gbc);

		DBProduktu.kargatuProduktuak(comboBoxProduktuak, kategoriaField, deskribapenaArea, salneurriaField);

		panel.add(centerPanel, BorderLayout.CENTER);
		return panel;
	}
	
	public static JPanel produktuakGehitu() {
	    JPanel panel = new JPanel(new GridBagLayout());
	    GridBagConstraints gbc = new GridBagConstraints();
	    gbc.insets = new Insets(10, 10, 10, 10);

	    String[] labels = { "Izena:", "Deskribapena:", "Balioa:", "Salneurria:", "Kategoria:" };
	    JTextField[] textFields = new JTextField[labels.length - 1];

	    for (int i = 0; i < labels.length - 1; i++) {
	        gbc.gridx = 0;
	        gbc.gridy = i;
	        panel.add(new JLabel(labels[i]), gbc);

	        textFields[i] = new JTextField(10);
	        gbc.gridx = 1;
	        panel.add(textFields[i], gbc);
	    }

	    // ComboBox para categorías
	    JComboBox<String> categoriaComboBox = new JComboBox<>();
	    kategoriakKargatuCOMBOBOX(categoriaComboBox);

	    gbc.gridx = 0;
	    gbc.gridy = labels.length - 1;
	    panel.add(new JLabel("Kategoria:"), gbc);

	    gbc.gridx = 1;
	    panel.add(categoriaComboBox, gbc);

	    JButton gehituProduktu = new JButton("Gehitu produktua");
	    gbc.gridx = 0;
	    gbc.gridy = labels.length;
	    gbc.gridwidth = 2;
	    panel.add(gehituProduktu, gbc);

	    gehituProduktu.addActionListener(e -> {
	        DBProduktu dbProduktu = new DBProduktu();

	        String izena = textFields[0].getText();
	        String deskribapena = textFields[1].getText();
	        double balioa;
	        double salneurria;

	        // Validaciones de longitud y tipo de datos
	        if (izena.length() > 255) {
	            JOptionPane.showMessageDialog(null, "Izena gehienez 255 karaktere izan ditzake.");
	            return;
	        }
	        if (deskribapena.length() > 2000) {
	            JOptionPane.showMessageDialog(null, "Deskribapena gehienez 2000 karaktere izan ditzake.");
	            return;
	        }
	        try {
	            balioa = Double.parseDouble(textFields[2].getText());
	            if (String.valueOf(balioa).length() > 9) {
	                JOptionPane.showMessageDialog(null, "Balioa gehienez 9 karaktere izan ditzake.");
	                return;
	            }
	        } catch (NumberFormatException ex) {
	            JOptionPane.showMessageDialog(null, "Balioa ez da zuzena.");
	            return;
	        }
	        try {
	            salneurria = Double.parseDouble(textFields[3].getText());
	            if (String.valueOf(salneurria).length() > 9) {
	                JOptionPane.showMessageDialog(null, "Salneurria gehienez 9 karaktere izan ditzake.");
	                return;
	            }
	        } catch (NumberFormatException ex) {
	            JOptionPane.showMessageDialog(null, "Salneurria ez da zuzena.");
	            return;
	        }

	        String kategoria = (String) categoriaComboBox.getSelectedItem();

	        // Obtener el ID de la categoría
	        int id_kategoria = -1;
	        try {
	            Connection conn = DBmain.konexioa();
	            String sql = "SELECT ID FROM KATEGORIA WHERE IZENA = ?";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, kategoria);
	            ResultSet rs = pstmt.executeQuery();

	            if (rs.next()) {
	                id_kategoria = rs.getInt("ID"); // Asegúrate de que la columna "ID" sea de tipo numérico
	            } else {
	                JOptionPane.showMessageDialog(null, "Kategoria ez da aurkitu.");
	                return;
	            }

	            rs.close();
	            pstmt.close();
	            conn.close();
	        } catch (SQLException ex) {
	            JOptionPane.showMessageDialog(null, "Errorea kategoria IDa lortzean.");
	            ex.printStackTrace();
	            return;
	        }

	        // Insertar el producto en la base de datos
	        try {
	            Connection conn = DBmain.konexioa();
	            String sql = "INSERT INTO PRODUKTU (ID, IZENA, DESKRIBAPENA, BALIOA, SALNEURRIA, ID_KATEGORIA) VALUES ((SELECT COALESCE(MAX(ID), 0) + 1 FROM PRODUKTU), ?, ?, ?, ?, ?)";
	            PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	            pstmt.setString(1, izena);
	            pstmt.setString(2, deskribapena);
	            pstmt.setDouble(3, balioa);
	            pstmt.setDouble(4, salneurria);
	            pstmt.setInt(5, id_kategoria);
	            pstmt.executeUpdate();

	            // Obtener el ID generado
	            ResultSet generatedKeys = pstmt.getGeneratedKeys();
	            int id = -1;
	            if (generatedKeys.next()) {
	                id = generatedKeys.getInt(1); // Asegúrate de que la columna "ID" sea de tipo numérico
	            }

	            conn.close();

	            // Crear el objeto Produktu y añadirlo a la lista
	            Produktu produktuBerria = new Produktu(id, izena, deskribapena, balioa, salneurria, id_kategoria);
	            dbProduktu.gehituProduktua(produktuBerria);

	            JOptionPane.showMessageDialog(null, "Produktua gehitu da.");
	        } catch (SQLException ex) {
	            JOptionPane.showMessageDialog(null, "Errorea: ezin da produktua gehitu.");
	            ex.printStackTrace();
	        }
	    });

	    return panel;
	}

    private static void kategoriakKargatuCOMBOBOX(JComboBox<String> comboBox) {
        try {
            Connection conn = DBmain.konexioa();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT IZENA FROM KATEGORIA");

            while (rs.next()) {
                comboBox.addItem(rs.getString("IZENA"));
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Errorea kategoriak kargatzean.");
            ex.printStackTrace();
        }
    }

	public static JPanel produktuakEzabatu() {
	    JPanel panel = new JPanel(new BorderLayout());
	    JLabel label = new JLabel("Produktuak Ezabatu", SwingConstants.CENTER);
	    label.setFont(new Font("Arial", Font.BOLD, 24));
	    panel.add(label, BorderLayout.NORTH);

	    JPanel centerPanel = new JPanel(new GridBagLayout());
	    GridBagConstraints gbc = new GridBagConstraints();
	    gbc.insets = new Insets(10, 10, 10, 10);
	    gbc.fill = GridBagConstraints.HORIZONTAL;
	    gbc.anchor = GridBagConstraints.WEST;

	    JComboBox<String> comboBoxProduktuak = new JComboBox<>();

	    JLabel kategoriaLabel = new JLabel("Kategoria:");
	    JTextField kategoriaField = new JTextField(10);
	    kategoriaField.setEditable(false);

	    JLabel deskribapenaLabel = new JLabel("Deskribapena:");
	    JTextArea deskribapenaArea = new JTextArea(3, 20);
	    deskribapenaArea.setEditable(false);
	    deskribapenaArea.setLineWrap(true);
	    deskribapenaArea.setWrapStyleWord(true);
	    JScrollPane deskribapenaScroll = new JScrollPane(deskribapenaArea);

	    JLabel salneurriaLabel = new JLabel("Balioa:");
	    JTextField salneurriaField = new JTextField(10);
	    salneurriaField.setEditable(false);

	    JButton ezabatuButton = new JButton("Ezabatu");

	    gbc.gridx = 0;
	    gbc.gridy = 0;
	    centerPanel.add(new JLabel("Aukeratu produktua:"), gbc);
	    gbc.gridx = 1;
	    centerPanel.add(comboBoxProduktuak, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 1;
	    centerPanel.add(kategoriaLabel, gbc);
	    gbc.gridx = 1;
	    centerPanel.add(kategoriaField, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 2;
	    centerPanel.add(deskribapenaLabel, gbc);
	    gbc.gridx = 1;
	    centerPanel.add(deskribapenaScroll, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 3;
	    centerPanel.add(salneurriaLabel, gbc);
	    gbc.gridx = 1;
	    centerPanel.add(salneurriaField, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 4;
	    gbc.gridwidth = 2;
	    gbc.anchor = GridBagConstraints.CENTER;
	    centerPanel.add(ezabatuButton, gbc);

	    DBProduktu.kargatuProduktuak(comboBoxProduktuak, kategoriaField, deskribapenaArea, salneurriaField);

	    // Acción del botón "Ezabatu"
	    ezabatuButton.addActionListener(new ActionListener() {
	        @Override
	        public void actionPerformed(ActionEvent e) {
	            String aukeratutakoProduktua = (String) comboBoxProduktuak.getSelectedItem();
	            if (aukeratutakoProduktua != null) {
	                String produktuaID = aukeratutakoProduktua.split(" \\(")[0];
	                String produktuaIzena = aukeratutakoProduktua.split(" \\(")[1];

	                int erantzuna = JOptionPane.showConfirmDialog(panel, 
	                        "Ziur zaude " + produktuaIzena + " ezabatu nahi duzula?", 
	                        "Berretsi Ezabatzea", JOptionPane.YES_NO_OPTION);

	                if (erantzuna == JOptionPane.YES_OPTION) {
	                    DBProduktu.ezabatuProduktua(produktuaID);
	                    DBProduktu.kargatuProduktuak(comboBoxProduktuak, kategoriaField, deskribapenaArea, salneurriaField);
	                }
	            }
	        }
	    });

	    panel.add(centerPanel, BorderLayout.CENTER);
	    return panel;
	}

	public static JPanel produktuakEditatu() {
	    JPanel panel = new JPanel(new BorderLayout());
	    JLabel label = new JLabel("Produktuak Editatu", SwingConstants.CENTER);
	    label.setFont(new Font("Arial", Font.BOLD, 24));
	    panel.add(label, BorderLayout.NORTH);

	    JPanel centerPanel = new JPanel(new GridBagLayout());
	    GridBagConstraints gbc = new GridBagConstraints();
	    gbc.insets = new Insets(10, 10, 10, 10);
	    gbc.fill = GridBagConstraints.HORIZONTAL;
	    gbc.anchor = GridBagConstraints.WEST;

	    JComboBox<String> comboBoxProduktuak = new JComboBox<>();

	    JLabel kategoriaLabel = new JLabel("Kategoria:");
	    JTextField kategoriaField = new JTextField(10);
	    kategoriaField.setEditable(false);

	    JLabel deskribapenaLabel = new JLabel("Deskribapena:");
	    JTextArea deskribapenaArea = new JTextArea(3, 20);
	    deskribapenaArea.setLineWrap(true);
	    deskribapenaArea.setWrapStyleWord(true);
	    JScrollPane deskribapenaScroll = new JScrollPane(deskribapenaArea);

	    JLabel salneurriaLabel = new JLabel("Salneurria:");
	    JTextField salneurriaField = new JTextField(10);
	    
	    JButton gordeButton = new JButton("Gorde");

	    // Añadir componentes al panel
	    gbc.gridx = 0;
	    gbc.gridy = 0;
	    centerPanel.add(new JLabel("Aukeratu produktua:"), gbc);
	    gbc.gridx = 1;
	    centerPanel.add(comboBoxProduktuak, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 1;
	    centerPanel.add(kategoriaLabel, gbc);
	    gbc.gridx = 1;
	    centerPanel.add(kategoriaField, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 2;
	    centerPanel.add(deskribapenaLabel, gbc);
	    gbc.gridx = 1;
	    centerPanel.add(deskribapenaScroll, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 3;
	    centerPanel.add(salneurriaLabel, gbc);
	    gbc.gridx = 1;
	    centerPanel.add(salneurriaField, gbc);

	    gbc.gridx = 0;
	    gbc.gridy = 4;
	    gbc.gridwidth = 2;
	    gbc.anchor = GridBagConstraints.CENTER;
	    centerPanel.add(gordeButton, gbc);

	    DBProduktu.kargatuProduktuak(comboBoxProduktuak, kategoriaField, deskribapenaArea, salneurriaField);

	    gordeButton.addActionListener(new ActionListener() {
	        @Override
	        public void actionPerformed(ActionEvent e) {
	            String aukeratutakoProduktua = (String) comboBoxProduktuak.getSelectedItem();
	            if (aukeratutakoProduktua != null) {
	            	String produktuaIzena = aukeratutakoProduktua.split(" \\(")[0];
	                String deskribapena = deskribapenaArea.getText();
	                double salneurria;
	                
	                try {
	                    salneurria = Double.parseDouble(salneurriaField.getText());
	                } catch (NumberFormatException ex) {
	                    JOptionPane.showMessageDialog(panel, "Mesedez, sartu baliozko zenbaki bat Salneurria eremuan.", "Errorea", JOptionPane.ERROR_MESSAGE);
	                    return;
	                }
	                
	                DBProduktu.eguneratuProduktua(produktuaIzena, deskribapena, salneurria);
	            }
	        }
	    });

	    panel.add(centerPanel, BorderLayout.CENTER);
	    return panel;
	}
	
}