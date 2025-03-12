
package erronka;

import java.util.List;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
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

		///// Lehenengo menua sortu eta antolatu egiten da.
		JMenuBar menuBar = new JMenuBar();
		JMenu menu = new JMenu("Nire kontua");
		JMenuItem menuItem1 = new JMenuItem("Datu pertsonalak");
		JMenuItem menuItem2 = new JMenuItem("Itxi saioa");
		menu.add(menuItem1);
		menu.add(menuItem2);
		menuBar.add(menu);
		
		// Lehenengo menuaren akzioak.
		menuItem1.addActionListener(e -> {
		    cardLayout.show(frame.getContentPane(), "NireKontua");
		    
		    JPanel datuPertsonalakPanel = new JPanel(new BorderLayout());
		    
		    JLabel nireKontuaLabel = new JLabel("Nire Kontua", SwingConstants.CENTER);
		    nireKontuaLabel.setFont(new Font("Arial", Font.BOLD, 24));
		    
		    JPanel centerPanel = new JPanel(new GridBagLayout());
		    GridBagConstraints gbc = new GridBagConstraints();
		    gbc.gridx = 0;
		    gbc.gridy = 0;
		    gbc.insets = new Insets(10, 10, 10, 10);
		    
		    JTextArea datuPertsonalakTextArea = new JTextArea(10, 20);
		    datuPertsonalakTextArea.setEditable(false);
		    datuPertsonalakTextArea.setLineWrap(true);
		    datuPertsonalakTextArea.setWrapStyleWord(true);
		    
		    JScrollPane scrollPane = new JScrollPane(datuPertsonalakTextArea);
		    centerPanel.add(scrollPane, gbc);
		    
		    datuPertsonalakPanel.add(nireKontuaLabel, BorderLayout.NORTH);
		    datuPertsonalakPanel.add(centerPanel, BorderLayout.CENTER);
		    
		    frame.add(datuPertsonalakPanel, "NireKontua");
		    
		    datuPertsonalakTextArea.setText("Izena: Juan\nAbizena: Perez\nEmaila: juan.perez@example.com\nTelefonoa: 123456789");
		    cardLayout.show(frame.getContentPane(), "NireKontua");
		});
		menuItem2.addActionListener(e -> {
			System.exit(0);
		});

		
		
		///// Bigarren menua sortu eta antolatu egiten da.
		JMenu menu2 = new JMenu("Erabiltzaileak");
		JMenuItem menuItem01 = new JMenuItem("Gehitu");
		JMenuItem menuItem02 = new JMenuItem("Ezabatu");
		JMenuItem menuItem03 = new JMenuItem("Kontsultatu");
		menu2.add(menuItem01);
		menu2.add(menuItem02);
		menu2.add(menuItem03);
		menuBar.add(menu2);

		///// Hirugarren menua sortu eta antolatu egiten da.
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

		///// Laugarren menua sortu eta antolatu egiten da.
		JMenu menu4 = new JMenu("Eskariak");
		JMenuItem menuItem0001 = new JMenuItem("Bistaratu");
		menu4.add(menuItem0001);
		menuBar.add(menu4);

		frame.setJMenuBar(menuBar);

		// Defektuzko panela BETI bistaratuko dena hasieran.
		JPanel defaultPanel = new JPanel();
		frame.add(defaultPanel, "Default");

		// Panel nagusia sortzeko erabiltzaileak
		JPanel mainPanel = new JPanel(new BorderLayout());
		frame.add(mainPanel, "MainPanel");

		// ComboBox panela aukeratzeko erabiltzaile mota
		JPanel comboBoxPanel = new JPanel();
		JComboBox<String> comboBox = new JComboBox<>();
		comboBox.addItem("Saltzailea");
		comboBox.addItem("Bezeroa");
		comboBoxPanel.add(comboBox);
		mainPanel.add(comboBoxPanel, BorderLayout.NORTH);

		// CardLayout panel for user creation
		JPanel cardPanel = new JPanel(new CardLayout());
		mainPanel.add(cardPanel, BorderLayout.CENTER);

		// Panel for creating "Saltzailea"
		JPanel panelSaltzailea = new JPanel(new GridBagLayout());
		GridBagConstraints gbcSaltzailea = new GridBagConstraints();
		gbcSaltzailea.insets = new Insets(10, 10, 10, 10);

		JLabel izenaLabel = new JLabel("Izena:");
		gbcSaltzailea.gridx = 0;
		gbcSaltzailea.gridy = 0;
		gbcSaltzailea.gridwidth = 1;
		gbcSaltzailea.fill = GridBagConstraints.HORIZONTAL;
		panelSaltzailea.add(izenaLabel, gbcSaltzailea);

		JTextField izena = new JTextField(10);
		gbcSaltzailea.gridx = 1;
		gbcSaltzailea.gridy = 0;
		gbcSaltzailea.gridwidth = 1;
		panelSaltzailea.add(izena, gbcSaltzailea);

		JLabel abizenaLabel = new JLabel("Abizena:");
		gbcSaltzailea.gridx = 0;
		gbcSaltzailea.gridy = 1;
		gbcSaltzailea.gridwidth = 1;
		gbcSaltzailea.fill = GridBagConstraints.HORIZONTAL;
		panelSaltzailea.add(abizenaLabel, gbcSaltzailea);

		JTextField abizena = new JTextField(10);
		gbcSaltzailea.gridx = 1;
		gbcSaltzailea.gridy = 1;
		gbcSaltzailea.gridwidth = 1;
		panelSaltzailea.add(abizena, gbcSaltzailea);

		JLabel emailaLabel = new JLabel("Emaila:");
		gbcSaltzailea.gridx = 0;
		gbcSaltzailea.gridy = 2;
		gbcSaltzailea.gridwidth = 1;
		gbcSaltzailea.fill = GridBagConstraints.HORIZONTAL;
		panelSaltzailea.add(emailaLabel, gbcSaltzailea);

		JTextField emaila = new JTextField(10);
		gbcSaltzailea.gridx = 1;
		gbcSaltzailea.gridy = 2;
		gbcSaltzailea.gridwidth = 1;
		panelSaltzailea.add(emaila, gbcSaltzailea);

		JLabel telefonoaLabel = new JLabel("Telefonoa:");
		gbcSaltzailea.gridx = 0;
		gbcSaltzailea.gridy = 3;
		gbcSaltzailea.gridwidth = 1;
		gbcSaltzailea.fill = GridBagConstraints.HORIZONTAL;
		panelSaltzailea.add(telefonoaLabel, gbcSaltzailea);

		JTextField telefonoa = new JTextField(10);
		gbcSaltzailea.gridx = 1;
		gbcSaltzailea.gridy = 3;
		gbcSaltzailea.gridwidth = 1;
		panelSaltzailea.add(telefonoa, gbcSaltzailea);

		JLabel nagusiaLabel = new JLabel("ID Nagusia:");
		gbcSaltzailea.gridx = 0;
		gbcSaltzailea.gridy = 4;
		gbcSaltzailea.gridwidth = 1;
		gbcSaltzailea.fill = GridBagConstraints.HORIZONTAL;
		panelSaltzailea.add(nagusiaLabel, gbcSaltzailea);

		JTextField nagusia = new JTextField(10);
		gbcSaltzailea.gridx = 1;
		gbcSaltzailea.gridy = 4;
		gbcSaltzailea.gridwidth = 1;
		panelSaltzailea.add(nagusia, gbcSaltzailea);

		JButton gehituSaltzailea = new JButton("Gehitu");
		gbcSaltzailea.gridx = 0;
		gbcSaltzailea.gridy = 5;
		gbcSaltzailea.gridwidth = 2;
		panelSaltzailea.add(gehituSaltzailea, gbcSaltzailea);

		gehituSaltzailea.addActionListener(e -> {
			String izenaS = izena.getText();
			String abizenaS = abizena.getText();
			String emailaS = emaila.getText();
			String telefonoaS = telefonoa.getText();
			String nagusiaS = nagusia.getText();

			try {
				Connection conn = DriverManager.getConnection(DB.url, DB.erabiltzailea, DB.pasahitza);
				Statement stmt = conn.createStatement();
				String sql = "INSERT INTO LANGILE (ID, IZENA, ABIZENA, EMAILA, TELEFONOA, KONTRATAZIO_DATA, ID_NAGUSI, SOLDATA) VALUES ('1234', '"
						+ izenaS + "', '" + abizenaS + "', '" + emailaS + "', '" + telefonoaS + "', 10/10/20, '"
						+ nagusiaS + "', 100)";
				stmt.executeUpdate(sql);
				String sql2 = "INSERT INTO SALTZAILE (ID, ERABILTZAILEA, PASAHITZA) VALUES ('1234', '" + izenaS + "', '"
						+ abizenaS + "')";
				stmt.executeUpdate(sql2);
				conn.close();
				JOptionPane.showMessageDialog(null, "Saltzailea gehitu da.");
			} catch (SQLException ex) {
				JOptionPane.showMessageDialog(null, "Errorea: saltzailea ezin da gehitu.");
			}
		});

		// Panel for creating "Bezeroa"
		JPanel panelBezeroa = new JPanel(new GridBagLayout());
		GridBagConstraints gbcBezeroa = new GridBagConstraints();
		gbcBezeroa.insets = new Insets(10, 10, 10, 10);

		JLabel izenaLabelB = new JLabel("Izena:");
		gbcBezeroa.gridx = 0;
		gbcBezeroa.gridy = 0;
		gbcBezeroa.gridwidth = 1;
		gbcBezeroa.fill = GridBagConstraints.HORIZONTAL;
		panelBezeroa.add(izenaLabelB, gbcBezeroa);

		JTextField izenaB = new JTextField(10);
		gbcBezeroa.gridx = 1;
		gbcBezeroa.gridy = 0;
		gbcBezeroa.gridwidth = 1;
		panelBezeroa.add(izenaB, gbcBezeroa);

		JLabel abizenaLabelB = new JLabel("Abizena:");
		gbcBezeroa.gridx = 0;
		gbcBezeroa.gridy = 1;
		gbcBezeroa.gridwidth = 1;
		gbcBezeroa.fill = GridBagConstraints.HORIZONTAL;
		panelBezeroa.add(abizenaLabelB, gbcBezeroa);

		JTextField abizenaB = new JTextField(10);
		gbcBezeroa.gridx = 1;
		gbcBezeroa.gridy = 1;
		gbcBezeroa.gridwidth = 1;
		panelBezeroa.add(abizenaB, gbcBezeroa);

		JLabel emailaLabelB = new JLabel("Emaila:");
		gbcBezeroa.gridx = 0;
		gbcBezeroa.gridy = 2;
		gbcBezeroa.gridwidth = 1;
		gbcBezeroa.fill = GridBagConstraints.HORIZONTAL;
		panelBezeroa.add(emailaLabelB, gbcBezeroa);

		JTextField emailaB = new JTextField(10);
		gbcBezeroa.gridx = 1;
		gbcBezeroa.gridy = 2;
		gbcBezeroa.gridwidth = 1;
		panelBezeroa.add(emailaB, gbcBezeroa);

		JLabel helbideaLabelB = new JLabel("Helbidea:");
		gbcBezeroa.gridx = 0;
		gbcBezeroa.gridy = 3;
		gbcBezeroa.gridwidth = 1;
		gbcBezeroa.fill = GridBagConstraints.HORIZONTAL;
		panelBezeroa.add(helbideaLabelB, gbcBezeroa);

		JTextField helbideaB = new JTextField(10);
		gbcBezeroa.gridx = 1;
		gbcBezeroa.gridy = 3;
		gbcBezeroa.gridwidth = 1;
		panelBezeroa.add(helbideaB, gbcBezeroa);

		JButton gehituBezeroa = new JButton("Gehitu");
		gbcBezeroa.gridx = 0;
		gbcBezeroa.gridy = 4;
		gbcBezeroa.gridwidth = 2;
		panelBezeroa.add(gehituBezeroa, gbcBezeroa);

		// Add panels to cardPanel
		cardPanel.add(panelSaltzailea, "Saltzailea");
		cardPanel.add(panelBezeroa, "Bezeroa");

		// ComboBox action listener to switch panels
		comboBox.addActionListener(e -> {
			CardLayout cl = (CardLayout) (cardPanel.getLayout());
			cl.show(cardPanel, (String) comboBox.getSelectedItem());
		});

		// Set default panel
		comboBox.setSelectedItem("Saltzailea");

		// Menu item action to show main panel
		menuItem01.addActionListener(e -> {
			cardLayout.show(frame.getContentPane(), "MainPanel");
		});

		///// Erabiltzaileak ezabatzeko dialog-a eta botoiaren akzioa.
		JPanel panelErabiltzaileakEzabatu = new JPanel(new GridBagLayout());
		GridBagConstraints gbcEzabatu = new GridBagConstraints();
		gbcEzabatu.insets = new Insets(10, 10, 10, 10);

		JLabel labelComboBox = new JLabel("Aukeratu erabiltzailea:");
		gbcEzabatu.gridx = 0;
		gbcEzabatu.gridy = 0;
		gbcEzabatu.gridwidth = 1;
		gbcEzabatu.fill = GridBagConstraints.HORIZONTAL;
		panelErabiltzaileakEzabatu.add(labelComboBox, gbcEzabatu);

		JComboBox<String> comboBoxUsuarios = new JComboBox<>();
		gbcEzabatu.gridx = 1;
		gbcEzabatu.gridy = 0;
		gbcEzabatu.gridwidth = 1;
		panelErabiltzaileakEzabatu.add(comboBoxUsuarios, gbcEzabatu);

		JTextField datosUsuario = new JTextField(20);
		datosUsuario.setEditable(false);
		gbcEzabatu.gridx = 0;
		gbcEzabatu.gridy = 1;
		gbcEzabatu.gridwidth = 2;
		panelErabiltzaileakEzabatu.add(datosUsuario, gbcEzabatu);

		JButton ezabatu = new JButton("Ezabatu");
		gbcEzabatu.gridx = 0;
		gbcEzabatu.gridy = 2;
		gbcEzabatu.gridwidth = 2;
		panelErabiltzaileakEzabatu.add(ezabatu, gbcEzabatu);

		// Panel to center the panelErabiltzaileakEzabatu
		JPanel centerPanelEzabatu = new JPanel(new GridBagLayout());
		GridBagConstraints gbcCenterEzabatu = new GridBagConstraints();
		gbcCenterEzabatu.gridx = 0;
		gbcCenterEzabatu.gridy = 0;
		gbcCenterEzabatu.anchor = GridBagConstraints.CENTER;
		centerPanelEzabatu.add(panelErabiltzaileakEzabatu, gbcCenterEzabatu);

		frame.add(centerPanelEzabatu, "PanelErabiltzaileakEzabatu");

		// Cargar usuarios en el JComboBox
		List<String[]> usuarios = erabiltzaileakIrakurri("erabiltzaileak.txt");
		for (String[] usuario : usuarios) {
			comboBoxUsuarios.addItem(usuario[0]);
		}

		comboBoxUsuarios.addActionListener(e -> {
			String selectedUser = (String) comboBoxUsuarios.getSelectedItem();
			for (String[] usuario : usuarios) {
				if (usuario[0].equals(selectedUser)) {
					datosUsuario.setText("Izena: " + usuario[0] + ", Pasahitza: " + usuario[1]);
					break;
				}
			}
		});

		ezabatu.addActionListener(e -> {
			String erabiltzailea = (String) comboBoxUsuarios.getSelectedItem();
			if (erabiltzailea != null) {
				File inputFile = new File(Login.erabiltzaileakFitxategi);
				StringBuilder content = new StringBuilder();
				boolean aurkituta = false;

				try (BufferedReader reader = new BufferedReader(new FileReader(inputFile))) {
					String currentLine;
					while ((currentLine = reader.readLine()) != null) {
						String[] zatiak = currentLine.split(";");
						if (!zatiak[0].equals(erabiltzailea)) {
							content.append(currentLine).append(System.lineSeparator());
						} else {
							aurkituta = true;
						}
					}
				} catch (IOException ex) {
					JOptionPane.showMessageDialog(null, "ERROREA: Fitxategia ezin da irakurri.");
					return;
				}

				if (aurkituta) {
					try (BufferedWriter writer = new BufferedWriter(new FileWriter(inputFile))) {
						writer.write(content.toString());
					} catch (IOException ex) {
						JOptionPane.showMessageDialog(null, "ERROREA: Fitxategia ezin da idatzi.");
						return;
					}

					JOptionPane.showMessageDialog(null, "'" + erabiltzailea + "' erabiltzailea ezabatuta.");
					comboBoxUsuarios.removeItem(erabiltzailea);
					datosUsuario.setText("");
				} else {
					JOptionPane.showMessageDialog(null, "Errorea: erabiltzailea ez da aurkitu.");
				}
			}
		});

		menuItem02.addActionListener(e -> {
			cardLayout.show(frame.getContentPane(), "PanelErabiltzaileakEzabatu");
		});

		// Erabiltzaileak kontsultatzeko dialog-a eta botoiaren akzioa
		JPanel panelErabiltzaileak2 = new JPanel();
		panelErabiltzaileak2.setLayout(new BoxLayout(panelErabiltzaileak2, BoxLayout.Y_AXIS));

		JScrollPane scrollPane = new JScrollPane(panelErabiltzaileak2);

		menuItem03.addActionListener(e -> {
			panelErabiltzaileak2.removeAll();
			List<String[]> usuarios2 = erabiltzaileakIrakurri("erabiltzaileak.txt");
			for (String[] usuario : usuarios2) {
				panelErabiltzaileak2.add(erabiltzailePanelaSortu(usuario[0], usuario[1]));
			}
			panelErabiltzaileak2.revalidate();
			panelErabiltzaileak2.repaint();
			cardLayout.show(frame.getContentPane(), "PanelErabiltzaileakKontsultatu");
		});

		frame.add(scrollPane, "PanelErabiltzaileakKontsultatu");

		frame.setVisible(true);
	}

	private static List<String[]> erabiltzaileakIrakurri(String fitxategia) {
		List<String[]> usuarios = new ArrayList<>();
		try (BufferedReader br = new BufferedReader(new FileReader(fitxategia))) {
			String linea;
			br.readLine();
			while ((linea = br.readLine()) != null) {
				String[] datos = linea.split(";");
				if (datos.length == 3) {
					usuarios.add(datos);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return usuarios;
	}

	private static JPanel erabiltzailePanelaSortu(String erabiltzailea, String pasahitza) {
		JPanel panelUsuario = new JPanel();
		panelUsuario.setLayout(new FlowLayout());
		panelUsuario.setBorder(BorderFactory.createLineBorder(Color.BLACK));

		JLabel fotoLabel = new JLabel();
		fotoLabel.setIcon(new ImageIcon("../irudiak/user.png"));

		JLabel userLabel = new JLabel("Usuario: " + erabiltzailea);
		JLabel passLabel = new JLabel("Contraseña: " + pasahitza);

		panelUsuario.add(fotoLabel);
		panelUsuario.add(userLabel);
		panelUsuario.add(passLabel);

		return panelUsuario;
	}
}
