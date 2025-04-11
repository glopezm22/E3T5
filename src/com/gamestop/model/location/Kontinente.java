package com.gamestop.model.location;

/**
 * Kontinente baten informazioa gordetzeko klasea.
 */
public class Kontinente {

    private int id;
    private String izena;

    /**
     * Kontinente klasearen konstruktore lehenetsia.
     */
    public Kontinente() {
    }
    
    /**
     * Kontinente klasearen konstruktorea parametroekin.
     *
     * @param id    Kontinentearen IDa
     * @param izena Kontinentearen izena
     */
    public Kontinente(int id, String izena) {
        this.id = id;
        this.izena = izena;
    }

    /**
     * Kontinentearen informazio laburra testu formatuan itzultzen du.
     *
     * @return Kontinentearen oinarrizko informazioa
     */
    @Override
    public String toString() {
        return "Kontinente [ID: " + id + ", Izena: " + izena + "]";
    }
}