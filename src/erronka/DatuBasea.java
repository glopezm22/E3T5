package Aplikazioa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Ariketak.Produktua;
import Ariketak.Produktuak;

import java.sql.SQLException;

public class DatuBasea {
	private String url;
	   private String user;
	   private String pass;
	   
	   //defektuzko sortzailea 
	   public DatuBasea (){
	      this.url="jdbc:oracle:thin:@localhost:1521/XEPDB1";
	      this.user="GAMESTOP";
	      this.pass="GAMESTOP";
	   }
	   
	   //sortzailea parametroekin
	   public DatuBasea (String url, String user, String pass){
	      this.url=url;
	      this.user=user;
	      this.pass=pass;
	   }
	   
	   
	   //konexioa egin, bat generikoa balio izango duena konexio guztietarako
	   public Connection konexioa (){
	      Connection conn = null;
	      try{
	         conn = DriverManager.getConnection(url, user, pass);
	         return conn;
	      } catch (Exception e){
	         System.out.println("Konexio errorea: "+e);
	      }
	      return conn;
	   }

	   ///HEMEN kontsultak, metedo bat kontsulta bakoitzeko, gogoratu konexioak itxi behar direla   
	   public BDproduktu produktuakCPU() {
		    BDproduktu pDB = new BDproduktu();
		   
		    try {
		    	Connection conn = konexioa();
		        Statement stmt = conn.createStatement();
		        ResultSet rs = stmt.executeQuery("SELECT * FROM PRODUKTU WHERE ID_KATEGORIA = 1");

		        while (rs.next()) {
		            // Crear un objeto 'Produktu' con los datos de la base de datos
		        	int id = rs.getInt("ID");
		            String izena = rs.getString("IZENA");
		            String deskribapena = rs.getString("DESKRIBAPENA");
		            double balioa = rs.getDouble("BALIOA");
		            double salneurria = rs.getDouble("SALNEURRIA");
		            int idKategoria = rs.getInt("ID_KATEGORIA");
		           
		            // Agregar el producto a la lista
			        Produktu produktua = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
		            pDB.produktuGehitu(produktua);
		            
		        }
		      
		    }catch (SQLException e) {
		        System.out.println("Error al conectar o ejecutar la consulta.");
		        e.printStackTrace();
		    }  
		    
		    
		    // Devolver la instancia de BDproduktu con los productos cargados
		    return pDB;
		}
	   
	   
	   
	   public BDproduktu produktuakMotherBoard() {
		    BDproduktu pDB = new BDproduktu();
		   
		    try {
		    	Connection conn = konexioa();
		        Statement stmt = conn.createStatement();
		        ResultSet rs = stmt.executeQuery("SELECT * FROM PRODUKTU WHERE ID_KATEGORIA = 4");

		        while (rs.next()) {
		            // Crear un objeto 'Produktu' con los datos de la base de datos
		        	int id = rs.getInt("ID");
		            String izena = rs.getString("IZENA");
		            String deskribapena = rs.getString("DESKRIBAPENA");
		            double balioa = rs.getDouble("BALIOA");
		            double salneurria = rs.getDouble("SALNEURRIA");
		            int idKategoria = rs.getInt("ID_KATEGORIA");
		           
		            // Agregar el producto a la lista
			        Produktu produktua = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
		            pDB.produktuGehitu(produktua);
		            
		        }
		      
		    }catch (SQLException e) {
		        System.out.println("Error al conectar o ejecutar la consulta.");
		        e.printStackTrace();
		    }  
		    
		    
		    // Devolver la instancia de BDproduktu con los productos cargados
		    return pDB;
		}
	   
