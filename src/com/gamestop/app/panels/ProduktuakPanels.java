package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DBProduktu;
import com.gamestop.db.DatabaseManager;
import com.gamestop.model.product.Produktu;

import java.awt.*;
import java.sql.*;
import java.util.List;
import java.util.stream.Collectors;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

/**
 * Produktuen kudeaketa panelak sortzeko klasea. Klase honek produktuen CRUD
 * (Sortu, Irakurri, Eguneratu, Ezabatu) operazioak egiteko panelak sortzen
 * ditu.
 */
@SuppressWarnings("unused")
public class ProduktuakPanels {

	/**
	 * Produktuen zerrenda bistaratzeko panela sortzen du.
	 * 
	 * @return produktuen taula eta filtratzeko aukerak dituen JPanel
	 */
	@SuppressWarnings("serial")
	public static JPanel produktuakBistaratu() {
		JPanel panel = new JPanel(new BorderLayout(10, 10));
		panel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

		// Goiburukoa sortu
		JLabel titulua = new JLabel("Produktuen katalogoa", SwingConstants.CENTER);
		titulua.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(titulua, BorderLayout.NORTH);

		// Taularen modelo-a sortu
		String[] zutabeIzenak = { "ID", "Izena", "Deskribapena", "Balioa", "Salneurria", "Kategoria" };
		DefaultTableModel modeloa = new DefaultTableModel(zutabeIzenak, 0) {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false; // Zelak ezin dira editatu
			}
		};

		// Taula sortu eta scroll pane-an sartu
		JTable taula = new JTable(modeloa);
		taula.setAutoCreateRowSorter(true); // Ordenatzeko aukera
		JScrollPane scrollPane = new JScrollPane(taula);
		panel.add(scrollPane, BorderLayout.CENTER);

		// Kategoriak kargatzeko combo box-a
		JComboBox<String> kategoriaComboBox = new JComboBox<>();
		kategoriaComboBox.addItem("Guztiak"); // Lehenengo aukera
		kategoriakKargatuCOMBOBOX(kategoriaComboBox);

		// Eguneratu botoia
		JButton eguneratuBotoia = new JButton("Eguneratu zerrenda");

		// Beheko panela (combo box eta botoia)
		JPanel behekoPanela = new JPanel();
		behekoPanela.add(kategoriaComboBox);
		behekoPanela.add(eguneratuBotoia);
		panel.add(behekoPanela, BorderLayout.SOUTH);

		// Datuak kargatzeko metodoa
		DBProduktu db = new DBProduktu();
		Runnable kargatuDatuak = () -> {
			modeloa.setRowCount(0); // Taula garbitu
			db.produktuakKargatu(); // Datuak berriro kargatu
			List<Produktu> produktuak = db.getProduktuak();

			// Kategoriaren arabera filtratu
			String aukeratutakoKategoria = (String) kategoriaComboBox.getSelectedItem();
			if (!"Guztiak".equals(aukeratutakoKategoria)) {
				try (Connection conn = DatabaseManager.konexioa();
						PreparedStatement pstmt = conn.prepareStatement("SELECT ID FROM KATEGORIA WHERE IZENA = ?")) {

					pstmt.setString(1, aukeratutakoKategoria);
					ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
						int idKategoria = rs.getInt("ID");
						produktuak = produktuak.stream().filter(p -> p.getIdKategoria() == idKategoria)
								.collect(Collectors.toList());
					}
				} catch (SQLException ex) {
					JOptionPane.showMessageDialog(panel, "Errorea kategoria IDa lortzean.");
					ex.printStackTrace();
				}
			}

