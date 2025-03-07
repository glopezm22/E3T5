package Aplikazioa;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Logina {

	public static void logina() {
		JPanel panel = new JPanel();
		
		JTextField erabiltzaileField = new JTextField(10);
		JPasswordField passField = new JPasswordField(10);
		
		panel.add(new JLabel("Sartu erabiltzailea:"));
		panel.add(erabiltzaileField);

		panel.add(new JLabel("Sartu pasahitza:"));
		panel.add(passField);
		
		JButton botoia = new JButton("Saioa hasi");
		panel.add(botoia);
		 
	    panel.setVisible(true);
	    
	    // Sortu JFrame bat eta gehitu panela
		   JFrame lehioa = new JFrame("Login");
	       lehioa.setSize(400, 300);
		   lehioa.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		   lehioa.getContentPane().add(panel);
		   lehioa.pack();
		   lehioa.setVisible(true);
	    
	    
        int[] saiakerak = {0};


        String fitxategia = "saioaHasi.txt";
	    
	    botoia.addActionListener (e2-> { 
	    	// int id = Integer.parseInt(idField.getText());
	    	 String erabiltzaile = erabiltzaileField.getText();
	    	 String pasahitza = new String(passField.getPassword());
	    	
	    	// Comprobar si las credenciales son correctas
	            if (comprobarUsuarioYContraseña(erabiltzaile, pasahitza, fitxategia)) {
	                JOptionPane.showMessageDialog(lehioa, "Erabiltzailea eta pasahitza zuzenak dira.");
	                // Si el login es correcto, cerramos la ventana de login
	                lehioa.dispose();
	            } else {
	            	saiakerak[0]++; 
	                if (saiakerak[0] < 3) {
	                    JOptionPane.showMessageDialog(lehioa, "Erabiltzailea edo pasahitza okerrak. Saiakerak: " + (3 - saiakerak[0]));
	                } else {
	                    JOptionPane.showMessageDialog(lehioa, "Saiakera gehiegi. Aplikazioa itxiko da.");
	                    lehioa.dispose(); // Cerramos la ventana de login
	                    System.exit(0); // Terminamos la ejecución de la aplicación
	                }
	            }
	        });
	    
	}
	
	
	// Método que comprueba si el usuario y la contraseña son correctos
    public static boolean comprobarUsuarioYContraseña(String erabiltzailea, String pasahitza, String fitxategia) {
        try (BufferedReader br = new BufferedReader(new FileReader(fitxategia))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                String[] posizioa = linea.split(",");
                if (posizioa.length == 2) {
                    String erabiltzaileaFitxategia = posizioa[0];
                    String pasahitzaFitzateagia = posizioa[1];
                    
                    // Comprobamos si coinciden el usuario y la contraseña
                    if (erabiltzailea.equals(erabiltzaileaFitxategia) && pasahitza.equals(pasahitzaFitzateagia)) {
                        return true; 
                    }
                    
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false; // No se encontró el usuario o la contraseña
    }
    
    public static void main(String[] args) {
    	logina();
    }
}
