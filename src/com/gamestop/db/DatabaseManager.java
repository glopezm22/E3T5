package com.gamestop.db;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.Statement;
import javax.swing.JOptionPane;


public class DatabaseManager {
    private static String url;
    private static String user;
    private static String pass;

    static {
        try {
            // SOLUCIÓN DEFINITIVA - Carga desde filesystem
            InputStream input = Files.newInputStream(
                Paths.get(System.getProperty("user.dir"), 
                        "resources/config/database.properties"));
            
            Properties props = new Properties();
            props.load(input);
            url = props.getProperty("db.url");
            user = props.getProperty("db.username");
            pass = props.getProperty("db.password");
            Class.forName(props.getProperty("db.driver"));
            input.close();
        } catch (Exception e) {
            throw new RuntimeException("ERROR cargando configuración: " + e.getMessage(), e);
        }
    }

    // Método original que necesitas mantener
    public static Connection konexioa() {
        try {
            return DriverManager.getConnection(url, user, pass);
        } catch (SQLException e) {
            System.err.println("Error de conexión: " + e.getMessage());
            return null;
        }
    }

    // Método recomendado para nuevas implementaciones (opcional)
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, pass);
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