			// Taula bete
			for (Produktu p : produktuak) {
				modeloa.addRow(new Object[] { p.getId(), p.getIzena(), p.getDeskribapena(), p.getBalioa() + " €",
						p.getSalneurria() + " €", getKategoriaIzena(p.getIdKategoria()) });
			}
		};

		// Listener-ak gehitu
		kategoriaComboBox.addActionListener(e -> kargatuDatuak.run());
		eguneratuBotoia.addActionListener(e -> kargatuDatuak.run());

		// Lehenengo kargaketa egin
		kargatuDatuak.run();

		return panel;
	}

	/**
	 * Produktu berria gehitzeko panela sortzen du.
	 * 
	 * @return produktu berria gehitzeko formularioa duen JPanel
	 */
	public static JPanel produktuakGehitu() {
		JPanel panel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);

		String[] etiketak = { "Izena:", "Deskribapena:", "Balioa:", "Salneurria:", "Kategoria:" };
		JTextField[] testuEremuak = new JTextField[etiketak.length - 1]; // Kategoria combo box-ean doa

		// Etiketak eta testu eremuak gehitu
		for (int i = 0; i < etiketak.length - 1; i++) {
			gbc.gridx = 0;
			gbc.gridy = i;
			panel.add(new JLabel(etiketak[i]), gbc);

			testuEremuak[i] = new JTextField(10);
			gbc.gridx = 1;
			panel.add(testuEremuak[i], gbc);
		}

		// Kategorien combo box-a
		JComboBox<String> kategoriaComboBox = new JComboBox<>();
		kategoriakKargatuCOMBOBOX(kategoriaComboBox);

		gbc.gridx = 0;
		gbc.gridy = etiketak.length - 1;
		panel.add(new JLabel("Kategoria:"), gbc);

		gbc.gridx = 1;
		panel.add(kategoriaComboBox, gbc);

		// Gehitu botoia
		JButton gehituBotoia = new JButton("Gehitu produktua");
		gbc.gridx = 0;
		gbc.gridy = etiketak.length;
		gbc.gridwidth = 2;
		panel.add(gehituBotoia, gbc);

		// Botoiaren ekintza konfiguratu
		gehituBotoia.addActionListener(e -> {
			DBProduktu dbProduktu = new DBProduktu();

			String izena = testuEremuak[0].getText();
			String deskribapena = testuEremuak[1].getText();
			double balioa;
			double salneurria;

			// Balidazioak
			if (izena.length() > 255) {
				JOptionPane.showMessageDialog(null, "Izena gehienez 255 karaktere izan ditzake.");
				return;
			}
			if (deskribapena.length() > 2000) {
				JOptionPane.showMessageDialog(null, "Deskribapena gehienez 2000 karaktere izan ditzake.");
				return;
			}
			try {
				balioa = Double.parseDouble(testuEremuak[2].getText());
				if (String.valueOf(balioa).length() > 9) {
					JOptionPane.showMessageDialog(null, "Balioa gehienez 9 karaktere izan ditzake.");
					return;
				}
			} catch (NumberFormatException ex) {
				JOptionPane.showMessageDialog(null, "Balioa ez da zuzena.");
				return;
			}
			try {
				salneurria = Double.parseDouble(testuEremuak[3].getText());
				if (String.valueOf(salneurria).length() > 9) {
					JOptionPane.showMessageDialog(null, "Salneurria gehienez 9 karaktere izan ditzake.");
					return;
				}
			} catch (NumberFormatException ex) {
				JOptionPane.showMessageDialog(null, "Salneurria ez da zuzena.");
				return;
			}

			String kategoria = (String) kategoriaComboBox.getSelectedItem();

			// Kategoriaren IDa lortu
			int idKategoria = -1;
			try {
				Connection conn = DatabaseManager.konexioa();
				String sql = "SELECT ID FROM KATEGORIA WHERE IZENA = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, kategoria);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {
					idKategoria = rs.getInt("ID");
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

			// Produktua datu-basean gorde
			try {
				Connection conn = DatabaseManager.konexioa();
				String sql = "INSERT INTO PRODUKTU (ID, IZENA, DESKRIBAPENA, BALIOA, SALNEURRIA, ID_KATEGORIA) "
						+ "VALUES ((SELECT COALESCE(MAX(ID), 0) + 1 FROM PRODUKTU), ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, izena);
				pstmt.setString(2, deskribapena);
				pstmt.setDouble(3, balioa);
				pstmt.setDouble(4, salneurria);
				pstmt.setInt(5, idKategoria);
				pstmt.executeUpdate();

				// Sortutako IDa lortu
				ResultSet generatedKeys = pstmt.getGeneratedKeys();
				int id = -1;
				if (generatedKeys.next()) {
					id = generatedKeys.getInt(1);
				}

				conn.close();

				// Produktu berria sortu eta zerrendara gehitu
				Produktu produktuBerria = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
				dbProduktu.gehituProduktua(produktuBerria);

				JOptionPane.showMessageDialog(null, "Produktua gehitu da.");
			} catch (SQLException ex) {
				JOptionPane.showMessageDialog(null, "Errorea: ezin da produktua gehitu.");
				ex.printStackTrace();
			}
		});

		return panel;
	}

	/**
	 * Kategoriaren izena lortzen du ID-aren arabera.
	 * 
	 * @param idKategoria kategoriaren IDa
	 * @return kategoriaren izena, edo "Ezezaguna" errore bat gertatzen bada
	 */
	private static String getKategoriaIzena(int idKategoria) {
		String kategoriaIzena = "Ezezaguna";
		try {
			Connection conn = DatabaseManager.konexioa();
			String sql = "SELECT IZENA FROM KATEGORIA WHERE ID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idKategoria);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				kategoriaIzena = rs.getString("IZENA");
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea kategoria lortzean.");
			ex.printStackTrace();
		}
		return kategoriaIzena;
	}

	/**
	 * Kategoriak kargatzen ditu ComboBox batean.
	 * 
	 * @param comboBox kategoriak gehitzeko JComboBox
	 */
	private static void kategoriakKargatuCOMBOBOX(JComboBox<String> comboBox) {
		try {
			Connection conn = DatabaseManager.konexioa();
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

	/**
	 * Produktuak ezabatzeko panela sortzen du.
	 * 
	 * @return produktuak ezabatzeko aukerak dituen JPanel
	 */
	public static JPanel produktuakEzabatu() {
		JPanel panel = new JPanel(new BorderLayout());

		// Goiburukoa
		JLabel titulua = new JLabel("Produktuak Ezabatu", SwingConstants.CENTER);
		titulua.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(titulua, BorderLayout.NORTH);

		// Erdiko panela (GridBagLayout erabiliz)
		JPanel erdikoPanela = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.WEST;

		// Osagaiak sortu
		JComboBox<String> produktuComboBox = new JComboBox<>();
		JTextField kategoriaEremua = Login.sortuTextFieldEditatugabea(10);
		JTextArea deskribapenaEremua = new JTextArea(3, 20);
		deskribapenaEremua.setEditable(false);
		deskribapenaEremua.setLineWrap(true);
		deskribapenaEremua.setWrapStyleWord(true);
		JScrollPane deskribapenaScroll = new JScrollPane(deskribapenaEremua);
		JTextField salneurriaEremua = Login.sortuTextFieldEditatugabea(10);
		JButton ezabatuBotoia = new JButton("Ezabatu");

		// Osagaiak panelera gehitu
		Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Aukeratu produktua:", produktuComboBox, 0, 0);
		Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Kategoria:", kategoriaEremua, 0, 1);

		gbc.gridx = 0;
		gbc.gridy = 2;
		erdikoPanela.add(new JLabel("Deskribapena:"), gbc);
		gbc.gridx = 1;
		erdikoPanela.add(deskribapenaScroll, gbc);

		Login.sortuKonponenteaEtiketarekin(erdikoPanela, gbc, "Balioa:", salneurriaEremua, 0, 3);

		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.gridwidth = 2;
		gbc.anchor = GridBagConstraints.CENTER;
		erdikoPanela.add(ezabatuBotoia, gbc);

		// Produktuak kargatu combo box-ean
		DBProduktu.kargatuProduktuak(produktuComboBox, kategoriaEremua, deskribapenaEremua, salneurriaEremua);

		// Ezabatu botoiaren ekintza
		ezabatuBotoia.addActionListener(e -> {
			String aukeratutakoProduktua = (String) produktuComboBox.getSelectedItem();
			if (aukeratutakoProduktua != null) {
				// Primero necesitamos obtener la lista de productos
				DBProduktu dbProduktu = new DBProduktu();
				dbProduktu.produktuakKargatu(); // Cargamos los productos

				// Buscar el producto correspondiente en la lista para obtener su ID real
				int produktuaID = -1;
				for (Produktu p : dbProduktu.getProduktuak()) {
					if ((p.getIzena() + " (" + p.getIdKategoria() + ")").equals(aukeratutakoProduktua)) {
						produktuaID = p.getId();
						break;
					}
				}

				if (produktuaID == -1) {
					JOptionPane.showMessageDialog(panel, "Ezin da produktuaren IDa aurkitu", "Errorea",
							JOptionPane.ERROR_MESSAGE);
					return;
				}

				int erantzuna = JOptionPane.showConfirmDialog(panel, "Ziur zaude produktua ezabatu nahi duzula?",
						"Berretsi Ezabatzea", JOptionPane.YES_NO_OPTION);

				if (erantzuna == JOptionPane.YES_OPTION) {
					DBProduktu.ezabatuProduktua(produktuaID);
					DBProduktu.kargatuProduktuak(produktuComboBox, kategoriaEremua, deskribapenaEremua,
							salneurriaEremua);
				}
			}
		});

		panel.add(erdikoPanela, BorderLayout.CENTER);
		return panel;
	}

	/**
	 * Produktuak editatzeko panela sortzen du.
	 * 
	 * @return produktuak editatzeko aukerak dituen JPanel
	 */
	public static JPanel produktuakEditatu() {
		JPanel panel = new JPanel(new BorderLayout());

		// Goiburukoa
		JLabel titulua = new JLabel("Produktuak Editatu", SwingConstants.CENTER);
		titulua.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(titulua, BorderLayout.NORTH);

		// Erdiko panela (GridBagLayout erabiliz)
		JPanel erdikoPanela = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.WEST;

		// Osagaiak sortu
		JComboBox<String> produktuComboBox = new JComboBox<>();
		JTextField kategoriaEremua = new JTextField(10);
		kategoriaEremua.setEditable(false);
		JTextArea deskribapenaEremua = new JTextArea(3, 20);
		deskribapenaEremua.setLineWrap(true);
		deskribapenaEremua.setWrapStyleWord(true);
		JScrollPane deskribapenaScroll = new JScrollPane(deskribapenaEremua);
		JTextField salneurriaEremua = new JTextField(10);
		JButton gordeBotoia = new JButton("Gorde");

		// Osagaiak panelera gehitu
		gbc.gridx = 0;
		gbc.gridy = 0;
		erdikoPanela.add(new JLabel("Aukeratu produktua:"), gbc);
		gbc.gridx = 1;
		erdikoPanela.add(produktuComboBox, gbc);

		gbc.gridx = 0;
		gbc.gridy = 1;
		erdikoPanela.add(new JLabel("Kategoria:"), gbc);
		gbc.gridx = 1;
		erdikoPanela.add(kategoriaEremua, gbc);

		gbc.gridx = 0;
		gbc.gridy = 2;
		erdikoPanela.add(new JLabel("Deskribapena:"), gbc);
		gbc.gridx = 1;
		erdikoPanela.add(deskribapenaScroll, gbc);

		gbc.gridx = 0;
		gbc.gridy = 3;
		erdikoPanela.add(new JLabel("Salneurria (€):"), gbc);
		gbc.gridx = 1;
		erdikoPanela.add(salneurriaEremua, gbc);

		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.gridwidth = 2;
		gbc.anchor = GridBagConstraints.CENTER;
		erdikoPanela.add(gordeBotoia, gbc);

		// Produktuak kargatu combo box-ean
		DBProduktu.kargatuProduktuak(produktuComboBox, kategoriaEremua, deskribapenaEremua, salneurriaEremua);

		// Gorde botoiaren ekintza
		gordeBotoia.addActionListener(e -> {
			String aukeratutakoProduktua = (String) produktuComboBox.getSelectedItem();
			if (aukeratutakoProduktua != null) {
				String produktuaIzena = aukeratutakoProduktua.split(" \\(")[0];
				String deskribapena = deskribapenaEremua.getText();
				double salneurria;

				try {
					salneurria = Double.parseDouble(salneurriaEremua.getText());
				} catch (NumberFormatException ex) {
					JOptionPane.showMessageDialog(panel, "Mesedez, sartu baliozko zenbaki bat Salneurria eremuan.",
							"Errorea", JOptionPane.ERROR_MESSAGE);
					return;
				}

				DBProduktu.eguneratuProduktua(produktuaIzena, deskribapena, salneurria);
			}
		});

		panel.add(erdikoPanela, BorderLayout.CENTER);
		return panel;
	}

	public static JPanel ekintzaGehiago() {
		JPanel panel = new JPanel(new BorderLayout());
		panel.setLayout(new GridLayout(2, 1, 10, 10));

		// Goiburukoa
		JLabel titulua = new JLabel("Ekintza gehiago", SwingConstants.CENTER);
		titulua.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(titulua, BorderLayout.NORTH);

		// Panela
		JPanel botonPanel = new JPanel(new GridLayout(2, 1, 10, 10));
		panel.add(botonPanel, BorderLayout.CENTER);

		// Reestock botoia
		JButton reestockBotoia = new JButton("Reestock egin");
		botonPanel.add(reestockBotoia);

		// Prezioa eguneratzeko botoia
		JButton prezioaEguneratuBotoia = new JButton("Prezioak eguneratu (azken hilabetekoa)");
		botonPanel.add(prezioaEguneratuBotoia);

		// Reestock botoiaren ekintza
		reestockBotoia.addActionListener(e -> {
			try (Connection conn = DatabaseManager.getConnection();
					CallableStatement cstmt = conn.prepareCall("{call P_REESTOCK()}")) {

				cstmt.execute();
				JOptionPane.showMessageDialog(panel, "Reestock prozesua ondo burutu da.", "Arrakasta",
						JOptionPane.INFORMATION_MESSAGE);

			} catch (SQLException ex) {
				String errorMsg = "Errorea reestock prozesuan: ";
				if (ex.getErrorCode() == 20001) {
					errorMsg += ex.getMessage();
				} else {
					errorMsg += "Errore ezezaguna datu-basean.";
				}
				JOptionPane.showMessageDialog(panel, errorMsg, "Errorea", JOptionPane.ERROR_MESSAGE);
				ex.printStackTrace();
			}
		});

		// Prezioa eguneratzeko botoiaren ekintza
		prezioaEguneratuBotoia.addActionListener(e -> {
			try (Connection conn = DatabaseManager.getConnection();
					CallableStatement cstmt = conn.prepareCall("{call P_PRODUKTU_PREZIOA_EGUNERATU()}")) {

				cstmt.execute();
				JOptionPane.showMessageDialog(panel, "Produktuen prezioak ondo eguneratu dira.", "Arrakasta",
						JOptionPane.INFORMATION_MESSAGE);

			} catch (SQLException ex) {
				String errorMsg;
				switch (ex.getErrorCode()) {
				case 20010: // "EZ DIRA PRODUKTUAK SALDU"
					errorMsg = "Ezin izan dira produktuen prezioak eguneratu: ez dira produkturik saldu hilabete honetan.";
					break;
				case 20011: // "DATUREN BAT FALTA DA"
					errorMsg = "Ezin izan dira produktuen prezioak eguneratu: datuen bat falta da.";
					break;
				case 20001: // Errore ezezaguna prozeduran
					errorMsg = "Errorea datu-basean: " + ex.getMessage().replace("ORA-20001: ", "");
					break;
				default:
					errorMsg = "Errore ezezaguna prezioak eguneratzean. Error code: " + ex.getErrorCode();
					break;
				}

				JOptionPane.showMessageDialog(panel, errorMsg, "Errorea", JOptionPane.ERROR_MESSAGE);
			}
		});

		return panel;
	}

}