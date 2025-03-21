package erronka;

//import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
//import java.util.ArrayList;
import javax.swing.*;

import erronka.DB.Erabiltzaileak;
import erronka.DB.Produktu;
import erronka.DB.DBProduktu;

import java.awt.*;

public class MenuSaltzaile {

	public static void main(String[] args) {
		// Frame-a sortu eta parametroak ezarri.
		JFrame frame = new JFrame("GameStop | Saltzaileen menua");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		frame.setSize(1920, 1080);
		CardLayout cardLayout = new CardLayout();
		frame.setLayout(cardLayout);

		// Defektuzko panela BETI bistaratuko dena hasieran.
		JPanel defaultPanel = new JPanel();
		frame.add(defaultPanel, "Default");
		cardLayout.show(frame.getContentPane(), "Default");

		// Menua sortu eta antolatu.
		JMenuBar menuBar = new JMenuBar();
		JMenu menu = new JMenu("Nire kontua");
		JMenuItem menuItem1 = new JMenuItem("Datu pertsonalak");
		JMenuItem menuItem2 = new JMenuItem("Pasahitza aldatu");
		JMenuItem menuItem3 = new JMenuItem("Itxi saioa");
		JMenuItem menuItem4 = new JMenuItem("Itxi programa");
		menu.add(menuItem1);
		menu.add(menuItem2);
		menu.add(menuItem3);
		menu.add(menuItem4);
		menuBar.add(menu);

		// Datu pertsonalak panel-a sortu.
		JPanel datuPertsonalakPanel = datuPertsonalakPanelSortu();
		frame.add(datuPertsonalakPanel, "NireKontua");

		// Pasahitza aldatu panel-a sortu.
		JPanel pasahitzaPanel = pasahitzaPanela();
		frame.add(pasahitzaPanel, "PasahitzaAldatu");

		// Menua-ren akzioak.
		menuItem1.addActionListener(e -> cardLayout.show(frame.getContentPane(), "NireKontua"));
		menuItem2.addActionListener(e -> cardLayout.show(frame.getContentPane(), "PasahitzaAldatu"));
		menuItem3.addActionListener(e -> {
			Login.saioaItxi(frame);
		});
		menuItem4.addActionListener(e -> System.exit(0));

		// Erabiltzaileak menua sortu.
		JMenu menu2 = new JMenu("Erabiltzaileak");
		JMenuItem menuItem01 = new JMenuItem("Gehitu");
		JMenuItem menuItem02 = new JMenuItem("Ezabatu");
		JMenuItem menuItem03 = new JMenuItem("Kontsultatu");
		menu2.add(menuItem01);
		menu2.add(menuItem02);
		menu2.add(menuItem03);
		menuBar.add(menu2);

		// Produktuak menua sortu.
		JMenu menu3 = new JMenu("Produktuak");
		JMenuItem menuItem001 = new JMenuItem("Bistaratu");
		JMenuItem menuItem002 = new JMenuItem("Gehitu");
		JMenuItem menuItem003 = new JMenuItem("Ezabatu");
		JMenuItem menuItem004 = new JMenuItem("Editatu");
		menu3.add(menuItem001);
		menu3.add(menuItem002);
		menu3.add(menuItem003);
		menu3.add(menuItem004);
		menuBar.add(menu3);
		
		// Produktuak bistaratzeko panela sortu.
		JPanel panelProduktuakBistaratu = MenuBezero.produktuakikusiSortu();
		frame.add(panelProduktuakBistaratu, "ProduktuakBistaratu");
		
		// Produktuak gehitu panela sortu.
		JPanel produktuakPanel = produktuakgehituSortu();
		frame.add(produktuakPanel, "ProduktuakGehitu");
		
		// Menua-ren akzioak.
		menuItem001.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakBistaratu"));
		menuItem002.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakGehitu"));

		// Eskariak menua sortu.
		JMenu menu4 = new JMenu("Eskariak");
		JMenuItem menuItem0001 = new JMenuItem("Bistaratu");
		menu4.add(menuItem0001);
		menuBar.add(menu4);

		// Panel nagusia sortu.
		JPanel mainPanel = new JPanel(new BorderLayout());
		frame.add(mainPanel, "MainPanel");

		// ComboBox panela sortu.
		JPanel comboBoxPanel = new JPanel();
		JComboBox<String> comboBox = new JComboBox<>(new String[] { "Saltzailea", "Bezeroa" });
		comboBoxPanel.add(comboBox);
		mainPanel.add(comboBoxPanel, BorderLayout.NORTH);

		// CardLayout panel-a sortu.
		JPanel cardPanel = new JPanel(new CardLayout());
		mainPanel.add(cardPanel, BorderLayout.CENTER);

		// Saltzailea panel-a sortu.
		JPanel panelSaltzailea = saltzaileaPanelSortu();
		cardPanel.add(panelSaltzailea, "Saltzailea");

		// Bezeroa panel-a sortu.
		JPanel panelBezeroa = bezeroaPanelSortu();
		cardPanel.add(panelBezeroa, "Bezeroa");

		// ComboBox-aren akzioa.
		comboBox.addActionListener(e -> {
			CardLayout cl = (CardLayout) (cardPanel.getLayout());
			cl.show(cardPanel, (String) comboBox.getSelectedItem());
		});

		// Menu item-aren akzioa.
		menuItem01.addActionListener(e -> cardLayout.show(frame.getContentPane(), "MainPanel"));

		// Erabiltzaileak ezabatzeko panel-a sortu.
		JPanel panelErabiltzaileakEzabatu = erabiltzaileakEzabatuPanelSortu();
		frame.add(panelErabiltzaileakEzabatu, "PanelErabiltzaileakEzabatu");

		// Erabiltzaileak kontsultatzeko panel-a sortu.
//		JPanel panelErabiltzaileakKontsultatu = erabiltzaileakKontsultatuPanelSortu();
//		frame.add(panelErabiltzaileakKontsultatu, "PanelErabiltzaileakKontsultatu");

		// Menu item-aren akzioa "Ezabatu" aukerarako.
		menuItem02.addActionListener(e -> {
			cardLayout.show(frame.getContentPane(), "PanelErabiltzaileakEzabatu");
		});

		frame.setJMenuBar(menuBar);

		frame.setVisible(true);
	}

