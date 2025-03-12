package erronka;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

public class DB {
	
	public static final String url = "jdbc:oracle:thin:@//localhost:1521/xepdb1";
	public static final String erabiltzailea = "E3T5";
	public static final String pasahitza = "ikasle123";

	public static void main(String[] args) {

		try {
			Connection conexion = DriverManager.getConnection(url, erabiltzailea, pasahitza);
			Statement statement = conexion.createStatement();
			String consulta = "SELECT * FROM BEZERO";
			ResultSet resultSet = statement.executeQuery(consulta);

			while (resultSet.next()) {
			    int id = resultSet.getInt("ID");
			    String nombre = resultSet.getString("IZENA");
			    // Prozesatu lortutako emaitzak
			    System.out.println(id + " " + nombre);
			}
			    // Eta konexioak itxi
			    resultSet.close();
			    statement.close();
			    conexion.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}