package erronka;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.sql.SQLException;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 * Datu base klasea konexioa eta kontsultak egiteko
 */

// NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO
// NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO // NO TOCAR NADA DE ESTE ARCHIVO
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

	public void deleteUser(String tableName, String izena) {
		try {
			Connection conn = konexioa();
			Statement stmt = conn.createStatement();
			String sql = "DELETE FROM " + tableName + " WHERE PRODUKTUKODEA = '" + izena + "'";
			stmt.executeUpdate(sql);
			conn.close();
		} catch (SQLException e) {
			System.out.println("ERROREA: " + e);
		}
	}

	// Método para actualizar un campo en la tabla
	public void updateTable(String tableName, String campo, String nuevoValor, String condition) {
		try {
			Connection conn = konexioa();
			Statement stmt = conn.createStatement();
			String sql = "UPDATE " + tableName + " SET " + campo + " = '" + nuevoValor + "' WHERE " + condition;
			stmt.executeUpdate(sql);
			conn.close();
		} catch (SQLException e) {
			System.out.println("ERROREA: " + e);
		}
	}

	public static void saltzaileEdoBezeroSortu(String taula, String eremuak, String balioak) {
		try {
			Connection conn = konexioa();
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO " + taula + "(" + eremuak + ") VALUES (" + balioak + ")";
			stmt.executeUpdate(sql);
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void erabiltzaileaSortu(String taula, String eremuak, String balioak) {
		try {
			Connection conn = konexioa();
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO " + taula + "(" + eremuak + ") SELECT " + balioak + "";
			stmt.executeUpdate(sql);
			conn.close();
			JOptionPane.showMessageDialog(null, "Erabiltzailea gehitu da.");
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Errorea: erabiltzailea ezin da gehitu.");
			e.printStackTrace();
		}
	}


}