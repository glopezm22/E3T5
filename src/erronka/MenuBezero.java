package erronka;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

import erronka.DB.DBProduktu;

public class MenuBezero {
	public static void main(String[] args) {
		// Frame-a sortu eta parametroak ezarri.
		JFrame frame = new JFrame("GameStop | Bezeroen menua");
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
		JPanel pasahitzaPanel = MenuSaltzaile.pasahitzaPanela();
		frame.add(pasahitzaPanel, "PasahitzaAldatu");

		menuItem1.addActionListener(e -> cardLayout.show(frame.getContentPane(), "NireKontua"));
		menuItem2.addActionListener(e -> cardLayout.show(frame.getContentPane(), "PasahitzaAldatu"));
		menuItem3.addActionListener(e -> {
			Login.saioaItxi(frame);
		});
		menuItem4.addActionListener(e -> System.exit(0));

		JMenu menu2 = new JMenu("Nire eskariak");
		JMenuItem menuItem01 = new JMenuItem("Historiala bistaratu");
		JMenuItem menuItem02 = new JMenuItem("Egoera");
		menu2.add(menuItem01);
		menu2.add(menuItem02);
		menuBar.add(menu2);

		JPanel historialaPanel = historialaikusiSortu();
		frame.add(historialaPanel, "Historiala");
		menuItem01.addActionListener(e -> cardLayout.show(frame.getContentPane(), "Historiala"));

		JPanel egoeraPanel = egoeraikusiSortu();
		frame.add(egoeraPanel, "EgoeraBistaratu");
		menuItem02.addActionListener(e -> cardLayout.show(frame.getContentPane(), "EgoeraBistaratu"));

		JMenu menu3 = new JMenu("Produktuak");
		JMenuItem menuItem001 = new JMenuItem("Ikusi");
		menu3.add(menuItem001);
		menuBar.add(menu3);

		JPanel produktuakPanel = produktuakikusiSortu();
		frame.add(produktuakPanel, "ProduktuakIkusi");

		menuItem001.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakIkusi"));

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

		String[] labels = { "Izena:", "Abizena:", "Emaila:", "Helbidea:" };
		String[] values = { Login.izena, Login.abizena, Login.emaila, Login.helbidea };
		JTextField[] textFields = new JTextField[labels.length];

		for (int i = 0; i < labels.length; i++) {
			gbc.gridx = 0;
			gbc.gridy = i + 1; // 1. lerroan hasi, "Pasahitza aldatu" label-ari espazioa uzteko
			gbc.gridwidth = 1; // Zutabearen zabalera berreskuratu
			gbc.anchor = GridBagConstraints.WEST; // Ezkerrean alineatu
			centerPanel.add(new JLabel(labels[i]), gbc);

			textFields[i] = new JTextField(10);
			textFields[i].setEditable(i != 0 && i != 1); // Izena eta abizena ezin dira editatu
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
			String helbidea = textFields[3].getText();

			try {
				Connection conn = DBmain.konexioa();
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

	private static JPanel egoeraikusiSortu() {
		JPanel panel = new JPanel(new BorderLayout());
		JLabel label = new JLabel("Egoera Bistaratu", SwingConstants.CENTER);
		label.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(label, BorderLayout.NORTH);

		JPanel centerPanel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.WEST;

		JPanel columnsPanel = new JPanel(new GridLayout(0, 3, 10, 10));

		JPanel headerPanel = new JPanel(new GridLayout(1, 3));
		headerPanel.add(new JLabel("Shipped", SwingConstants.CENTER));
		headerPanel.add(new JLabel("Canceled", SwingConstants.CENTER));
		headerPanel.add(new JLabel("Pending", SwingConstants.CENTER));

		// Agregar los encabezados al panel
		columnsPanel.add(headerPanel);

		// Consultar los estados de los pedidos del usuario
		int bezeroId = Login.id; // ID del usuario logueado
		try {
			Connection conn = DBmain.konexioa();
			PreparedStatement pstmt = conn.prepareStatement("SELECT E.ID, EG.DESKRIBAPENA " + "FROM ESKARI E "
					+ "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " + "WHERE E.ID_BEZERO = ?");
			pstmt.setInt(1, bezeroId);
			ResultSet rs = pstmt.executeQuery();

			// Crear listas para los pedidos de cada estado
			DefaultListModel<String> shippedList = new DefaultListModel<>();
			DefaultListModel<String> canceledList = new DefaultListModel<>();
			DefaultListModel<String> pendingList = new DefaultListModel<>();

			// Clasificar los pedidos por estado
			while (rs.next()) {
				int eskariId = rs.getInt("ID");
				String egoera = rs.getString("DESKRIBAPENA");

				if ("Shipped".equals(egoera)) {
					shippedList.addElement("Eskaria " + eskariId);
				} else if ("Canceled".equals(egoera)) {
					canceledList.addElement("Eskaria " + eskariId);
				} else if ("Pending".equals(egoera)) {
					pendingList.addElement("Eskaria " + eskariId);
				}
			}

			// Crear paneles para cada estado y agregar a las columnas
			columnsPanel.add(createStatusColumn(shippedList));
			columnsPanel.add(createStatusColumn(canceledList));
			columnsPanel.add(createStatusColumn(pendingList));

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea egoerak kargatzean.");
			ex.printStackTrace();
		}

		// Añadir el panel de las columnas al panel central
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.gridwidth = 3;
		centerPanel.add(columnsPanel, gbc);

		panel.add(centerPanel, BorderLayout.CENTER);
		return panel;
	}

	// Método auxiliar para crear las columnas de estado
	private static JPanel createStatusColumn(DefaultListModel<String> statusList) {
		JPanel columnPanel = new JPanel();
		columnPanel.setLayout(new BoxLayout(columnPanel, BoxLayout.Y_AXIS));

		// Añadir los elementos de la lista de estado a la columna
		for (int i = 0; i < statusList.size(); i++) {
			JLabel itemLabel = new JLabel(statusList.get(i), SwingConstants.CENTER);
			itemLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
			columnPanel.add(itemLabel);
		}

		return columnPanel;
	}

	private static JPanel historialaikusiSortu() {
		JPanel panel = new JPanel(new BorderLayout());
		JLabel label = new JLabel("Historiala", SwingConstants.CENTER);
		label.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(label, BorderLayout.NORTH);

		JPanel centerPanel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.WEST;

		JComboBox<String> comboBoxHistoriala = new JComboBox<>();
		JTextArea eskariInfoArea = new JTextArea(5, 30);
		eskariInfoArea.setEditable(false);

		int id = Login.id; // ID del usuario logueado
		kargatuEskariak(comboBoxHistoriala, id);

		// Acción al seleccionar un pedido
		comboBoxHistoriala.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String aukeratutakoEskaria = (String) comboBoxHistoriala.getSelectedItem();
				if (aukeratutakoEskaria != null) {
					int eskariId = Integer.parseInt(aukeratutakoEskaria.split(" ")[1]);
					kargatuEskariarenInformazioa(eskariId, eskariInfoArea);
				}
			}
		});

		// Agregar ComboBox y JTextArea al panel
		gbc.gridx = 0;
		gbc.gridy = 0;
		centerPanel.add(new JLabel("Aukeratu eskaria:"), gbc);
		gbc.gridx = 1;
		centerPanel.add(comboBoxHistoriala, gbc);

		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.gridwidth = 2;
		centerPanel.add(new JScrollPane(eskariInfoArea), gbc);

		panel.add(centerPanel, BorderLayout.CENTER);
		return panel;
	}

