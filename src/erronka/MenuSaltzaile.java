package erronka;

import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.*;
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

		// Eskariak menua sortu.
		JMenu menu4 = new JMenu("Eskariak");
		JMenuItem menuItem0001 = new JMenuItem("Bistaratu");
		menu4.add(menuItem0001);
		menuBar.add(menu4);

		frame.setJMenuBar(menuBar);

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
		JPanel panelErabiltzaileakKontsultatu = erabiltzaileakKontsultatuPanelSortu();
		frame.add(panelErabiltzaileakKontsultatu, "PanelErabiltzaileakKontsultatu");

		// Menu item-aren akzioa "Ezabatu" aukerarako.
		menuItem02.addActionListener(e -> {
			cardLayout.show(frame.getContentPane(), "PanelErabiltzaileakEzabatu");
		});

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

		// Botón "Gorde" gehitu.
		JButton gordeButton = new JButton("Gorde");
		gbc.gridx = 0;
		gbc.gridy = labels.length + 1; // Ajustar la fila para el botón
		gbc.gridwidth = 2;
		gbc.anchor = GridBagConstraints.CENTER; // Centrar el botón
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
		        Statement stmt = conn.createStatement();

		        // Egiaztatzen du pasahitza zaharra eta erabiltzaile-izena zuzenak direla.
		        String checkSql = "SELECT COUNT(*) FROM ERABILTZAILEAK WHERE ID = " + Login.id
		                + " AND ERABILTZAILEA = '" + Login.erabiltzailea + "' AND PASAHITZA = '" + pasahitzaZaharra
		                + "' AND MOTA = '" + Login.mota + "'";
		        ResultSet rs = stmt.executeQuery(checkSql);

		        // Egiaztatu erregistro bat existitzen dela
		        if (rs.next() && rs.getInt(1) > 0) {
		            String pasahitzaEguneratuSQL = "UPDATE ERABILTZAILEAK SET PASAHITZA = '" + pasahitzaBerria + "' WHERE ID = " + Login.id
		                    + " AND ERABILTZAILEA = '" + Login.erabiltzailea + "' AND PASAHITZA = '" + pasahitzaZaharra
		                    + "' AND MOTA = '" + Login.mota + "'";
		            stmt.executeUpdate(pasahitzaEguneratuSQL);
		            JOptionPane.showMessageDialog(null, "Pasahitza eguneratu da.");
		        } else {
		            // Ez badaude erregistro bat, errorea erakutsi
		            JOptionPane.showMessageDialog(null, "Errorea: pasahitza okerra da.");
		        }

		        conn.close();
		    } catch (SQLException ex) {
		        JOptionPane.showMessageDialog(null, "Errorea: ezin da pasahitza eguneratu.");
		        ex.printStackTrace();
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
				DBmain.saltzaileBezeroSortu("LANGILE",
						"ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA",
						"(SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), '" + textFields[0].getText() + "', '"
								+ textFields[1].getText() + "', '" + textFields[2].getText() + "', '"
								+ textFields[3].getText() + "', SYSDATE, " + textFields[4].getText() + ", 30000");

			} else {
				DBmain.saltzaileBezeroSortu("LANGILE",
						"ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA",
						"(SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE), '" + textFields[0].getText() + "', '"
								+ textFields[1].getText() + "', '" + textFields[2].getText() + "', '"
								+ textFields[3].getText() + "', SYSDATE, NULL, 30000");

			}
			DBmain.erabiltzaileaSortu("ERABILTZAILEAK", "ID, ERABILTZAILEA, PASAHITZA, MOTA",
					"ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS ERABILTZAILEA, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS PASAHITZA, 'S' AS MOTA FROM LANGILE WHERE ID = (SELECT MAX(ID) FROM LANGILE)");
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

		JComboBox<String> comboBoxUsuarios = new JComboBox<>();
		gbc.gridx = 1;
		panel.add(comboBoxUsuarios, gbc);

		JTextField datosUsuario = new JTextField(20);
		datosUsuario.setEditable(false);
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.gridwidth = 2;
		panel.add(datosUsuario, gbc);

		JButton ezabatu = new JButton("Ezabatu");
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.gridwidth = 2;
		panel.add(ezabatu, gbc);

		cargarUsuariosEnComboBox(comboBoxUsuarios);

		comboBoxUsuarios.addActionListener(e -> {
			String selectedUser = (String) comboBoxUsuarios.getSelectedItem();
			if (selectedUser != null) {
				datosUsuario.setText("Erabiltzailea: " + selectedUser);
			}
		});

		ezabatu.addActionListener(e -> {
			String erabiltzailea = (String) comboBoxUsuarios.getSelectedItem();
			if (erabiltzailea != null) {
				try {
					Connection conn = DBmain.konexioa();
					Statement stmt = conn.createStatement();
					String sql = "DELETE FROM ERABILTZAILEAK WHERE ERABILTZAILEA = '" + erabiltzailea + "'";
					int rowsAffected = stmt.executeUpdate(sql);
					if (rowsAffected > 0) {
						JOptionPane.showMessageDialog(null, "'" + erabiltzailea + "' erabiltzailea ezabatuta.");
						comboBoxUsuarios.removeItem(erabiltzailea);
						datosUsuario.setText("");
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

	// Erabiltzaileak kontsultatzeko panel-a sortzeko metodoa.
	private static JPanel erabiltzaileakKontsultatuPanelSortu() {
		JPanel panelPrincipal = new JPanel(new BorderLayout());
		JPanel panel = new JPanel();
		panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));

		JScrollPane scrollPane = new JScrollPane(panel);
		List<String[]> usuarios = cargarUsuariosDesdeBD();
		for (String[] usuario : usuarios) {
			panel.add(erabiltzailePanelaSortu(usuario[0], usuario[1]));
		}

		panelPrincipal.add(scrollPane, BorderLayout.CENTER);
		return panelPrincipal;
	}

	// Erabiltzaileak ComboBox-ean kargatzeko metodoa.
	private static void cargarUsuariosEnComboBox(JComboBox<String> comboBoxUsuarios) {
		try {
			Connection conn = DBmain.konexioa();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ERABILTZAILEA FROM ERABILTZAILEAK");
			while (rs.next()) {
				comboBoxUsuarios.addItem(rs.getString("ERABILTZAILEA"));
			}
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea: ezin dira erabiltzaileak kargatu.");
			ex.printStackTrace();
		}
	}

	// Erabiltzaileak datu-baseetatik kargatzeko metodoa.
	private static List<String[]> cargarUsuariosDesdeBD() {
		List<String[]> usuarios = new ArrayList<>();
		try {
			Connection conn = DBmain.konexioa();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ERABILTZAILEA, PASAHITZA FROM ERABILTZAILEAK");
			while (rs.next()) {
				usuarios.add(new String[] { rs.getString("ERABILTZAILEA"), rs.getString("PASAHITZA") });
			}
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea: ezin dira erabiltzaileak kargatu.");
			ex.printStackTrace();
		}
		return usuarios;
	}

	// Erabiltzailearen panel-a sortzeko metodoa.
	private static JPanel erabiltzailePanelaSortu(String erabiltzailea, String pasahitza) {
		JPanel panelUsuario = new JPanel();
		panelUsuario.setLayout(new FlowLayout());
		panelUsuario.setBorder(BorderFactory.createLineBorder(Color.BLACK));

		JLabel fotoLabel = new JLabel();
		fotoLabel.setIcon(new ImageIcon("../irudiak/user.png"));

		JLabel userLabel = new JLabel("Erabiltzailea: " + erabiltzailea);
		JLabel passLabel = new JLabel("Pasahitza: " + pasahitza);

		panelUsuario.add(fotoLabel);
		panelUsuario.add(userLabel);
		panelUsuario.add(passLabel);

		return panelUsuario;
	}
}