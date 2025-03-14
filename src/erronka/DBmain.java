package erronka;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.sql.SQLException;

/**
 * Datu base klasea konexioa eta kontsultak egiteko
 */

// NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO

public class DBmain {

	private static String url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";
	private static String user = "E3T5";
	private static String pass = "ikasle123";

//	public DBmain() {
//		this.url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";
//		this.user = "E3T5";
//		this.pass = "ikasle123";
//	}
//
//	public DBmain(String url, String user, String pass) {
//		this.url = url;
//		this.user = user;
//		this.pass = pass;
//	}

	// Konexioa egiteko metodo generikoa.
	public static Connection konexioa() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, pass);
			return conn;
		} catch (Exception e) {
			System.out.println("Konexio errorea: " + e);
		}
		return conn;
	}

}