	// Método para cargar los pedidos en el ComboBox
	private static void kargatuEskariak(JComboBox<String> comboBox, int bezeroId) {
		try {
			Connection conn = DBmain.konexioa();
			PreparedStatement pstmt = conn.prepareStatement("SELECT E.ID FROM ESKARI E WHERE E.ID_BEZERO = ?");
			pstmt.setInt(1, bezeroId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				comboBox.addItem("Eskaria " + rs.getInt("ID"));
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea eskariak kargatzean.");
			ex.printStackTrace();
		}
	}

	// Método para cargar la información detallada del pedido
	private static void kargatuEskariarenInformazioa(int eskariId, JTextArea eskariInfoArea) {
		try {
			Connection conn = DBmain.konexioa();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT E.ID, L.IZENA, L.ABIZENA, E.ESKAERA_DATA, EG.DESKRIBAPENA "
							+ "FROM ESKARI E " + "JOIN LANGILE L ON E.ID_SALTZAILE = L.ID "
							+ "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " + "WHERE E.ID = ?");
			pstmt.setInt(1, eskariId);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int id = rs.getInt("ID");
				String izena = rs.getString("IZENA");
				String abizena = rs.getString("ABIZENA");
				String eskaeraData = rs.getString("ESKAERA_DATA");
				String deskribapena = rs.getString("DESKRIBAPENA");

				String erabiltzailea = izena + " " + abizena;

				eskariInfoArea.setText("Eskari ID: " + id + "\n" + "Saltzailea: " + erabiltzailea + "\n" + "Data: "
						+ eskaeraData + "\n" + "Egoera: " + deskribapena);
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea eskariaren informazioa kargatzean.");
			ex.printStackTrace();
		}
	}