	// Datu pertsonalak bistaratzeko panel-a sortzeko metodoa.
	private static JPanel datuPertsonalakPanelSortu() {
		JPanel panel = new JPanel(new BorderLayout());

		JPanel centerPanel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);

		// Nire kontua label-a sortu.
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

		for (int i = 0; i < labels.length; i++) {
			gbc.gridx = 0;
			gbc.gridy = i + 1; // 1. lerroan hasi, "Pasahitza aldatu" label-ari espazioa uzteko
			gbc.gridwidth = 1; // Zutabearen zabalera berreskuratu
			gbc.anchor = GridBagConstraints.WEST; // Ezkerrean alineatu
			centerPanel.add(new JLabel(labels[i]), gbc);

			textFields[i] = new JTextField(10);
			textFields[i].setEditable(i != 0 && i != 1 && i != 4 && i != 5); // Izena, abizena, kontratazio data eta ID
																				// Nagusia ezin dira editatu
			textFields[i].setText(values[i]);
			gbc.gridx = 1;
			centerPanel.add(textFields[i], gbc);
		}

		// Botón "Gorde" gehitu.
		JButton gordeButton = new JButton("Gorde");
		gbc.gridx = 0;
		gbc.gridy = labels.length + 1;
		gbc.gridwidth = 2;
		gbc.anchor = GridBagConstraints.CENTER;
		centerPanel.add(gordeButton, gbc);

