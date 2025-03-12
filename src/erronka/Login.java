package erronka;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.*;
import java.awt.*;

/**
 * Login pantaila bistaratu eta erabiltzailea autentifikatzeko metodoa.
 *
 * @return Saiakera kopurua, 0 baldin eta autentifikazioa huts egiten badu.
 */
public class Login {

    public static final String erabiltzaileakFitxategi = "erabiltzaileak.txt";
    public static final int MAX_SAIAKERAK = 3; // Saiakera maximoa ezartzen da

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
            String erabiltzaileaText = erabiltzailea.getText().trim().toLowerCase(); // Erabiltzailearen espazioak ezabatu eta letra txikitan jarri
            String pasahitzaText = new String(pasahitza.getPassword()).trim(); // Pasahitzaren espazioak ezabatu

            String mota = loginSistema(erabiltzaileaText, pasahitzaText); // Metodora deitzen du, honek erabiltzaile mota bueltatzen du
            if (mota != null) {
                mezua.setText("Sarbidea daukazu. Mota: " + mota);
                if (mota.equals("Saltzailea")) {
                    MenuSaltzaile.main(null); // Saltzailearen menua irekitzen du
                    frame.dispose();
                } else if (mota.equals("Bezeroa")) {
                    MenuBezero.main(null); // Bezeroaren menua irekitzen du
                }
            } else {
                saiakerak[0]++;
                if (saiakerak[0] >= MAX_SAIAKERAK) {
                    JOptionPane.showMessageDialog(frame, "Saiakera kopurua gainditu duzu. Programa itxiko da.", "Errorea", JOptionPane.ERROR_MESSAGE);
                    System.exit(0); // Saiakera kopurua gainditzen denean programa ixten da.
                } else {
                    mezua.setText("Errorea logeatzeko orduan. Saiakera " + saiakerak[0] + "/" + MAX_SAIAKERAK);
                }
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
			Connection con = DriverManager.getConnection(DB.url, DB.erabiltzailea, DB.pasahitza);
			Statement statement = con.createStatement();
			String kontsultaLogin = "SELECT * FROM ERABILTZAILEAK";
			ResultSet resultSet = statement.executeQuery(kontsultaLogin);

			while (resultSet.next()) {
			    int id = resultSet.getInt("ID");
			    String erabiltzaileadb = resultSet.getString("ERABILTZAILEA");
                String pasahitzadb = resultSet.getString("PASAHITZA");
                boolean motadb = resultSet.getBoolean("MOTA");
				if (erabiltzailea.equals(erabiltzaileadb) && pasahitza.equals(pasahitzadb)) {
					
				}
			}
			    // Eta konexioak itxi
			    resultSet.close();
			    statement.close();
			    con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
        return null;
    }
}