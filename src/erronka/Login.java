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
                        JOptionPane.showMessageDialog(frame, "Saiakera kopurua gainditu duzu. Programa itxiko da.", "Errorea", JOptionPane.ERROR_MESSAGE);
                        System.exit(0);
                    } else {
                        mezua.setText("Errorea logeatzeko orduan. Saiakera " + saiakerak[0] + "/" + MAX_SAIAKERAK);
                    }
                }
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(frame, "Errorea gertatu da: " + ex.getMessage(), "Errorea", JOptionPane.ERROR_MESSAGE);
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
			String kontsultaLogin = "SELECT * FROM ERABILTZAILEAK WHERE ERABILTZAILEA = '" + erabiltzailea + "' AND PASAHITZA = '" + pasahitza + "'";
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
    
    public static void logeatutakoProfila(int id) {
    	try {
    		// Konexioa ezartzen da.
            Connection con = DBmain.konexioa();
            Statement statement = con.createStatement();

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
                
                String kontsultaErabiltzailea = "SELECT * FROM ERABILTZAILEAK WHERE ID = " + id + " AND MOTA = 'S'";
                ResultSet resultSetErabiltzailea = statement.executeQuery(kontsultaErabiltzailea);
                
                if (resultSetErabiltzailea.next()) {
    				erabiltzailea = resultSetErabiltzailea.getString("ERABILTZAILEA");
    				pasahitza = resultSetErabiltzailea.getString("PASAHITZA");
    				mota = resultSetErabiltzailea.getString("MOTA");
    				
				}
				resultSetErabiltzailea.close();
                
            } else {
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
                    
                    String kontsultaErabiltzailea = "SELECT * FROM ERABILTZAILEAK WHERE ID = " + id + " AND MOTA = 'B'";
                    ResultSet resultSetErabiltzailea = statement.executeQuery(kontsultaErabiltzailea);
                    
                    if (resultSetErabiltzailea.next()) {
        				erabiltzailea = resultSetErabiltzailea.getString("ERABILTZAILEA");
        				pasahitza = resultSetErabiltzailea.getString("PASAHITZA");
        				mota = resultSetErabiltzailea.getString("MOTA");
        				
    				}
    				resultSetErabiltzailea.close();
                }
                resultSetBezero.close();
            }

			resultSetLangile.close();
            statement.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}