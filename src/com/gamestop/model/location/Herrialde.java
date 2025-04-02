package com.gamestop.model.location;

/**
 * Herrialde klaseak herrialdeen informazioa gordetzen du.
 */
public class Herrialde {

    private String id;
    private String izena;
    private int id_kontinente;

	public Herrialde() {
	}
	
    /**
     * Herrialde klasearen konstruktorea.
     *
     * @param id            Herrialdearen IDa
     * @param izena         Herrialdearen izena
     * @param id_kontinente Herrialdearen kontinentearen IDa
     */
    public Herrialde(String id, String izena, int id_kontinente) {
        this.id = id;
        this.izena = izena;
        this.id_kontinente = id_kontinente;
    }

    /**
     * Herrialdearen informazioa testu moduan itzultzen du.
     *
     * @return Herrialdearen informazioa
     */
    @Override
    public String toString() {
        return "Herrialde [ID: " + id + ", Izena: " + izena + ", ID Kontinente: " + id_kontinente + "]";
    }
}