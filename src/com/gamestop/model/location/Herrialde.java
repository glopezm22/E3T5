package com.gamestop.model.location;

/**
 * Herrialde baten informazioa gordetzeko klasea.
 */
public class Herrialde {

    private String id;
    private String izena;
    private int id_kontinente;

    /**
     * Herrialde klasearen konstruktore lehenetsia.
     */
    public Herrialde() {
    }
    
    /**
     * Herrialde klasearen konstruktorea parametroekin.
     *
     * @param id            Herrialdearen IDa
     * @param izena         Herrialdearen izena
     * @param id_kontinente Herrialdea dagoen kontinentearen identifikadorea
     */
    public Herrialde(String id, String izena, int id_kontinente) {
        this.id = id;
        this.izena = izena;
        this.id_kontinente = id_kontinente;
    }

    /**
     * Herrialdearen informazioa testu formatuan itzultzen du.
     *
     * @return Herrialdearen informazioa testu kate gisa
     */
    @Override
    public String toString() {
        return "Herrialde [ID: " + id + ", Izena: " + izena + ", ID Kontinente: " + id_kontinente + "]";
    }
}