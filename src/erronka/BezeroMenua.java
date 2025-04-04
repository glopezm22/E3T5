package Aplikazioa;

import java.awt.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

import Ariketak.BD;
import Ariketak.Produktua;
import Ariketak.Produktuak;


public class BezeroMenua {

	public static void bezeroMenua(){
		//PANEL MENU 
		JPanel panelNagusia = new JPanel();
		
		JFrame lehioa = new JFrame("GameStop | Bezeroen menua");
		lehioa.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        lehioa.setExtendedState(JFrame.MAXIMIZED_BOTH);

	  
	    JMenuBar menuBar = new JMenuBar();
	    menuBar.setBackground(new Color(255, 0, 0));
	    menuBar.setPreferredSize(new Dimension(400, 40));
	   
	    
	    
		JMenu nireKontuaMenu = new JMenu("Nire kontua");
		nireKontuaMenu.setForeground(Color.WHITE); 
		
		JMenu nireEskariMenu = new JMenu("Nire eskariak");
		nireEskariMenu.setForeground(Color.WHITE); 
		
		JMenu produktuakMenu = new JMenu("Produktuak");
		produktuakMenu.setForeground(Color.WHITE); 
		
		menuBar.add(nireKontuaMenu);
		menuBar.add(nireEskariMenu);
		menuBar.add(produktuakMenu);
		
		 
		JMenuItem item1 =  new JMenuItem ("Datu pertsonalak");
		JMenuItem item2 =  new JMenuItem ("Pasahitza aldatu");
		JMenuItem item3 =  new JMenuItem ("Itxi saioa");
		JMenuItem item4 =  new JMenuItem ("Aplikazioa itxi");
		
		nireKontuaMenu.add(item1);
		nireKontuaMenu.add(item2);
		nireKontuaMenu.add(item3);
		nireKontuaMenu.add(item4);
		
		JMenuItem item5 =  new JMenuItem ("Historiala bistaratu");
		JMenuItem item6 =  new JMenuItem ("Egoera");
		nireEskariMenu.add(item5);
		nireEskariMenu.add(item6);
		
		JMenuItem item7 =  new JMenuItem ("Bistaratu");
		produktuakMenu.add(item7);
		
		panelNagusia.add(menuBar);
		lehioa.setJMenuBar(menuBar);
		
		
		// PANEL LOGO
        JPanel logoPanel = new JPanel();
        JLabel logoLabel = new JLabel(new ImageIcon("logo.png"));
        logoPanel.add(logoLabel);
        
        // PANEL TITULO
        JPanel panelTituloa = new JPanel(new FlowLayout(FlowLayout.CENTER));
        JLabel tituloaLabel = new JLabel("Ongi etorri GameStop Aplikaziora!", SwingConstants.CENTER);
        tituloaLabel.setFont(new Font("Arial", Font.BOLD, 30));
        panelTituloa.setPreferredSize(new Dimension(lehioa.getWidth(), 80));
        panelTituloa.setBackground(Color.white);
        panelTituloa.add(tituloaLabel, BorderLayout.CENTER);
        panelNagusia.add(panelTituloa); 
        
        
        //PANEL SUBTITULO
        JPanel panelSubtituloa = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel produktuakLabel = new JLabel("Produktu Motak:", SwingConstants.CENTER);
        panelSubtituloa.setPreferredSize(new Dimension(200, lehioa.getHeight())); // Espacio a la izquierda
	    produktuakLabel.setFont(new Font("Arial", Font.BOLD, 14));
	    produktuakLabel.setForeground(Color.BLACK); 
	    panelSubtituloa.setBackground(Color.WHITE);
	    panelSubtituloa.add(produktuakLabel);
	    panelNagusia.add(panelSubtituloa); 
		
		//PANEL BOTONES
		
	    JPanel panelBotoiak = new JPanel(new GridLayout(2, 3, 40, 40)); // Dos filas y tres columnas, con espacio entre botones
	    panelBotoiak.setPreferredSize(new Dimension(600, 150)); // Ajusta el tamaño del panel (puedes cambiar las dimensiones)
	    panelBotoiak.setBackground(Color.WHITE); // Fondo blanco del panel
		
	    panelNagusia.add(panelBotoiak); 
	    
	    JButton botoiaCPU = new JButton("CPU");
		JButton botoiaMotherboard = new JButton("Mother Board");
		JButton botoiaStorage = new JButton("Storage");
		JButton botoiaVideoCard = new JButton("Video Card");
		JButton botoiaProduktuak = new JButton("Produktu guztiak");
		
		
		//SAIOA ITXI
		item3.addActionListener(e -> {
			Object[] options = {"Bai", "Ez"};
			int erantzuna= JOptionPane.showOptionDialog(null, "Saioa itxi nahi duzu?","Saioa itxi",JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE,null, options,options[0]); 
			if(erantzuna == JOptionPane.YES_OPTION) {
			System.exit(0);}
		});
		
		//PROGRAMA ITXI
		item4.addActionListener(e -> {
			System.exit(0);
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
			item5.addActionListener(e -> {
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
			//ESKARIEN EGOERA
			item6.addActionListener(e -> {

				JPanel panelEskarienEgoera = new JPanel();
			    JLabel datuakLabel = new JLabel("Eskariak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

			    // Conexión a la base de datos
			    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
			    BDeskariEgoera eskariEgoerakDB = db.eskarienEgoerak();

			    // Preparar los datos para el JTable
			    String[] zutabeak = {"ID", "DESKRIBAPENA"};
			    Object[][] datuak = new Object[eskariEgoerakDB.getEskariEgoerak().size()][2];

			    int lerroak = 0;
			    for (EskariEgoera eskariak : eskariEgoerakDB.getEskariEgoerak()) {
			    	datuak[lerroak][0] = eskariak.getId();
			    	datuak[lerroak][1] = eskariak.getDeskribapena();
			        lerroak++;
			    }

			    // Crear JTable con los datos
			    JTable taula = new JTable(datuak, zutabeak);
			    taula.setFont(new Font("Arial", Font.PLAIN, 14));
			    taula.getTableHeader().setBackground(new Color(255, 0, 0));
			    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
			    taula.getTableHeader().setForeground(Color.WHITE); 
			    
			    // Cambiar color de filas según ID
			 // Cambiar color de filas según ID
			    taula.setDefaultRenderer(Object.class, new DefaultTableCellRenderer() {
			        @Override
			        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
			            // Llamamos al renderer original para mantener el comportamiento por defecto
			            Component cell = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);

			            // Obtener el ID desde la primera columna (asumiendo que el ID está en la columna 0)
			            int id = (int) table.getValueAt(row, 0);

			            // Cambiar el color de la fila dependiendo del valor del ID
			            if (id == 1) {
			                cell.setBackground(new Color(255, 179, 71));  // Naranja
			            } else if (id == 2) {
			                cell.setBackground(new Color(255, 182, 193));  // Rosa claro
			            } else if (id == 3) {
			                cell.setBackground(new Color(144, 238, 144));  // Verde claro
			            } else {
			                cell.setBackground(Color.WHITE);  // Por defecto color blanco
			            }

			            return cell;
			        }
			    });
			    
			    
			 // Deshabilitar el reordenamiento de las columnas
			    taula.getTableHeader().setReorderingAllowed(false);
			    taula.setRowHeight(30);
			    taula.getColumnModel().getColumn(0).setPreferredWidth(1600); 
			    taula.getColumnModel().getColumn(1).setPreferredWidth(19950); 
			    
			    // Deshabilitar la edición en todas las celdas
			    taula.setDefaultEditor(Object.class, null);
			    

			    // Añadir JTable a un JScrollPane para manejar el scroll
			    JScrollPane scrollPane = new JScrollPane(taula);
			    scrollPane.setPreferredSize(new Dimension(115, 115));

			    // Agregar el JLabel y el JScrollPane al panelVideoCard
			    panelEskarienEgoera.add(datuakLabel, BorderLayout.NORTH);
			    panelEskarienEgoera.add(scrollPane, BorderLayout.CENTER);

			    // Crear el botón de regreso (Atzera)
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
			    panelEskarienEgoera.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelEskarienEgoera, BorderLayout.CENTER);

			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();

			    // Acción del botón Atzera
			    atzeraBotoia.addActionListener(e2 -> {
			        // VOLVER AL MENU PRINCIPAL
			    	panelNagusia.add(panelBotoiak);
			    	panelNagusia.add(panelTituloa);
			    	panelNagusia.add(panelSubtituloa);
			    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
			        lehioa.setContentPane(panelNagusia);
			        
			        lehioa.revalidate();
			        lehioa.repaint();
			    });
			});
			
			
			//PRODUKTUAK
			item7.addActionListener(e -> {
				JPanel panelProduktuak = new JPanel();
			    JLabel datuakLabel = new JLabel("Produktuak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

			    // Conexión a la base de datos
			    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
			    BDproduktu pDB = db.produktuak();

			    // Preparar los datos para el JTable
			    String[] zutabeak = {"ID", "IZENA", "DESKRIBAPENA", "BALIOA", "SALNEURRIA", "KATEGORIA"};
			    Object[][] datuak = new Object[pDB.getProduktuak().size()][6];
			    
			    int lerroa = 0;
			    for (Produktu produktua : pDB.getProduktuak()) {
			    	datuak[lerroa][0] = produktua.getId();
			    	datuak[lerroa][1] = produktua.getIzena();
			    	datuak[lerroa][2] = produktua.getDeskribapena();
			    	datuak[lerroa][3] = produktua.getBalioa();
			    	datuak[lerroa][4] = produktua.getSalneurria();
			        datuak[lerroa][5] = produktua.getIdKategoria();
			        lerroa++;
			    }

			    // Crear JTable con los datos
			    JTable taula = new JTable(datuak, zutabeak);
			    taula.setFont(new Font("Arial", Font.PLAIN, 14));
			    taula.getTableHeader().setBackground(new Color(255, 0, 0));
			    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
			    taula.getTableHeader().setForeground(Color.WHITE); 
			    
			    taula.setSelectionBackground(new Color(144, 238, 144)); // Verde claro cuando se selecciona una fila
			    taula.setSelectionForeground(Color.BLACK); // Color del texto de la fila seleccionada

			    
			 // Deshabilitar el reordenamiento de las columnas
			    taula.getTableHeader().setReorderingAllowed(false);

			    
			    taula.setRowHeight(30);
			    taula.getColumnModel().getColumn(1).setPreferredWidth(200); 
			    taula.getColumnModel().getColumn(2).setPreferredWidth(300); 
			    taula.getColumnModel().getColumn(4).setPreferredWidth(100); 
			    
			    // Deshabilitar la edición en todas las celdas
			    taula.setDefaultEditor(Object.class, null);
			    
			    // Añadir JTable a un JScrollPane para manejar el scroll
			    JScrollPane scrollPane = new JScrollPane(taula);
			    scrollPane.setPreferredSize(new Dimension(800, 400));
			    
			    // Agregar el JLabel y el JScrollPane al panelVideoCard
			    panelProduktuak.add(datuakLabel, BorderLayout.NORTH);
			    panelProduktuak.add(scrollPane, BorderLayout.CENTER);

			    // Crear el botón de regreso (Atzera)
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
			    panelProduktuak.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelProduktuak, BorderLayout.CENTER);

			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();

			    // Acción del botón Atzera
			    atzeraBotoia.addActionListener(e2 -> {
			        // VOLVER AL MENU PRINCIPAL
			    	panelNagusia.add(panelBotoiak);
			    	panelNagusia.add(panelTituloa);
			    	panelNagusia.add(panelSubtituloa);
			    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
			        lehioa.setContentPane(panelNagusia);
			        
			        lehioa.revalidate();
			        lehioa.repaint();
			    });
			});
		
		
		//BOTOIA CPU
		botoiaCPU.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaCPU.setBackground(new Color(255, 0, 0));
		botoiaCPU.setForeground(Color.WHITE);
		botoiaCPU.setPreferredSize(new Dimension(400, 200)); // Ajusta el tamaño preferido del botón

		
		panelBotoiak.add(botoiaCPU); // Agrega el botón al panel
		panelBotoiak.revalidate(); // Fuerza la actualización del panel
		panelBotoiak.repaint(); // Redibuja el panel
		
	
		
		//BOTOIA VIDEOCARD
		botoiaVideoCard.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaVideoCard.setBackground(new Color(255, 0, 0));
		botoiaVideoCard.setForeground(Color.WHITE);
		botoiaVideoCard.setPreferredSize(new Dimension(400, 200)); // Ajusta el tamaño preferido del botón
	
		// Asegúrate de que el panel tenga un layout adecuado para el tamaño
		panelBotoiak.setLayout(new FlowLayout()); // Cambia el layout si es necesario

		panelBotoiak.add(botoiaVideoCard); // Agrega el botón al panel
		panelBotoiak.revalidate(); // Fuerza la actualización del panel
		panelBotoiak.repaint(); // Redibuja el panel
		panelBotoiak.add(Box.createVerticalStrut(100));
		
		
		//BOTOIA MOTHERBOARD
		botoiaMotherboard.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaMotherboard.setBackground(new Color(255, 0, 0));
		botoiaMotherboard.setForeground(Color.WHITE);
		botoiaMotherboard.setPreferredSize(new Dimension(400, 200)); // Ajusta el tamaño preferido del botón

	
		panelBotoiak.add(botoiaMotherboard); // Agrega el botón al panel
		panelBotoiak.revalidate(); // Fuerza la actualización del panel
		panelBotoiak.repaint(); // Redibuja el panel
		
		//BOTOIA STORAGE
		botoiaStorage.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaStorage.setBackground(new Color(255, 0, 0));
		botoiaStorage.setForeground(Color.WHITE);
		botoiaStorage.setPreferredSize(new Dimension(400, 200)); // Ajusta el tamaño preferido del botón


		panelBotoiak.add(botoiaStorage); // Agrega el botón al panel
		panelBotoiak.revalidate(); // Fuerza la actualización del panel
		panelBotoiak.repaint(); // Redibuja el panel
		
		
		//BOTIOA PRODUKTUAK
		botoiaProduktuak.setFont(new Font("Arial", Font.BOLD, 15));
		botoiaProduktuak.setBackground(new Color(255, 0, 0));
		botoiaProduktuak.setForeground(Color.WHITE);
		botoiaProduktuak.setPreferredSize(new Dimension(400, 200)); // Ajusta el tamaño preferido del botón


		panelBotoiak.add(botoiaProduktuak); // Agrega el botón al panel
		panelBotoiak.revalidate(); // Fuerza la actualización del panel
		panelBotoiak.repaint(); // Redibuja el panel
		

		
		//BOTOIEN FUNTZIONALITATEAK
		botoiaCPU.addActionListener(e -> {
		    JPanel panelCPU = new JPanel();
		    JLabel datuakLabel = new JLabel("CPU Produktuak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

		    // Conexión a la base de datos
		    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
		    BDproduktu pDB = db.produktuakCPU();

		    // Preparar los datos para el JTable
		    String[] zutabeak = {"ID", "IZENA", "DESKRIBAPENA", "BALIOA", "SALNEURRIA", "KATEGORIA"};
		    Object[][] datuak = new Object[pDB.getProduktuak().size()][6];

		    int lerroak = 0;
		    for (Produktu produktua : pDB.getProduktuak()) {
		    	datuak[lerroak][0] = produktua.getId();
		    	datuak[lerroak][1] = produktua.getIzena();
		    	datuak[lerroak][2] = produktua.getDeskribapena();
		    	datuak[lerroak][3] = produktua.getBalioa();
		    	datuak[lerroak][4] = produktua.getSalneurria();
		    	datuak[lerroak][5] = produktua.getIdKategoria();
		        lerroak++;
		    }

		    // Crear JTable con los datos
		    JTable taula = new JTable(datuak, zutabeak);
		    taula.setFont(new Font("Arial", Font.PLAIN, 14));
		    taula.getTableHeader().setBackground(new Color(255, 0, 0));
		    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
		    taula.getTableHeader().setForeground(Color.WHITE); 
		    
		    taula.setSelectionBackground(new Color(144, 238, 144)); // Verde claro cuando se selecciona una fila
		    taula.setSelectionForeground(Color.BLACK); // Color del texto de la fila seleccionada

		    
		 // Deshabilitar el reordenamiento de las columnas
		    taula.getTableHeader().setReorderingAllowed(false);
		    taula.setRowHeight(30);
		    taula.getColumnModel().getColumn(1).setPreferredWidth(200); 
		    taula.getColumnModel().getColumn(2).setPreferredWidth(300); 
		    taula.getColumnModel().getColumn(4).setPreferredWidth(100); 
		    
		    // Deshabilitar la edición en todas las celdas
		    taula.setDefaultEditor(Object.class, null);
		    

		    // Añadir JTable a un JScrollPane para manejar el scroll
		    JScrollPane scrollPane = new JScrollPane(taula);
		    scrollPane.setPreferredSize(new Dimension(800, 400));

		    // Agregar el JLabel y el JScrollPane al panelVideoCard
		    panelCPU.add(datuakLabel, BorderLayout.NORTH);
		    panelCPU.add(scrollPane, BorderLayout.CENTER);

		    // Crear el botón de regreso (Atzera)
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
		    panelCPU.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelCPU, BorderLayout.CENTER);

		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();

		    // Acción del botón Atzera
		    atzeraBotoia.addActionListener(e2 -> {
		        // VOLVER AL MENU PRINCIPAL
		    	panelNagusia.add(panelBotoiak);
		    	panelNagusia.add(panelTituloa);
		    	panelNagusia.add(panelSubtituloa);
		    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
		        lehioa.setContentPane(panelNagusia);
		        
		        lehioa.revalidate();
		        lehioa.repaint();
		    });
		});
        
	
		botoiaMotherboard.addActionListener(e -> {
			 JPanel panelStorage = new JPanel();
			    JLabel datuakLabel = new JLabel("Motherboard Produktuak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

			    // Conexión a la base de datos
			    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
			    BDproduktu pDB = db.produktuakStorage();

			    // Preparar los datos para el JTable
			    String[] zutabeak = {"ID", "IZENA", "DESKRIBAPENA", "BALIOA", "SALNEURRIA", "KATEGORIA"};
			    Object[][] datuak = new Object[pDB.getProduktuak().size()][6];
			    
			    int lerroa = 0;
			    for (Produktu produktua : pDB.getProduktuak()) {
			    	datuak[lerroa][0] = produktua.getId();
			    	datuak[lerroa][1] = produktua.getIzena();
			    	datuak[lerroa][2] = produktua.getDeskribapena();
			    	datuak[lerroa][3] = produktua.getBalioa();
			    	datuak[lerroa][4] = produktua.getSalneurria();
			        datuak[lerroa][5] = produktua.getIdKategoria();
			        lerroa++;
			    }

			    // Crear JTable con los datos
			    JTable taula = new JTable(datuak, zutabeak);
			    taula.setFont(new Font("Arial", Font.PLAIN, 14));
			    taula.getTableHeader().setBackground(new Color(255, 0, 0));
			    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
			    taula.getTableHeader().setForeground(Color.WHITE); 
			    
			    taula.setSelectionBackground(new Color(144, 238, 144)); // Verde claro cuando se selecciona una fila
			    taula.setSelectionForeground(Color.BLACK); // Color del texto de la fila seleccionada

			    
			 // Deshabilitar el reordenamiento de las columnas
			    taula.getTableHeader().setReorderingAllowed(false);

			    
			    taula.setRowHeight(30);
			    taula.getColumnModel().getColumn(1).setPreferredWidth(200); 
			    taula.getColumnModel().getColumn(2).setPreferredWidth(300); 
			    taula.getColumnModel().getColumn(4).setPreferredWidth(100); 
			    
			    // Deshabilitar la edición en todas las celdas
			    taula.setDefaultEditor(Object.class, null);
			    
			    // Añadir JTable a un JScrollPane para manejar el scroll
			    JScrollPane scrollPane = new JScrollPane(taula);
			    scrollPane.setPreferredSize(new Dimension(800, 400));
			    
			    // Agregar el JLabel y el JScrollPane al panelVideoCard
			    panelStorage.add(datuakLabel, BorderLayout.NORTH);
			    panelStorage.add(scrollPane, BorderLayout.CENTER);

			    // Crear el botón de regreso (Atzera)
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
			    panelStorage.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelStorage, BorderLayout.CENTER);

			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();

			    // Acción del botón Atzera
			    atzeraBotoia.addActionListener(e2 -> {
			        // VOLVER AL MENU PRINCIPAL
			    	panelNagusia.add(panelBotoiak);
			    	panelNagusia.add(panelTituloa);
			    	panelNagusia.add(panelSubtituloa);
			    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
			        lehioa.setContentPane(panelNagusia);
			        
			        lehioa.revalidate();
			        lehioa.repaint();
			    });
			});
		
		botoiaStorage.addActionListener(e -> {
			 JPanel panelMotherboard = new JPanel();
			    JLabel datuakLabel = new JLabel("Storage Produktuak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

			    // Conexión a la base de datos
			    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
			    BDproduktu pDB = db.produktuakMotherBoard();

			    // Preparar los datos para el JTable
			    String[] zutabeak = {"ID", "IZENA", "DESKRIBAPENA", "BALIOA", "SALNEURRIA", "KATEGORIA"};
			    Object[][] datuak = new Object[pDB.getProduktuak().size()][6];
			    
			    int lerroa = 0;
			    for (Produktu produktua : pDB.getProduktuak()) {
			    	datuak[lerroa][0] = produktua.getId();
			    	datuak[lerroa][1] = produktua.getIzena();
			    	datuak[lerroa][2] = produktua.getDeskribapena();
			    	datuak[lerroa][3] = produktua.getBalioa();
			    	datuak[lerroa][4] = produktua.getSalneurria();
			        datuak[lerroa][5] = produktua.getIdKategoria();
			        lerroa++;
			    }

			    // Crear JTable con los datos
			    JTable taula = new JTable(datuak, zutabeak);
			    taula.setFont(new Font("Arial", Font.PLAIN, 14));
			    taula.getTableHeader().setBackground(new Color(255, 0, 0));
			    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
			    taula.getTableHeader().setForeground(Color.WHITE); 
			    
			    taula.setSelectionBackground(new Color(144, 238, 144)); // Verde claro cuando se selecciona una fila
			    taula.setSelectionForeground(Color.BLACK); // Color del texto de la fila seleccionada

			    
			 // Deshabilitar el reordenamiento de las columnas
			    taula.getTableHeader().setReorderingAllowed(false);

			    
			    taula.setRowHeight(30);
			    taula.getColumnModel().getColumn(1).setPreferredWidth(200); 
			    taula.getColumnModel().getColumn(2).setPreferredWidth(300); 
			    taula.getColumnModel().getColumn(4).setPreferredWidth(100); 
			    
			    // Deshabilitar la edición en todas las celdas
			    taula.setDefaultEditor(Object.class, null);
			    
			    // Añadir JTable a un JScrollPane para manejar el scroll
			    JScrollPane scrollPane = new JScrollPane(taula);
			    scrollPane.setPreferredSize(new Dimension(800, 400));
			    
			    // Agregar el JLabel y el JScrollPane al panelVideoCard
			    panelMotherboard.add(datuakLabel, BorderLayout.NORTH);
			    panelMotherboard.add(scrollPane, BorderLayout.CENTER);

			    // Crear el botón de regreso (Atzera)
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
			    panelMotherboard.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelMotherboard, BorderLayout.CENTER);

			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();

			    // Acción del botón Atzera
			    atzeraBotoia.addActionListener(e2 -> {
			        // VOLVER AL MENU PRINCIPAL
			    	panelNagusia.add(panelBotoiak);
			    	panelNagusia.add(panelTituloa);
			    	panelNagusia.add(panelSubtituloa);
			    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
			        lehioa.setContentPane(panelNagusia);
			        
			        lehioa.revalidate();
			        lehioa.repaint();
			    });
			});
		
		
		botoiaVideoCard.addActionListener(e -> {
		    JPanel panelVideoCard = new JPanel();
		    JLabel datuakLabel = new JLabel("Video Card Produktuak", SwingConstants.CENTER);
		    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

		    // Conexión a la base de datos
		    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
		    BDproduktu pDB = db.produktuakVideoCard();

		    // Preparar los datos para el JTable
		    String[] zutabeak = {"ID", "IZENA", "DESKRIBAPENA", "BALIOA", "SALNEURRIA", "KATEGORIA"};
		    Object[][] datuak = new Object[pDB.getProduktuak().size()][6];

		    int lerroak = 0;
		    for (Produktu produktua : pDB.getProduktuak()) {
		    	datuak[lerroak][0] = produktua.getId();
		    	datuak[lerroak][1] = produktua.getIzena();
		        datuak[lerroak][2] = produktua.getDeskribapena();
		        datuak[lerroak][3] = produktua.getBalioa();
		        datuak[lerroak][4] = produktua.getSalneurria();
		        datuak[lerroak][5] = produktua.getIdKategoria();
		        lerroak++;
		    }

		    // Crear JTable con los datos
		    JTable taula = new JTable(datuak, zutabeak);
		    taula.setFont(new Font("Arial", Font.PLAIN, 14));
		    taula.getTableHeader().setBackground(new Color(255, 0, 0));
		    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
		    taula.getTableHeader().setForeground(Color.WHITE); 
		    
		    taula.setSelectionBackground(new Color(144, 238, 144)); // Verde claro cuando se selecciona una fila
		    taula.setSelectionForeground(Color.BLACK); // Color del texto de la fila seleccionada

		 // Deshabilitar el reordenamiento de las columnas
		    taula.getTableHeader().setReorderingAllowed(false);

		    
		    taula.setRowHeight(30);
		    taula.getColumnModel().getColumn(1).setPreferredWidth(200); 
		    taula.getColumnModel().getColumn(2).setPreferredWidth(300); 
		    taula.getColumnModel().getColumn(4).setPreferredWidth(100); 
		     
		    
		    // Deshabilitar la edición en todas las celdas
		    taula.setDefaultEditor(Object.class, null);

		    // Añadir JTable a un JScrollPane para manejar el scroll
		    JScrollPane scrollPane = new JScrollPane(taula);
		    scrollPane.setPreferredSize(new Dimension(1100, 400));

		 // Agregar el JLabel y el JScrollPane al panelVideoCard
		    panelVideoCard.add(datuakLabel, BorderLayout.NORTH);
		    panelVideoCard.add(scrollPane, BorderLayout.CENTER);

		    // Crear el botón de regreso (Atzera)
		    JButton atzeraBotoia = new JButton("Atzera");
		    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
		    atzeraBotoia.setBackground(new Color(216, 191, 216));
		    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
		    panelVideoCard.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

		    // Limpiar el contenido actual y agregar el nuevo panel
		    lehioa.getContentPane().removeAll();
		    lehioa.getContentPane().add(panelVideoCard, BorderLayout.CENTER);

		    // Refrescar la interfaz
		    lehioa.revalidate();
		    lehioa.repaint();

		    // Acción del botón Atzera
		    atzeraBotoia.addActionListener(e2 -> {
		        // VOLVER AL MENU PRINCIPAL
		    	panelNagusia.add(panelBotoiak);
		    	panelNagusia.add(panelTituloa);
		    	panelNagusia.add(panelSubtituloa);
		    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
		        lehioa.setContentPane(panelNagusia);
		        
		        lehioa.revalidate();
		        lehioa.repaint();
		    });
		});
        
		botoiaProduktuak.addActionListener(e -> {
			 JPanel panelProduktuak = new JPanel();
			    JLabel datuakLabel = new JLabel("Produktuak", SwingConstants.CENTER);
			    datuakLabel.setFont(new Font("Arial", Font.BOLD, 14));

			    // Conexión a la base de datos
			    DatuBasea db = new DatuBasea("jdbc:oracle:thin:@localhost:1521/XEPDB1", "GAMESTOP", "GAMESTOP");
			    BDproduktu pDB = db.produktuak();

			    // Preparar los datos para el JTable
			    String[] zutabeak = {"ID", "IZENA", "DESKRIBAPENA", "BALIOA", "SALNEURRIA", "KATEGORIA"};
			    Object[][] datuak = new Object[pDB.getProduktuak().size()][6];
			    
			    int lerroa = 0;
			    for (Produktu produktua : pDB.getProduktuak()) {
			    	datuak[lerroa][0] = produktua.getId();
			    	datuak[lerroa][1] = produktua.getIzena();
			    	datuak[lerroa][2] = produktua.getDeskribapena();
			    	datuak[lerroa][3] = produktua.getBalioa();
			    	datuak[lerroa][4] = produktua.getSalneurria();
			        datuak[lerroa][5] = produktua.getIdKategoria();
			        lerroa++;
			    }

			    // Crear JTable con los datos
			    JTable taula = new JTable(datuak, zutabeak);
			    taula.setFont(new Font("Arial", Font.PLAIN, 14));
			    taula.getTableHeader().setBackground(new Color(255, 0, 0));
			    taula.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
			    taula.getTableHeader().setForeground(Color.WHITE); 
			    
			    taula.setSelectionBackground(new Color(144, 238, 144)); // Verde claro cuando se selecciona una fila
			    taula.setSelectionForeground(Color.BLACK); // Color del texto de la fila seleccionada

			    
			 // Deshabilitar el reordenamiento de las columnas
			    taula.getTableHeader().setReorderingAllowed(false);

			    
			    taula.setRowHeight(30);
			    taula.getColumnModel().getColumn(1).setPreferredWidth(200); 
			    taula.getColumnModel().getColumn(2).setPreferredWidth(300); 
			    taula.getColumnModel().getColumn(4).setPreferredWidth(100); 
			    
			    // Deshabilitar la edición en todas las celdas
			    taula.setDefaultEditor(Object.class, null);
			    
			    // Añadir JTable a un JScrollPane para manejar el scroll
			    JScrollPane scrollPane = new JScrollPane(taula);
			    scrollPane.setPreferredSize(new Dimension(800, 400));
			    
			    // Agregar el JLabel y el JScrollPane al panelVideoCard
			    panelProduktuak.add(datuakLabel, BorderLayout.NORTH);
			    panelProduktuak.add(scrollPane, BorderLayout.CENTER);

			    // Crear el botón de regreso (Atzera)
			    JButton atzeraBotoia = new JButton("Atzera");
			    atzeraBotoia.setFont(new Font("Arial", Font.BOLD, 14));
			    atzeraBotoia.setBackground(new Color(216, 191, 216));
			    atzeraBotoia.setPreferredSize(new Dimension(100, 40)); // Tamaño adecuado para el botón
			    panelProduktuak.add(atzeraBotoia, BorderLayout.SOUTH); // Aseguramos que el botón esté en la parte inferior

			    // Limpiar el contenido actual y agregar el nuevo panel
			    lehioa.getContentPane().removeAll();
			    lehioa.getContentPane().add(panelProduktuak, BorderLayout.CENTER);

			    // Refrescar la interfaz
			    lehioa.revalidate();
			    lehioa.repaint();

			    // Acción del botón Atzera
			    atzeraBotoia.addActionListener(e2 -> {
			        // VOLVER AL MENU PRINCIPAL
			    	panelNagusia.add(panelBotoiak);
			    	panelNagusia.add(panelTituloa);
			    	panelNagusia.add(panelSubtituloa);
			    	panelBotoiak.setPreferredSize(new Dimension(1920, 1080));
			        lehioa.setContentPane(panelNagusia);
			        
			        lehioa.revalidate();
			        lehioa.repaint();
			    });
			});
			
        
        //FRAME
		//lehioa.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
	    
	    //lehioa.add(logoPanel);
	    lehioa.add(panelTituloa, BorderLayout.NORTH);
	    lehioa.add(panelSubtituloa, BorderLayout.WEST);
	    lehioa.add(panelBotoiak, BorderLayout.CENTER);
	    lehioa.pack();
	    lehioa.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    //lehioa.setExtendedState(JFrame.MAXIMIZED_BOTH);
	    lehioa.setSize(1920, 1080);
	    lehioa.setVisible(true);
	    
	}
	
	

	public static void main(String[] args) {
		bezeroMenua();
	}
}
