package erronka;

import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JSeparator;
import javax.swing.JTextField;

import erronka.DB.DBErabiltzaileak;
import erronka.DB.Erabiltzaileak;

public class ErabiltzaileakMenu {

	// Saltzaileak sortzeko panel-a sortzeko metodoa.
	public static JPanel saltzaileaGehitu() {
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
	public static JPanel bezeroaGehitu() {
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
	public static JPanel erabiltzaileaEzabatu() {
		JPanel panel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);

		JLabel labelComboBox = new JLabel("Aukeratu erabiltzailea:");
		gbc.gridx = 0;
		gbc.gridy = 0;
		panel.add(labelComboBox, gbc);

		JComboBox<String> comboBoxErabiltzaileak = new JComboBox<>();
		gbc.gridx = 1;
		panel.add(comboBoxErabiltzaileak, gbc);

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
		
		DBErabiltzaileak.kargatuErabiltzaileak(comboBoxErabiltzaileak, izenaField, abizenaField, motaField);

		ezabatu.addActionListener(e -> {
			Erabiltzaileak erabiltzailea = (Erabiltzaileak) comboBoxErabiltzaileak.getSelectedItem();
			if (erabiltzailea != null) {
				try {
					Connection conn = DBmain.konexioa();
					Statement stmt = conn.createStatement();
					String sql = "DELETE FROM ERABILTZAILEAK WHERE ID = " + erabiltzailea.getId();
					int rowsAffected = stmt.executeUpdate(sql);
					if (rowsAffected > 0) {
						JOptionPane.showMessageDialog(null,
								"'" + erabiltzailea.getErabiltzailea() + "' erabiltzailea ezabatuta.");
						comboBoxErabiltzaileak.removeItem(erabiltzailea);
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

	// Erabiltzaileak kontsultatzeko panel-a sortzeko metodoa.
	public static JPanel erabiltzaileakKontsultatu() {
		JPanel panel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);

		JLabel labelComboBox = new JLabel("Aukeratu erabiltzailea:");
		gbc.gridx = 0;
		gbc.gridy = 0;
		panel.add(labelComboBox, gbc);

		JComboBox<String> comboBoxErabiltzaileak = new JComboBox<>();
		gbc.gridx = 1;
		panel.add(comboBoxErabiltzaileak, gbc);

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

		DBErabiltzaileak.kargatuErabiltzaileak(comboBoxErabiltzaileak, izenaField, abizenaField, motaField);

		panel.add(panel, BorderLayout.CENTER);
		return panel;
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
