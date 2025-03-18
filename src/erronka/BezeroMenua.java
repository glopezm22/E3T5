package erronka;

import java.awt.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.*;


public class BezeroMenua {

	public static void bezeroMenua(){
		//PANEL MENU 
		JPanel panelNagusia = new JPanel();
		JFrame lehioa = new JFrame("GameStop | Bezeroen menua");
	  
	    JMenuBar menuBar = new JMenuBar();
	    menuBar.setBackground(new Color(173, 216, 230));
	    menuBar.setPreferredSize(new Dimension(400, 40));
	    
	    
		JMenu nireKontuaMenu = new JMenu("Nire kontua");
		JMenu menua = new JMenu("Menua");
		menuBar.add(nireKontuaMenu);
		menuBar.add(menua);
		 
		JMenuItem item1 =  new JMenuItem ("Datu pertsonalak");
		JMenuItem item2 =  new JMenuItem ("Itxi saioa");
		nireKontuaMenu.add(item1);
		nireKontuaMenu.add(item2);
		
		JMenuItem item3 =  new JMenuItem ("Eskarien historiala");
		JMenuItem item4 =  new JMenuItem ("Produktuak");
		menua.add(item3);
		menua.add(item4);
		
		panelNagusia.add(menuBar);
		
		
		//SAIOA ITXI
		item2.addActionListener(e -> {
			int erantzuna= JOptionPane.showConfirmDialog(null, "Saioa itxi nahi duzu?","Saioa itxi",JOptionPane.YES_NO_OPTION); 
			if(erantzuna == JOptionPane.YES_OPTION) {
			System.exit(0);}
		});
		
		//DATU PERSONALAK
		item1.addActionListener(e -> {
		    JPanel panelDatuPertsonalak = new JPanel();
		    JLabel datuakLabel = new JLabel("Datu pertsonalak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
		    
		    JTextArea testua = new JTextArea(10,30);
		    testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
		    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
		    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu

		    // Testu-eremua desplazatzeko ScrollPane batean jarri
		    JScrollPane scroll = new JScrollPane(testua);
		    scroll.setPreferredSize(new Dimension(400, 200)); // Testu-eremuaren tamaina ezarri

		    // Panelera gehitu
		    panelNagusia.add(scroll);
		    panelDatuPertsonalak.add(datuakLabel);
		    panelDatuPertsonalak.add(testua);

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelDatuPertsonalak, BorderLayout.CENTER);
		    
		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();
		
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    panelDatuPertsonalak.add(atzeraBotoia ,BorderLayout.SOUTH);
		    atzeraBotoia.addActionListener(e2 -> {
		        	//VOLVER ALMENU PRINCIPAL
	        });
		});
		
		
		//ESKARIEN HISTORIALA
			item3.addActionListener(e -> {
				JPanel panelEskarienHistoriala= new JPanel();
				JLabel datuakLabel = new JLabel("Eskarien historiala", SwingConstants.CENTER);
				datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
					    
				JTextArea testua = new JTextArea(10,30);
				testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
				testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
				testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu
	
			// Testu-eremua desplazatzeko ScrollPane batean jarri
				JScrollPane scroll = new JScrollPane(testua);
				scroll.setPreferredSize(new Dimension(400, 200)); // Testu-eremuaren tamaina ezarri
	
		   // Panelera gehitu
				panelNagusia.add(scroll);
			    panelEskarienHistoriala.add(datuakLabel);
			    panelEskarienHistoriala.add(testua);
	
			// Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelEskarienHistoriala, BorderLayout.CENTER);
					    
			// Refrescar la interfaz
				lehioa.revalidate();
			    lehioa.repaint();
			    
	
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    panelEskarienHistoriala.add(atzeraBotoia ,BorderLayout.SOUTH);
			    atzeraBotoia.addActionListener(e2 -> {
			        	//VOLVER ALMENU PRINCIPAL
		        });
		});
			
			
			//PRODUKTUAK
			item4.addActionListener(e -> {
				JPanel panelProduktuak = new JPanel();
				JLabel datuakLabel = new JLabel("Produktuak", SwingConstants.CENTER);
				datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
					    
				JTextArea testua = new JTextArea(10,30);
				testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
				testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
				testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu
	
			// Testu-eremua desplazatzeko ScrollPane batean jarri
				JScrollPane scroll = new JScrollPane(testua);
				scroll.setPreferredSize(new Dimension(400, 200)); // Testu-eremuaren tamaina ezarri
	
		   // Panelera gehitu
				panelNagusia.add(scroll);
			    panelProduktuak.add(datuakLabel);
			    panelProduktuak.add(testua);
	
			// Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelProduktuak, BorderLayout.CENTER);
					    
			// Refrescar la interfaz
				lehioa.revalidate();
			    lehioa.repaint();
			    
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    panelProduktuak.add(atzeraBotoia ,BorderLayout.SOUTH);
			    atzeraBotoia.addActionListener(e2 -> {
			        	//VOLVER AL MENU PRINCIPAL
			    	
		        });
		});
		
		// PANEL LOGO
        JPanel logoPanel = new JPanel();
        JLabel logoLabel = new JLabel(new ImageIcon("logo.png"));
        logoPanel.add(logoLabel);
        
        // PANEL TITULO
        JPanel PanelTituloa = new JPanel(new BorderLayout());
        JLabel tituloaLabel = new JLabel("Ongi etorri GameStop Aplikaziora!", SwingConstants.CENTER);
        tituloaLabel.setFont(new Font("Arial", Font.BOLD, 16));
        PanelTituloa.add(tituloaLabel, BorderLayout.CENTER);
        
        
        //PANEL SUBTITULO
        JPanel panelSubtituloa = new JPanel();
        JLabel produktuakLabel = new JLabel("Produktu Motak:", SwingConstants.CENTER);
	    produktuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
	    panelSubtituloa.add(produktuakLabel);
		
		//PANEL BOTONES
		
	    JPanel panelBotoiak = new JPanel(new GridLayout(2, 3, 10, 10));
	    panelBotoiak.setPreferredSize(new Dimension(200, 150));
		JButton botoiaCPU = new JButton("CPU");
		JButton botoiaRAM = new JButton("RAM");
		JButton botoiaMotherboard = new JButton("Mother Board");
		JButton botoiaStorage = new JButton("Storage");
		JButton botoiaVideoCard = new JButton("Video Card");
		JButton botoiaProduktuak = new JButton("Produktu guztiak");
		
		botoiaCPU.setFont(new Font("Arial", Font.BOLD,15));
		botoiaCPU.setBackground(new Color(144, 238, 144));
		botoiaCPU.setPreferredSize(new Dimension(30, 15));
		
		botoiaRAM.setFont(new Font("Arial", Font.BOLD,15));
		botoiaRAM.setBackground(new Color(144, 238, 144));
		botoiaRAM.setPreferredSize(new Dimension(80, 30));
		
		botoiaMotherboard.setFont(new Font("Arial", Font.BOLD,15));
		botoiaMotherboard.setBackground(new Color(144, 238, 144));
		botoiaMotherboard.setPreferredSize(new Dimension(80, 30));
		
		botoiaStorage.setFont(new Font("Arial", Font.BOLD,15));
		botoiaStorage.setBackground(new Color(144, 238, 144));
		botoiaStorage.setPreferredSize(new Dimension(80, 30));
		
		botoiaVideoCard.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaVideoCard.setBackground(new Color(144, 238, 144));
		botoiaVideoCard.setPreferredSize(new Dimension(80, 30));
		
		botoiaProduktuak.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaProduktuak.setBackground(new Color(144, 238, 144));
		botoiaProduktuak.setPreferredSize(new Dimension(80, 30));
		
		panelBotoiak.add(botoiaCPU);
		panelBotoiak.add(botoiaRAM);
		panelBotoiak.add(botoiaVideoCard);
		
		panelBotoiak.add(botoiaMotherboard);
		panelBotoiak.add(botoiaStorage);
		panelBotoiak.add(botoiaProduktuak);
		
		
		//BOTOIEN FUNTZIONALITATEAK
		botoiaCPU.addActionListener(e -> {
		    JPanel panelCPU = new JPanel();
		    JLabel datuakLabel = new JLabel("CPU Produktuak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
		    
		    JTextArea testua = new JTextArea(50, 100);
		    testua.setFont(new Font("Arial", Font.PLAIN, 14)); // Letra-tamaina handitu
		    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
		    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu
		    testua.setEditable(false);
		    
		    // Testu-eremua desplazatzeko ScrollPane batean jarri
		    JScrollPane scroll = new JScrollPane(testua);
		    scroll.setPreferredSize(new Dimension(800, 400)); // Testu-eremuaren tamaina ezarri
		    scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

		    // Panelera gehitu
		   // panelNagusia.add(scroll);
		    panelCPU.add(datuakLabel);
		    panelCPU.add(scroll);

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelCPU, BorderLayout.CENTER);
		    lehioa.add(panelCPU);
		    
		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();
		    
		    // Conexión a la base de datos
		    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
		    BDproduktu pDB = db.produktuakCPU();
		    String resultado = "";
		    
		    String atributoak = String.format("%-5s %-20s %-30s %-10s %-10s %-5s\n", 
                    "ID", "Izena", "Deskribapena", "Balioa", "Salneurria", "Kategoria");
		    		atributoak += "-------------------------------------------------------------------------------\n";

		    
		    for (Produktu produktua : pDB.getProduktuak()) {
		        resultado += produktua.toString() + "\n";
		       
		    }
		   

		    // Mostrar los resultados en el JTextArea
		    testua.setText(resultado);  // Mostrar los resultados en el JTextArea
		    testua.repaint();  
		    
		    // Botón de regresar
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    panelCPU.add(atzeraBotoia, BorderLayout.SOUTH);
		    
		    atzeraBotoia.addActionListener(e2 -> {
		        // VOLVER AL MENU PRINCIPAL
		        lehioa.setContentPane(panelNagusia);
		        lehioa.revalidate();
		        lehioa.repaint();
		    });
		});
        
		botoiaRAM.addActionListener(e -> {
			 JPanel panelRAM = new JPanel();
			    JLabel datuakLabel = new JLabel("RAM Produktuak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
			    
			    JTextArea testua = new JTextArea(50, 100);
			    testua.setFont(new Font("Arial", Font.PLAIN, 14)); // Letra-tamaina handitu
			    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
			    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu
			    testua.setEditable(false);
			    
			    // Testu-eremua desplazatzeko ScrollPane batean jarri
			    JScrollPane scroll = new JScrollPane(testua);
			    scroll.setPreferredSize(new Dimension(800, 400)); // Testu-eremuaren tamaina ezarri
			    scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

			    // Panelera gehitu
			   // panelNagusia.add(scroll);
			    panelRAM.add(datuakLabel);
			    panelRAM.add(scroll);

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelRAM, BorderLayout.CENTER);
			    
			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();
			    
			    // Conexión a la base de datos
			    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
			    BDproduktu pDB = db.produktuakCPU();
			    String resultado = "";
			    
			    String atributoak = String.format("%-5s %-20s %-30s %-10s %-10s %-5s\n", 
	                    "ID", "Izena", "Deskribapena", "Balioa", "Salneurria", "Kategoria");
			    		atributoak += "-------------------------------------------------------------------------------\n";

			    
			    for (Produktu produktua : pDB.getProduktuak()) {
			        resultado += produktua.toString() + "\n";
			       
			    }
			   

			    // Mostrar los resultados en el JTextArea
			    testua.setText(resultado);  // Mostrar los resultados en el JTextArea
			    testua.repaint();  
			    
			    // Botón de regresar
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    panelRAM.add(atzeraBotoia, BorderLayout.SOUTH);
			    
			    atzeraBotoia.addActionListener(e2 -> {
			        // VOLVER AL MENU PRINCIPAL
			        lehioa.setContentPane(panelNagusia);
			        lehioa.revalidate();
			        lehioa.repaint();
		    });   
		});
		
		botoiaMotherboard.addActionListener(e -> {
			 JPanel panelMotherboard = new JPanel();
			    JLabel datuakLabel = new JLabel("Motherboard Produktuak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
			    
			    JTextArea testua = new JTextArea(10,30);
			    testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
			    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
			    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu

			    // Testu-eremua desplazatzeko ScrollPane batean jarri
			    JScrollPane scroll = new JScrollPane(testua);
			    scroll.setPreferredSize(new Dimension(400, 200)); // Testu-eremuaren tamaina ezarri

			    // Panelera gehitu
			    panelNagusia.add(scroll);
			    panelMotherboard.add(datuakLabel);
			    panelMotherboard.add(testua);

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelMotherboard, BorderLayout.CENTER);
			    
			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();
			
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    panelMotherboard.add(atzeraBotoia ,BorderLayout.SOUTH);
			    atzeraBotoia.addActionListener(e2 -> {
			        	//VOLVER ALMENU PRINCIPAL
			    	
			        lehioa.setVisible(true);
		    });
		});
		
		botoiaStorage.addActionListener(e -> {
		    JPanel panelStorage = new JPanel();
		    JLabel datuakLabel = new JLabel("Storage Produktuak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
		    
		    JTextArea testua = new JTextArea(10,30);
		    testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
		    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
		    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu

		    // Testu-eremua desplazatzeko ScrollPane batean jarri
		    JScrollPane scroll = new JScrollPane(testua);
		    scroll.setPreferredSize(new Dimension(400, 200)); // Testu-eremuaren tamaina ezarri

		    // Panelera gehitu
		    panelNagusia.add(scroll);
		    panelStorage.add(datuakLabel);
		    panelStorage.add(testua);

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelStorage, BorderLayout.CENTER);
		    
		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();
		
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    panelStorage.add(atzeraBotoia ,BorderLayout.SOUTH);
		    atzeraBotoia.addActionListener(e2 -> {
		        	//VOLVER AL MENU PRINCIPAL
		    	
	        });
		});
		
		botoiaVideoCard.addActionListener(e -> {
		    JPanel panelVideoCard = new JPanel();
		    JLabel datuakLabel = new JLabel("Video Card Produktuak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
		    
		    JTextArea testua = new JTextArea(60,150);
		    testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
		    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
		    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu

		    // Testu-eremua desplazatzeko ScrollPane batean jarri
		    JScrollPane scroll = new JScrollPane(testua);
		    scroll.setPreferredSize(new Dimension(1100, 400)); // Testu-eremuaren tamaina ezarri
		    scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

		    // Panelera gehitu
		    panelVideoCard.add(datuakLabel);
		    panelVideoCard.add(scroll);

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelVideoCard, BorderLayout.CENTER);
		    
		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();
		
		 // Conexión a la base de datos
		    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
		    BDproduktu pDB = db.produktuakVideoCard();
		    String resultado = "";
		    
		    String atributoak = String.format("%-5s %-20s %-30s %-10s %-10s %-5s\n", 
                    "ID", "Izena", "Deskribapena", "Balioa", "Salneurria", "Kategoria");
		    		atributoak += "-------------------------------------------------------------------------------\n";

		    
		    for (Produktu produktua : pDB.getProduktuak()) {
		        resultado += produktua.toString() + "\n";
		       
		    }
		   

		    // Mostrar los resultados en el JTextArea
		    testua.setText(resultado);  // Mostrar los resultados en el JTextArea
		    testua.repaint();  
		    
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    panelVideoCard.add(atzeraBotoia ,BorderLayout.SOUTH);
		    atzeraBotoia.addActionListener(e2 -> {
		        	//VOLVER AL MENU PRINCIPAL
		    	
	        });
		});
        
		botoiaProduktuak.addActionListener(e -> {
		    JPanel panelProduktuak = new JPanel();
		    JLabel datuakLabel = new JLabel("Produktuak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
		    
		    JTextArea testua = new JTextArea(10,30);
		    testua.setFont(new Font("Arial", Font.PLAIN, 16)); // Letra-tamaina handitu
		    testua.setLineWrap(true); // Testua automatikoki hurrengo lerroan jar dadin
		    testua.setWrapStyleWord(true); // Hitzak osorik mantendu, ez moztu

		    // Testu-eremua desplazatzeko ScrollPane batean jarri
		    JScrollPane scroll = new JScrollPane(testua);
		    scroll.setPreferredSize(new Dimension(400, 200)); // Testu-eremuaren tamaina ezarri

		    // Panelera gehitu
		    panelNagusia.add(scroll);
		    panelProduktuak.add(datuakLabel);
		    panelProduktuak.add(testua);

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelProduktuak, BorderLayout.CENTER);
		    
		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();
		
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    panelProduktuak.add(atzeraBotoia ,BorderLayout.SOUTH);
		    atzeraBotoia.addActionListener(e2 -> {
		    	
		    });
		        	//VOLVER AL MENU PRINCIPAL
		    	
	       
		});
        
        
        //FRAME
		lehioa.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		lehioa.setExtendedState(JFrame.MAXIMIZED_BOTH);
	    lehioa.getContentPane().add(panelBotoiak,BorderLayout.CENTER);
	    lehioa.getContentPane().add(logoPanel, BorderLayout.WEST);
	    lehioa.add(PanelTituloa, BorderLayout.NORTH);
	    lehioa.getContentPane().add(panelSubtituloa, BorderLayout.WEST);
	    lehioa.add(menuBar,BorderLayout.NORTH);
	    lehioa.pack();
	    lehioa.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    lehioa.setExtendedState(JFrame.MAXIMIZED_BOTH);
	    lehioa.setSize(1920, 1080);
	    lehioa.setVisible(true);
	    
	}
	
	

	public static void main(String[] args) {
		bezeroMenua();
	}
}