		// Gorde botoiaren akzioa.
		gordeButton.addActionListener(e -> {
			String emaila = textFields[2].getText();
			String telefonoa = textFields[3].getText();

			try {
				Connection conn = DBmain.konexioa();
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

	// Pasahitza aldatzeko panel-a sortzeko metodoa.
	public static JPanel pasahitzaPanela() {
        JPanel panel = new JPanel(new BorderLayout());

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        JLabel pasahitzaAldatuLabel = new JLabel("Pasahitza aldatu", SwingConstants.CENTER);
        pasahitzaAldatuLabel.setFont(new Font("Arial", Font.BOLD, 26));
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2; // Bi zutabe hartzen ditu
        gbc.anchor = GridBagConstraints.CENTER; // Panela erdian
        centerPanel.add(pasahitzaAldatuLabel, gbc);

        String[] labels = { "Erabiltzaile-izena:", "Pasahitza:", "Pasahitza berria:", "Pasahitza berria errepikatu:" };
        String[] values = { Login.erabiltzailea, null, null, null };
        JTextField[] textFields = new JTextField[labels.length];

        for (int i = 0; i < labels.length; i++) {
            gbc.gridx = 0;
            gbc.gridy = i + 1; // 1. lerroan hasi, "Pasahitza aldatu" label-ari espazioa uzteko
            gbc.gridwidth = 1; // Zutabearen zabalera berreskuratu
            gbc.anchor = GridBagConstraints.WEST; // Ezkerrean alineatu
            centerPanel.add(new JLabel(labels[i]), gbc);

            if (i == 1 || i == 2 || i == 3) {
                textFields[i] = new JPasswordField(10);
            } else {
                textFields[i] = new JTextField(10);
            }

            textFields[i].setEditable(i != 0); // Erabiltzaile-izena ezin da editatu.
            textFields[i].setText(values[i]);
            gbc.gridx = 1;
            centerPanel.add(textFields[i], gbc);
        }

        // "Gorde" botoia.
        JButton gordeButton = new JButton("Gorde");
        gbc.gridx = 0;
        gbc.gridy = labels.length + 1;
        gbc.gridwidth = 2;
        gbc.anchor = GridBagConstraints.CENTER;
        centerPanel.add(gordeButton, gbc);

        // Botón "Gorde"-ren akzioa.
        gordeButton.addActionListener(e -> {
            String pasahitzaZaharra = new String(((JPasswordField) textFields[1]).getPassword());
            String pasahitzaBerria = new String(((JPasswordField) textFields[2]).getPassword());
            String pasahitzaBerriaErrepikatu = new String(((JPasswordField) textFields[3]).getPassword());

            // Ziurtatu pasahitzak bat datozela
            if (!pasahitzaBerria.equals(pasahitzaBerriaErrepikatu)) {
                JOptionPane.showMessageDialog(null, "Errorea: pasahitzak ez datoz bat.");
                return;
            }

            try {
                Connection conn = DBmain.konexioa();
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

	// Saltzaileak sortzeko panel-a sortzeko metodoa.
	private static JPanel saltzaileaPanelSortu() {
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
				DBmain.saltzaileEdoBezeroSortu("LANGILE",
						"ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA",
						"(SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), '" + textFields[0].getText() + "', '"
								+ textFields[1].getText() + "', '" + textFields[2].getText() + "', '"
								+ textFields[3].getText() + "', SYSDATE, NULL, 30000");

			} else {
				DBmain.saltzaileEdoBezeroSortu("LANGILE",
						"ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA",
						"(SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), '" + textFields[0].getText() + "', '"
								+ textFields[1].getText() + "', '" + textFields[2].getText() + "', '"
								+ textFields[3].getText() + "', SYSDATE, " + textFields[4].getText() + ", 30000");

			}
			DBmain.erabiltzaileaSortu("ERABILTZAILEAK", "ID, ERABILTZAILEA, PASAHITZA, MOTA",
					"ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS ERABILTZAILEA, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS PASAHITZA, 'S' AS MOTA FROM LANGILE WHERE ID = (SELECT MAX(ID) FROM LANGILE)");
		for (int i = 0; i < labels.length; i++) {
            textFields[i].setText("");
        }
		});
		return panel;
	}

	// Bezeroak sortzeko panel-a sortzeko metodoa.
	private static JPanel bezeroaPanelSortu() {
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
				Connection conn = DBmain.konexioa();
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

	// Erabiltzaileak ezabatzeko panel-a sortzeko metodoa.
	private static JPanel erabiltzaileakEzabatuPanelSortu() {
		JPanel panel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);

		JLabel labelComboBox = new JLabel("Aukeratu erabiltzailea:");
		gbc.gridx = 0;
		gbc.gridy = 0;
		panel.add(labelComboBox, gbc);

		JComboBox<Erabiltzaileak> comboBoxUsuarios = new JComboBox<>();
		gbc.gridx = 1;
		panel.add(comboBoxUsuarios, gbc);

		// Línea separadora
		JSeparator separator = new JSeparator();
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.gridwidth = 2;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		panel.add(separator, gbc);

		JTextField izenaField = new JTextField(20);
		izenaField.setEditable(false);
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.gridwidth = 2;
		panel.add(new JLabel("Izena:"), gbc);
		gbc.gridy = 3;
		panel.add(izenaField, gbc);

		JTextField abizenaField = new JTextField(20);
		abizenaField.setEditable(false);
		gbc.gridy = 4;
		panel.add(new JLabel("Abizena:"), gbc);
		gbc.gridy = 5;
		panel.add(abizenaField, gbc);

		JTextField motaField = new JTextField(20);
		motaField.setEditable(false);
		gbc.gridy = 6;
		panel.add(new JLabel("Mota:"), gbc);
		gbc.gridy = 7;
		panel.add(motaField, gbc);

		JButton ezabatu = new JButton("Ezabatu");
		gbc.gridx = 0;
		gbc.gridy = 8;
		gbc.gridwidth = 2;
		panel.add(ezabatu, gbc);

		erabiltzaileakComboBox(comboBoxUsuarios);

		comboBoxUsuarios.addActionListener(e -> {
			Erabiltzaileak selectedUser = (Erabiltzaileak) comboBoxUsuarios.getSelectedItem();
			if (selectedUser != null) {
				izenaField.setText(selectedUser.getIzena());
				abizenaField.setText(selectedUser.getAbizena());
				motaField.setText(selectedUser.getMota());
				if (motaField.getText().equals("S")) {
					motaField.setText("Saltzailea");
				} else if (motaField.getText().equals("B")) {
					motaField.setText("Bezeroa");
				}
			}
		});

		ezabatu.addActionListener(e -> {
			Erabiltzaileak erabiltzailea = (Erabiltzaileak) comboBoxUsuarios.getSelectedItem();
			if (erabiltzailea != null) {
				try {
					Connection conn = DBmain.konexioa();
					Statement stmt = conn.createStatement();
					String sql = "DELETE FROM ERABILTZAILEAK WHERE ID = " + erabiltzailea.getId();
					int rowsAffected = stmt.executeUpdate(sql);
					if (rowsAffected > 0) {
						JOptionPane.showMessageDialog(null,
								"'" + erabiltzailea.getErabiltzailea() + "' erabiltzailea ezabatuta.");
						comboBoxUsuarios.removeItem(erabiltzailea);
						izenaField.setText("");
						abizenaField.setText("");
						motaField.setText("");

						// Si es BEZERO, borrar también de la tabla BEZEROAK
						if (erabiltzailea.getMota().equals("B")) {
							stmt.executeUpdate("DELETE FROM BEZERO WHERE ID = " + erabiltzailea.getId());
						}
						// Si es LANGILE, borrar también de la tabla LANGILEAK
						else if (erabiltzailea.getMota().equals("S")) {
							stmt.executeUpdate("DELETE FROM LANGILE WHERE ID = " + erabiltzailea.getId());
						}
					} else {
						JOptionPane.showMessageDialog(null, "Errorea: erabiltzailea ez da aurkitu.");
					}
					conn.close();
				} catch (SQLException ex) {
					JOptionPane.showMessageDialog(null, "Errorea: ezin da erabiltzailea ezabatu.");
					ex.printStackTrace();
				}
			}
		});

		return panel;
	}

	// Erabiltzaileak ComboBox-ean kargatzeko metodoa.
	private static void erabiltzaileakComboBox(JComboBox<Erabiltzaileak> comboBoxUsuarios) {
		try {
			Connection conn = DBmain.konexioa();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT E.ID, E.ERABILTZAILEA, E.PASAHITZA, E.MOTA, "
					+ "L.IZENA AS LANGILE_IZENA, L.ABIZENA AS LANGILE_ABIZENA, L.EMAILA AS LANGILE_EMAILA, "
					+ "B.IZENA AS BEZERO_IZENA, B.ABIZENA AS BEZERO_ABIZENA, B.EMAILA AS BEZERO_EMAILA "
					+ "FROM ERABILTZAILEAK E " + "LEFT JOIN LANGILE L ON E.ID = L.ID AND E.MOTA = 'S' "
					+ "LEFT JOIN BEZERO B ON E.ID = B.ID AND E.MOTA = 'B'");

			while (rs.next()) {
				String mota = rs.getString("MOTA");
				String izena = mota.equals("S") ? rs.getString("LANGILE_IZENA") : rs.getString("BEZERO_IZENA");
				String abizena = mota.equals("S") ? rs.getString("LANGILE_ABIZENA") : rs.getString("BEZERO_ABIZENA");
				String emaila = mota.equals("S") ? rs.getString("LANGILE_EMAILA") : rs.getString("BEZERO_EMAILA");
				String erabiltzailea = rs.getString("ERABILTZAILEA");
				String pasahitza = rs.getString("PASAHITZA");

				Erabiltzaileak erabiltzaileaObj = new Erabiltzaileak(rs.getInt("ID"), izena, abizena, emaila,
						erabiltzailea, pasahitza, mota);
				comboBoxUsuarios.addItem(erabiltzaileaObj);
			}
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea: ezin dira erabiltzaileak kargatu.");
			ex.printStackTrace();
		}
	}

	private static JPanel produktuakgehituSortu() {
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

//	// Erabiltzaileak datu-baseetatik kargatzeko metodoa.
//	private static List<String[]> cargarUsuariosDesdeBD() {
//		List<String[]> usuarios = new ArrayList<>();
//		try {
//			Connection conn = DBmain.konexioa();
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("SELECT ERABILTZAILEA, PASAHITZA FROM ERABILTZAILEAK");
//			while (rs.next()) {
//				usuarios.add(new String[] { rs.getString("ERABILTZAILEA"), rs.getString("PASAHITZA") });
//			}
//			conn.close();
//		} catch (SQLException ex) {
//			JOptionPane.showMessageDialog(null, "Errorea: ezin dira erabiltzaileak kargatu.");
//			ex.printStackTrace();
//		}
//		return usuarios;
//	}

//	// Erabiltzailearen panel-a sortzeko metodoa.
//	private static JPanel erabiltzailePanelaSortu(String erabiltzailea, String pasahitza) {
//		JPanel panelUsuario = new JPanel();
//		panelUsuario.setLayout(new FlowLayout());
//		panelUsuario.setBorder(BorderFactory.createLineBorder(Color.BLACK));
//
//		JLabel fotoLabel = new JLabel();
//		fotoLabel.setIcon(new ImageIcon("../irudiak/user.png"));
//
//		JLabel userLabel = new JLabel("Erabiltzailea: " + erabiltzailea);
//		JLabel passLabel = new JLabel("Pasahitza: " + pasahitza);
//
//		panelUsuario.add(fotoLabel);
//		panelUsuario.add(userLabel);
//		panelUsuario.add(passLabel);
//
//		return panelUsuario;
//	}

}