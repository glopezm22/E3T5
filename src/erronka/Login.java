package erronka;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.*;
import java.awt.*;
import java.time.LocalDate;

/**
 * Login pantaila bistaratu eta erabiltzailea autentifikatzeko metodoa.
 *
 * @return Saiakera kopurua, 0 baldin eta autentifikazioa huts egiten badu.
 */
public class Login {

	public static final int MAX_SAIAKERAK = 3;
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

	// @SuppressWarnings("unused")
	public static void main(String[] args) {

		// Frame-a sortu eta parametroak ezarri.
		JFrame frame = new JFrame("GameStop | Saioa hasi");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		frame.setSize(1920, 1080);
		frame.setLayout(new GridBagLayout());

		// Login panela sortu eta elementuak gehitu
		JPanel panel = new JPanel(new GridLayout(6, 1, 5, 5));

		JLabel erabiltzaileaLabel = new JLabel("Erabiltzailea:", SwingConstants.CENTER);
		JTextField erabiltzailea = new JTextField(10);

		JLabel pasahitzaLabel = new JLabel("Pasahitza:", SwingConstants.CENTER);
		JPasswordField pasahitza = new JPasswordField(10);

		JButton botoia = new JButton("Saioa hasi");
		JLabel mezua = new JLabel("", SwingConstants.CENTER);

		panel.add(erabiltzaileaLabel);
		panel.add(erabiltzailea);
		panel.add(pasahitzaLabel);
		panel.add(pasahitza);
		panel.add(botoia);
		panel.add(mezua);

		// Saiakera kopurua kontrolatzeko array-a
		int[] saiakerak = new int[1];

		// Logeatzearen botoiaren akzioa
		botoia.addActionListener(e -> {
			try {
				String erabiltzaileaText = erabiltzailea.getText().trim().toLowerCase();
				String pasahitzaText = new String(pasahitza.getPassword()).trim();

				String mota = loginSistema(erabiltzaileaText, pasahitzaText);
				Login.mota = mota;
				if (mota != null) {
					mezua.setText("Sarbidea daukazu. Mota: " + mota);
					logeatutakoProfila(id);
					if (mota.equals("S")) {
						MenuSaltzaile.main(null);
						frame.dispose();
					} else if (mota.equals("B")) {
						MenuBezero.main(null);
						frame.dispose();
					}
				} else {
					saiakerak[0]++;
					if (saiakerak[0] >= MAX_SAIAKERAK) {
						JOptionPane.showMessageDialog(frame, "Saiakera kopurua gainditu duzu. Programa itxiko da.",
								"Errorea", JOptionPane.ERROR_MESSAGE);
						System.exit(0);
					} else {
						mezua.setText("Errorea logeatzeko orduan. Saiakera " + saiakerak[0] + "/" + MAX_SAIAKERAK);
					}
				}
			} catch (Exception ex) {
				JOptionPane.showMessageDialog(frame, "Errorea gertatu da: " + ex.getMessage(), "Errorea",
						JOptionPane.ERROR_MESSAGE);
				ex.printStackTrace();
			}
		});

		GridBagConstraints gbc = new GridBagConstraints();
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.CENTER;
		frame.add(panel, gbc);

		frame.setVisible(true);
	}

	// Erabiltzailea eta pasahitza egiaztatzeko metodoa.
	public static String loginSistema(String erabiltzailea, String pasahitza) {

		try {
			// Konexioa ezartzen da.
			Connection con = DBmain.konexioa();
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
			Connection con = DBmain.konexioa();
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

}