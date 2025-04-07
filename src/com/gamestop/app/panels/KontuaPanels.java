package com.gamestop.app.panels;

import com.gamestop.app.auth.Login;
import com.gamestop.db.DatabaseManager;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class KontuaPanels {

	// Saltzaileen datu pertsonalak bistaratzeko panel-a sortzeko metodoa.
	public static JPanel saltzaileenDatuPertsonalak() {
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
				Connection conn = DatabaseManager.konexioa();
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
	
	// Bezeroen datu pertsonalak bistaratzeko panel-a sortzeko metodoa.
	public static JPanel bezeroenDatuPertsonalak() {
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
				Connection conn = DatabaseManager.konexioa();
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
                Connection conn = DatabaseManager.konexioa();
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
}
