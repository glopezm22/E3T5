package erronka;

import java.io.*;
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
        try (BufferedReader br = new BufferedReader(new FileReader(erabiltzaileakFitxategi))) {
            String lerroa;
            br.readLine(); // Goiburua ezabatzen du
            while ((lerroa = br.readLine()) != null) {
                String[] fitxategi = lerroa.split(";"); // Separadorea ezartzen du
                if (fitxategi.length == 3 && erabiltzailea.equals(fitxategi[0]) && pasahitza.equals(fitxategi[1])) {
                    return fitxategi[2]; // Erabiltzailea 0 posizioan, pasahitza 1 posizioan eta mota 2 posizioan. Mota itzultzen du.
                }
            }
        } catch (IOException e) {
            System.out.println("ERROREA: Fitxategia ezin da irakurri.");
        }
        return null;
    }
}