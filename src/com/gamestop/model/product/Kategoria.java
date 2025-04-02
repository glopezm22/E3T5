package com.gamestop.model.product;

/**
 * Kategoria klaseak kategorien informazioa gordetzen du.
 */
public class Kategoria {

    private int id;
    private String izena;

	public Kategoria() {
	}
	
    /**
     * Kategoria klasearen konstruktorea.
     *
     * @param id    Kategoriaren IDa
     * @param izena Kategoriaren izena
     */
    public Kategoria(int id, String izena) {
        this.id = id;
        this.izena = izena;
    }

    /**
     * Kategoriaren informazioa testu moduan itzultzen du.
     *
     * @return Kategoriaren informazioa
     */
    @Override
    public String toString() {
        return "Kategoria [ID: " + id + ", Izena: " + izena + "]";
    }
}