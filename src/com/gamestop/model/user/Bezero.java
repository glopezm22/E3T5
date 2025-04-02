package com.gamestop.model.user;

/**
 * Bezero klaseak bezeroen informazioa gordetzen du.
 */
public class Bezero {

	private int id;
	private String izena;
	private String abizena;
	private String helbidea;
	private String emaila;
	
	public Bezero() {
	}

	/**
	 * Bezero klasearen konstruktorea.
	 *
	 * @param id       Bezeroaren IDa
	 * @param izena    Bezeroaren izena
	 * @param abizena  Bezeroaren abizena
	 * @param helbidea Bezeroaren helbidea
	 * @param emaila   Bezeroaren emaila
	 */
	public Bezero(int id, String izena, String abizena, String helbidea, String emaila) {
		this.id = id;
		this.izena = izena;
		this.abizena = abizena;
		this.helbidea = helbidea;
		this.emaila = emaila;
	}
	
	/**
	 * Bezeroaren informazioa testu moduan itzultzen du.
	 *
	 * @return Bezeroaren informazioa
	 */
	@Override
	public String toString() {
		return "Bezero [ID: " + id + ", Izena: " + izena + ", Abizena: " + abizena + ", Helbidea: " + helbidea
				+ ", Emaila: " + emaila + "]";
	}
}