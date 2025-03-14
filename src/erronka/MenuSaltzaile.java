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
		JMenuItem menuItem2 = new JMenuItem("Itxi saioa");
		menu.add(menuItem1);
		menu.add(menuItem2);
		menuBar.add(menu);

		// Datu pertsonalak panel-a sortu.
		JPanel datuPertsonalakPanel = datuPertsonalakPanelSortu();
		frame.add(datuPertsonalakPanel, "NireKontua");

		// Menua-ren akzioak.
		menuItem1.addActionListener(e -> cardLayout.show(frame.getContentPane(), "NireKontua"));
		menuItem2.addActionListener(e -> System.exit(0));

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

	// Datu pertsonalak panel-a sortzeko metodoa.
	private static JPanel datuPertsonalakPanelSortu() {
		JPanel panel = new JPanel(new BorderLayout());
		JLabel nireKontuaLabel = new JLabel("Nire Kontua", SwingConstants.CENTER);
		nireKontuaLabel.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(nireKontuaLabel, BorderLayout.NORTH);

		JPanel centerPanel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);

		String[] labels = { "Izena:", "Abizena:", "Emaila:", "Telefonoa:", "Kontratazio data:", "ID Nagusia:" };
		String[] values = { Login.izena, Login.abizena, Login.emaila, Login.telefonoa,
				String.valueOf(Login.kontratazioData), String.valueOf(Login.idnagusi) };
		JTextField[] textFields = new JTextField[labels.length];

		for (int i = 0; i < labels.length; i++) {
			gbc.gridx = 0;
			gbc.gridy = i;
			centerPanel.add(new JLabel(labels[i]), gbc);

			textFields[i] = new JTextField(10);
			textFields[i].setEditable(i != 4 && i != 5); // Kontratazio data eta ID Nagusia ezin dira editatu.
			textFields[i].setText(values[i]);
			gbc.gridx = 1;
			centerPanel.add(textFields[i], gbc);
		}

		// Botón "Gorde" gehitu.
		JButton gordeButton = new JButton("Gorde");
		gbc.gridx = 0;
		gbc.gridy = labels.length;
		gbc.gridwidth = 2;
		centerPanel.add(gordeButton, gbc);

		// Botón "Gorde"-ren akzioa.
		gordeButton.addActionListener(e -> {
			String izena = textFields[0].getText();
			String abizena = textFields[1].getText();
			String emaila = textFields[2].getText();
			String telefonoa = textFields[3].getText();

			try {
				Connection conn = DBmain.konexioa();
				Statement stmt = conn.createStatement();
				String sql = "UPDATE LANGILE SET IZENA = '" + izena + "', ABIZENA = '" + abizena + "', EMAILA = '"
						+ emaila + "', TELEFONOA = '" + telefonoa + "' WHERE ID = '" + Login.id + "'";
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

	// Saltzailea panel-a sortzeko metodoa.
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
			try {
				Connection conn = DBmain.konexioa();
				Statement stmt = conn.createStatement();
				String sqlInsertLANGILE;
				if (textFields[4].getText().isEmpty()) {
					sqlInsertLANGILE = "INSERT INTO LANGILE (ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA) VALUES ((SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE),'"
							+ textFields[0].getText() + "', '" + textFields[1].getText() + "', '" + textFields[2].getText()
							+ "', '" + textFields[3].getText() + "', SYSDATE, NULL, 30000)";
				} else {
					sqlInsertLANGILE = "INSERT INTO LANGILE (ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA) VALUES ((SELECT NVL(MAX(ID), 0) + 1 FROM LANGILE),'"
							+ textFields[0].getText() + "', '" + textFields[1].getText() + "', '" + textFields[2].getText()
							+ "', '" + textFields[3].getText() + "', SYSDATE, " + textFields[4].getText() + ", 30000)";
				}
				stmt.executeUpdate(sqlInsertLANGILE);
				String sqlInsertERABILTZAILEAK = "INSERT INTO ERABILTZAILEAK (ID, ERABILTZAILEA, PASAHITZA, MOTA) SELECT ID, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS ERABILTZAILEA, LOWER(SUBSTR(IZENA, 1, 1)) || LOWER(ABIZENA) AS PASAHITZA, 'S' AS MOTA FROM LANGILE WHERE ID = (SELECT MAX(ID) FROM LANGILE)";
				stmt.executeUpdate(sqlInsertERABILTZAILEAK);
				String sqlInsertSALTZAILE = "INSERT INTO SALTZAILE (ID, ERABILTZAILEA, PASAHITZA) SELECT L.ID, E.ERABILTZAILEA, E.PASAHITZA FROM ERABILTZAILEAK E, LANGILE L WHERE L.ID=E.ID AND L.ID = (SELECT MAX(ID) FROM LANGILE)";
				stmt.executeUpdate(sqlInsertSALTZAILE);
				conn.close();
				JOptionPane.showMessageDialog(null, "Saltzailea gehitu da.");
			} catch (SQLException ex) {
				JOptionPane.showMessageDialog(null, "Errorea: saltzailea ezin da gehitu.");
				ex.printStackTrace();
			}
		});

		return panel;
	}

	// Bezeroa panel-a sortzeko metodoa.
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