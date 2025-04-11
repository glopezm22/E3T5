package com.gamestop.model.location;

/**
 * Kokaleku baten informazioa gordetzeko klasea (helbidea, udalerria, probintzia...).
 */
public class Kokaleku {

    private int id;
    private String helbidea;
    private String postakodea;
    private String udalerria;
    private String probintzia;
    private String id_herrialde;

    /**
     * Kokaleku klasearen konstruktore lehenetsia.
     */
    public Kokaleku() {
    }
    
    /**
     * Kokaleku klasearen konstruktorea parametroekin.
     *
     * @param id           Kokalekuaren IDa
     * @param helbidea     Kokalekuaren helbidea
     * @param postakodea   Kokalekuaren posta kodea
     * @param udalerria    Kokalekua dagoen udalerriaren izena
     * @param probintzia   Kokalekua dagoen probintziaren izena
     * @param id_herrialde Kokalekua dagoen herrialdearen identifikadorea
     */
    public Kokaleku(int id, String helbidea, String postakodea, String udalerria, String probintzia,
            String id_herrialde) {
        this.id = id;
        this.helbidea = helbidea;
        this.postakodea = postakodea;
        this.udalerria = udalerria;
        this.probintzia = probintzia;
        this.id_herrialde = id_herrialde;
    }

    /**
     * Kokalekuaren informazio osoa testu formatuan itzultzen du.
     *
     * @return Kokalekuaren informazioa, atal guztiekin batera
     */
    @Override
    public String toString() {
        return "Kokaleku [ID: " + id + ", Helbidea: " + helbidea + ", Postakodea: " + postakodea + ", Udalerria: "
                + udalerria + ", Probintzia: " + probintzia + ", ID Herrialde: " + id_herrialde + "]";
    }
}