	   public BDproduktu produktuakVideoCard() {
		    BDproduktu pDB = new BDproduktu();
		   
		    try {
		    	Connection conn = konexioa();
		        Statement stmt = conn.createStatement();
		        ResultSet rs = stmt.executeQuery("SELECT * FROM PRODUKTU WHERE ID_KATEGORIA = 5");

		        while (rs.next()) {
		            // Crear un objeto 'Produktu' con los datos de la base de datos
		        	int id = rs.getInt("ID");
		            String izena = rs.getString("IZENA");
		            String deskribapena = rs.getString("DESKRIBAPENA");
		            double balioa = rs.getDouble("BALIOA");
		            double salneurria = rs.getDouble("SALNEURRIA");
		            int idKategoria = rs.getInt("ID_KATEGORIA");
		           
		            // Agregar el producto a la lista
			        Produktu produktua = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
		            pDB.produktuGehitu(produktua);
		            
		        }
		      
		    }catch (SQLException e) {
		        System.out.println("Error al conectar o ejecutar la consulta.");
		        e.printStackTrace();
		    }  
		    
		    
		    // Devolver la instancia de BDproduktu con los productos cargados
		    return pDB;
		}
	   
	   public BDproduktu produktuakStorage() {
		    BDproduktu pDB = new BDproduktu();
		   
		    try {
		    	Connection conn = konexioa();
		        Statement stmt = conn.createStatement();
		        ResultSet rs = stmt.executeQuery("SELECT * FROM PRODUKTU WHERE ID_KATEGORIA = 2");

		        while (rs.next()) {
		            // Crear un objeto 'Produktu' con los datos de la base de datos
		        	int id = rs.getInt("ID");
		            String izena = rs.getString("IZENA");
		            String deskribapena = rs.getString("DESKRIBAPENA");
		            double balioa = rs.getDouble("BALIOA");
		            double salneurria = rs.getDouble("SALNEURRIA");
		            int idKategoria = rs.getInt("ID_KATEGORIA");
		           
		            // Agregar el producto a la lista
			        Produktu produktua = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
		            pDB.produktuGehitu(produktua);
		            
		        }
		      
		    }catch (SQLException e) {
		        System.out.println("Error al conectar o ejecutar la consulta.");
		        e.printStackTrace();
		    }  
		    
		    
		    // Devolver la instancia de BDproduktu con los productos cargados
		    return pDB;
		}
	   
	   
	   public BDproduktu produktuak() {
		    BDproduktu pDB = new BDproduktu();
		   
		    try {
		    	Connection conn = konexioa();
		        Statement stmt = conn.createStatement();
		        ResultSet rs = stmt.executeQuery("SELECT * FROM PRODUKTU");

		        while (rs.next()) {
		            // Crear un objeto 'Produktu' con los datos de la base de datos
		        	int id = rs.getInt("ID");
		            String izena = rs.getString("IZENA");
		            String deskribapena = rs.getString("DESKRIBAPENA");
		            double balioa = rs.getDouble("BALIOA");
		            double salneurria = rs.getDouble("SALNEURRIA");
		            int idKategoria = rs.getInt("ID_KATEGORIA");
		           
		            // Agregar el producto a la lista
			        Produktu produktua = new Produktu(id, izena, deskribapena, balioa, salneurria, idKategoria);
		            pDB.produktuGehitu(produktua);
		            
		        }
		      
		    }catch (SQLException e) {
		        System.out.println("Error al conectar o ejecutar la consulta.");
		        e.printStackTrace();
		    }  
		    
		    
		    // Devolver la instancia de BDproduktu con los productos cargados
		    return pDB;
		}
	   
	   
	   public BDeskariEgoera eskarienEgoerak() {
		   BDeskariEgoera eskariEgoeraDB = new BDeskariEgoera();
	      
	        try {
	        	Connection conn = konexioa();
		        Statement stmt = conn.createStatement();
		        ResultSet rs = stmt.executeQuery("SELECT * FROM ESKARI_EGOERA");

	            // Agregar los resultados al ArrayList
	            while (rs.next()) {
	            	int id = rs.getInt("ID");
	            	String deskribapena = rs.getString("DESKRIBAPENA");
	            	EskariEgoera egoera = new EskariEgoera(id, deskribapena);
	            	eskariEgoeraDB.eskariEgoeraGehitu(egoera);
	            	
	            } 
	          }catch (SQLException e) {
		        System.out.println("Error al conectar o ejecutar la consulta.");
		        e.printStackTrace();
		    }  
		    
	  
	        return eskariEgoeraDB;
	    }
	
	   
	  
}