	public static JPanel produktuakikusiSortu() {
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
		JTextField deskribapenaField = new JTextField(20);
		deskribapenaField.setEditable(false);

<<<<<<< HEAD
		JLabel balioaLabel = new JLabel("Balioa:");
		JTextField balioaField = new JTextField(10);
		balioaField.setEditable(false);

=======
		JLabel salneurriaLabel = new JLabel("Balioa:");
		JTextField salneurriaField = new JTextField(10);
		salneurriaField.setEditable(false);
>>>>>>> 3aba3ad437fac23ef24c6410dc307c806e52b11d

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

		// Salneurria gehitu
		gbc.gridx = 0;
		gbc.gridy = 3;
		centerPanel.add(salneurriaLabel, gbc);
		gbc.gridx = 1;
<<<<<<< HEAD

		kargatuProduktuak(comboBoxProduktuak, deskribapenaField, balioaField);
=======
		centerPanel.add(salneurriaField, gbc);

		DBProduktu.kargatuProduktuak(comboBoxProduktuak, kategoriaField, deskribapenaArea, salneurriaField);
>>>>>>> 3aba3ad437fac23ef24c6410dc307c806e52b11d

		panel.add(centerPanel, BorderLayout.CENTER);
		return panel;
	}

<<<<<<< HEAD
	private static void kargatuProduktuak(JComboBox<String> comboBox, JTextField deskribapenaField,
			JTextField balioaField) {
		try {
			Connection conn = DBmain.konexioa();
			Statement stmt = conn.createStatement();

			String query = "SELECT P.IZENA AS PRODUKTU_IZENA, K.IZENA AS KATEGORIA_IZENA " + "FROM PRODUKTU P "
					+ "JOIN KATEGORIA K ON P.ID_KATEGORIA = K.ID";

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
					String produktuaIzena = aukeratutakoProduktua.split(" \\(")[0]; // Elimina la categoría de la
																					// selección
					kargatuProduktuarenInformazioa(produktuaIzena, deskribapenaField, balioaField);
				}
			}
		});
	}

	private static void kargatuProduktuarenInformazioa(String produktua, JTextField deskribapenaField,
			JTextField balioaField) {
		try {
			Connection conn = DBmain.konexioa();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT DESKRIBAPENA, BALIOA FROM PRODUKTU WHERE IZENA = ?");
			pstmt.setString(1, produktua);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String deskribapena = rs.getString("DESKRIBAPENA");
				double balioa = rs.getDouble("BALIOA");

				deskribapenaField.setText(deskribapena);
				balioaField.setText(balioa + " €");
			} else {
				deskribapenaField.setText("");
				balioaField.setText("");
			}

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea produktuen informazioa kargatzean.");
			ex.printStackTrace();
		}
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

		String[] labels = { "Izena:", "Abizena:", "Emaila:", "Helbidea:" };
		String[] values = { Login.izena, Login.abizena, Login.emaila, Login.helbidea };
		JTextField[] textFields = new JTextField[labels.length];

		for (int i = 0; i < labels.length; i++) {
			gbc.gridx = 0;
			gbc.gridy = i + 1; // 1. lerroan hasi, "Pasahitza aldatu" label-ari espazioa uzteko
			gbc.gridwidth = 1; // Zutabearen zabalera berreskuratu
			gbc.anchor = GridBagConstraints.WEST; // Ezkerrean alineatu
			centerPanel.add(new JLabel(labels[i]), gbc);

			textFields[i] = new JTextField(10);
			textFields[i].setEditable(i != 0 && i != 1); // Izena eta abizena ezin dira editatu
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
			String helbidea = textFields[3].getText();

			try {
				Connection conn = DBmain.konexioa();
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
=======
>>>>>>> 3aba3ad437fac23ef24c6410dc307c806e52b11d
}
