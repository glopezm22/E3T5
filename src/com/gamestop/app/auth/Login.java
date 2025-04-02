package com.gamestop.app.auth;

import com.gamestop.db.DatabaseManager;
import com.gamestop.app.main.MenuBezero;
import com.gamestop.app.main.MenuSaltzaile;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.*;
import java.time.LocalDate;
import javax.imageio.ImageIO;
import java.io.IOException;
import java.io.InputStream;

/**
 * Saioa hasteko eta erabiltzailea autentifikatzeko klasea.
 * Erabiltzailearen datuak egiaztatzen ditu datu-basearekin eta sesioa hasten du.
 */
@SuppressWarnings("unused")
public class Login {

    /** Saioa hasteko gehienezko saiakerak */
    public static final int MAX_SAIAKERAK = 3;

    // Erabiltzailearen datuak gordetzeko aldagaiak
    public static int id = 0;
    public static String izena = null;
    public static String abizena = null;
    public static String helbidea = null;
    public static String emaila = null;
    public static String telefonoa = null;
    public static LocalDate kontratazioData = null;
    public static int idnagusi = 0;
    public static String erabiltzailea = null;
    public static String pasahitza = null;
    public static String mota = null;

    /**
     * Aplikazioa abiarazten duen metodoa. Login interfazea bistaratzen du.
     * @param args Komando-lerroko argumentuak (ez dira erabiltzen)
     */
    public static void main(String[] args) {
        JFrame frame = sortuFrameNagusia();
        JPanel panel = sortuLoginPanela(frame);
        frame.setVisible(true);
    }

    /**
     * Frame nagusia konfiguratzen du: tamaina, titulua eta leihoaren portaera.
     * @return Konfiguratutako JFrame objektua
     */
    private static JFrame sortuFrameNagusia() {
        JFrame frame = new JFrame("GameStop | Saioa hasi");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        frame.setResizable(false);
        frame.setSize(450, 400);
        frame.setLocationRelativeTo(null);
        frame.setLayout(new GridBagLayout());
        kargatuIkonoa(frame);
        kargatuAtzekoIrudia(frame);
        return frame;
    }

    /**
     * Login panela osatzen du, erabiltzailearen datuak jasotzeko.
     * @param frame Leiho nagusia, non panela gehitu behar den
     * @return Osatutako JPanel objektua
     */
    private static JPanel sortuLoginPanela(JFrame frame) {
        // Crear panel principal transparente
        JPanel panel = new JPanel(new GridLayout(6, 1, 5, 5));
        panel.setOpaque(false); // Hacer el panel transparente
        
        // Configurar componentes
        JLabel erabiltzaileLabel = new JLabel("Erabiltzailea:", SwingConstants.CENTER);
        erabiltzaileLabel.setForeground(Color.WHITE);
        erabiltzaileLabel.setFont(new Font("Arial", Font.BOLD, 14));
        
        JTextField erabiltzaileEremua = new JTextField(10);
        estilizarTextField(erabiltzaileEremua);
        
        JLabel pasahitzaLabel = new JLabel("Pasahitza:", SwingConstants.CENTER);
        pasahitzaLabel.setForeground(Color.WHITE);
        pasahitzaLabel.setFont(new Font("Arial", Font.BOLD, 14));
        
        JPasswordField pasahitzaEremua = new JPasswordField(10);
        estilizarTextField(pasahitzaEremua);
        
        JButton saioaHasiBotoia = new JButton("Saioa hasi");
        estilizarBotoia(saioaHasiBotoia);
        
        JLabel mezua = new JLabel("", SwingConstants.CENTER);
        mezua.setForeground(Color.WHITE);
        
        // Añadir componentes al panel
        panel.add(erabiltzaileLabel);
        panel.add(erabiltzaileEremua);
        panel.add(pasahitzaLabel);
        panel.add(pasahitzaEremua);
        panel.add(saioaHasiBotoia);
        panel.add(mezua);

        int[] saiakerak = {0}; // Saiakera kopurua gordetzeko

        saioaHasiBotoia.addActionListener(e -> {
            String erabiltzailea = erabiltzaileEremua.getText().trim();
            String pasahitza = new String(pasahitzaEremua.getPassword()).trim();

            if (autentifikatuErabiltzailea(frame, erabiltzailea, pasahitza, mezua, saiakerak)) {
                kudeatuSesioa(frame);
            }
            erabiltzaileEremua.setText("");
            pasahitzaEremua.setText("");
        });
        
        // Añadir panel al frame con GridBagConstraints para centrarlo
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.CENTER;
        frame.getContentPane().add(panel, gbc);
        
        return panel;
    }

    /**
     * Erabiltzailea autentifikatzen du datu-basearekin.
     * @return true saioa ondo hasi bada, false bestela
     */
    private static boolean autentifikatuErabiltzailea(JFrame frame, String erabiltzailea, String pasahitza, JLabel mezua, int[] saiakerak) {
        try {
            mota = loginSistema(erabiltzailea, pasahitza);
            if (mota != null) {
                logeatutakoProfila(id);
                mezua.setText("Ongi etorri, " + izena + "!");
                return true;
            } else {
                saiakerak[0]++;
                if (saiakerak[0] >= MAX_SAIAKERAK) {
                    JOptionPane.showMessageDialog(frame, "Saiakera kopurua gainditu duzu.", "Errorea", JOptionPane.ERROR_MESSAGE);
                    System.exit(0);
                }
                mezua.setText("Saioa huts eginda. Saiakera " + saiakerak[0] + "/" + MAX_SAIAKERAK);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(frame, "Errorea: " + ex.getMessage(), "Errorea", JOptionPane.ERROR_MESSAGE);
        }
        return false;
    }

    /**
     * Erabiltzailearen motaren arabera menua kargatzen du.
     */
    private static void kudeatuSesioa(JFrame frame) {
        if ("S".equals(mota)) {
            MenuSaltzaile.main(null);
        } else if ("B".equals(mota)) {
            MenuBezero.main(null);
        }
        frame.dispose();
    }

	// Erabiltzailea eta pasahitza egiaztatzeko metodoa.
	public static String loginSistema(String erabiltzailea, String pasahitza) {

		try {
			// Konexioa ezartzen da.
			Connection con = DatabaseManager.konexioa();
			Statement statement = con.createStatement();

			// Kontsulta ezartzen da, non erabiltzaileak bilatuko diren.
			String kontsultaLogin = "SELECT * FROM ERABILTZAILEAK WHERE ERABILTZAILEA = '" + erabiltzailea
					+ "' AND PASAHITZA = '" + pasahitza + "'";
			ResultSet resultSet = statement.executeQuery(kontsultaLogin);

			while (resultSet.next()) {
				id = resultSet.getInt("ID");
				String erabiltzaileadb = resultSet.getString("ERABILTZAILEA");
				String pasahitzadb = resultSet.getString("PASAHITZA");
				String motadb = resultSet.getString("MOTA");
				if (erabiltzailea.equals(erabiltzaileadb) && pasahitza.equals(pasahitzadb)) {
					return motadb;
				}
			}
			resultSet.close();
			statement.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Sesioan logeatutako erabiltzailearen datuak gordetzeko metodoa.
	public static void logeatutakoProfila(int id) {
		try {
			// Konexioa ezartzen da.
			Connection con = DatabaseManager.konexioa();
			Statement statement = con.createStatement();

			if (mota.equals("S")) {
				// LANGILE taulan kontsula egitea lehenik eta behin.
				String kontsultaLangile = "SELECT * FROM LANGILE WHERE ID = " + id;
				ResultSet resultSetLangile = statement.executeQuery(kontsultaLangile);

				if (resultSetLangile.next()) {
					// Datuak esleitzen dira.
					id = resultSetLangile.getInt("ID");
					izena = resultSetLangile.getString("IZENA");
					abizena = resultSetLangile.getString("ABIZENA");
					emaila = resultSetLangile.getString("EMAILA");
					telefonoa = resultSetLangile.getString("TELEFONOA");
					kontratazioData = resultSetLangile.getDate("KONTRATAZIO_DATA").toLocalDate();
					idnagusi = resultSetLangile.getInt("ID_NAGUSI");

				}
				resultSetLangile.close();

			} else if (mota.equals("B")) {
				// LANGILE taulan ez bada aurkitzen, BEZERO taulan kontsulta egingo da.
				String kontsultaBezero = "SELECT * FROM BEZERO WHERE ID = " + id;
				ResultSet resultSetBezero = statement.executeQuery(kontsultaBezero);

				if (resultSetBezero.next()) {
					// Datuak esleitzen dira.
					id = resultSetBezero.getInt("ID");
					izena = resultSetBezero.getString("IZENA");
					abizena = resultSetBezero.getString("ABIZENA");
					helbidea = resultSetBezero.getString("HELBIDEA");
					emaila = resultSetBezero.getString("EMAILA");

				}
				resultSetBezero.close();
			}
			
			String kontsultaErabiltzaile = "SELECT * FROM ERABILTZAILEAK WHERE ID = " + id + " AND MOTA = '" + mota + "'";
			ResultSet resultSetErabiltzaile = statement.executeQuery(kontsultaErabiltzaile);
			if (resultSetErabiltzaile.next()) {
				erabiltzailea = resultSetErabiltzaile.getString("ERABILTZAILEA");
				pasahitza = resultSetErabiltzaile.getString("PASAHITZA");
			}
			resultSetErabiltzaile.close();

			statement.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// Saioa ixteko metodoa. Dialog bat bistaratzen du non atzera emateko aukera emango duen.
	public static JDialog saioaItxi(JFrame frame) {
		JDialog dialog = new JDialog();
		dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		dialog.setSize(400, 200);
		dialog.setLayout(new GridBagLayout());
		dialog.setTitle("Saioa itxi");
		dialog.setLocationRelativeTo(frame);
		JLabel label = new JLabel("Saioa itxi nahi duzu?");
		JButton baiButton = new JButton("Bai");
		JButton ezButton = new JButton("Ez");
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.gridx = 0;
		gbc.gridy = 0;
		dialog.add(label, gbc);
		gbc.gridx = 0;
		gbc.gridy = 1;
		dialog.add(baiButton, gbc);
		gbc.gridx = 1;
		dialog.add(ezButton, gbc);
		baiButton.addActionListener(e2 -> {
			loginDatuakGarbitu();
			frame.dispose();
			dialog.dispose();
			Login.main(null);
		});
		ezButton.addActionListener(e2 -> dialog.dispose());
		dialog.setVisible(true);
		return dialog;
	}
	
	// Sesioko datuak garbitzeko metodoa.
	private static void loginDatuakGarbitu() {
        Login.id = 0;
        Login.izena = null;
        Login.abizena = null;
        Login.helbidea = null;
        Login.emaila = null;
        Login.telefonoa = null;
        Login.kontratazioData = null;
        Login.idnagusi = 0;
        Login.erabiltzailea = null;
        Login.pasahitza = null;
        Login.mota = null;
    }
	
	/**
	 * Aplikazioaren ikonoa kargatzen du leiho nagusirako.
	 * @param frame Ikonoa gehitzeko JFrame objektua
	 */
	public static void kargatuIkonoa(JFrame frame) {
	    try {
	        // Ikonoa kargatu resources/images karpetatik
	        Image ikonoa = ImageIO.read(
	            Login.class.getClassLoader().getResourceAsStream("images/GameStopIcon.png")
	        );
	        frame.setIconImage(ikonoa);
	    } catch (IOException e) {
	        // Errorea gertatuz gero, mezu bat erakutsiko da
	        JOptionPane.showMessageDialog(
	            frame,
	            "Ezin izan da aplikazioaren ikonoa kargatu: " + e.getMessage(),
	            "Errorea",
	            JOptionPane.ERROR_MESSAGE
	        );
	        System.err.println("[ERROR] Ikonoa ezin kargatu: " + e.getMessage());
	    } catch (IllegalArgumentException e) {
	        // Baliabidea ez bada aurkitzen
	        System.err.println("[ERROR] Ikonoaren fitxategia ez da aurkitu: images/GameStopIcon.png");
	    }
	}
	
	private static void kargatuAtzekoIrudia(JFrame frame) {
	    try (InputStream imgStream = Login.class.getResourceAsStream("/images/LoginBackground.jpg")) {
	        if (imgStream != null) {
	            Image originalImage = ImageIO.read(imgStream);
	            
	            @SuppressWarnings("serial")
				JPanel backgroundPanel = new JPanel() {
	                @Override
	                protected void paintComponent(Graphics g) {
	                    super.paintComponent(g);
	                    Graphics2D g2d = (Graphics2D) g.create();
	                    
	                    // 1. Dibujar la imagen original
	                    g2d.drawImage(originalImage, 0, 0, getWidth(), getHeight(), this);
	                    
	                    g2d.setColor(new Color(0, 0, 0, 165)); // Azkena opazitatea. 255 * nahi dugun portzentaia (0.65 = 65%)
	                    g2d.fillRect(0, 0, getWidth(), getHeight());
	                    
	                    g2d.dispose();
	                }
	            };
	            backgroundPanel.setLayout(new GridBagLayout());
	            frame.setContentPane(backgroundPanel);
	            
	        } else {
	            System.err.println("Errorea: Ez da irudia aurkitu /images/LoginBackground.jpg bidean");
	        }
	    } catch (IOException e) {
	        System.err.println("Errorea irudia kargatzerakoan:");
	        e.printStackTrace();
	    }
	}
	
	// Textfield-ak sortzeko metodoa.
	public static JTextField sortuTextFieldEditatugabea(int columns) {
	    JTextField eremua = new JTextField(columns);
	    eremua.setEditable(false);
	    return eremua;
	}

	// Konponenteak sortzeko metodoa, etiketarekin
	public static void sortuKonponenteaEtiketarekin(JPanel panel, GridBagConstraints gbc, 
	    String etiketa, JComponent konponentea, int x, int y) {
	    gbc.gridx = 0;
	    gbc.gridy = y;
	    panel.add(new JLabel(etiketa), gbc);
	    gbc.gridx = 1;
	    panel.add(konponentea, gbc);
	}
	
	private static void estilizarTextField(JTextField textField) {
	    textField.setOpaque(true);
	    textField.setBackground(new Color(255, 255, 255, 255));
	    textField.setBorder(BorderFactory.createCompoundBorder(
	        BorderFactory.createLineBorder(Color.BLACK, 1),
	        BorderFactory.createEmptyBorder(5, 5, 5, 5)
	    ));
	    textField.setFont(new Font("Arial", Font.PLAIN, 14));
	}

	private static void estilizarBotoia(JButton button) {
	    button.setOpaque(false);
	    button.setContentAreaFilled(false);
	    button.setBorderPainted(true);
	    button.setBorder(BorderFactory.createLineBorder(Color.WHITE, 1));
	    button.setForeground(Color.WHITE);
	    button.setFont(new Font("Arial", Font.BOLD, 14));
	    button.setBackground(new Color(255, 255, 255, 128)); // 50% opazitatea
	    
	    // Efecto hover
	    button.addMouseListener(new MouseAdapter() {
	        @Override
	        public void mouseEntered(MouseEvent e) {
	            button.setBackground(new Color(255, 255, 255, 255));
	        }
	        
	        @Override
	        public void mouseExited(MouseEvent e) {
	            button.setBackground(new Color(255, 255, 255, 128));
	        }
	    });
	}

}