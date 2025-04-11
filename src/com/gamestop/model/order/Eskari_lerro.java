package com.gamestop.model.order;

/**
 * Eskari baten lerro bakoitzaren informazioa gordetzeko klasea (produktuak, kopuruak eta prezioak barne).
 */
public class Eskari_lerro {

    private int id_eskari;
    private int id_lerro;
    private int id_produktu;
    private int kopurua;
    private double salneurria;
    
    /**
     * Eskari_lerro klasearen konstruktore lehenetsia.
     */
    public Eskari_lerro() {
    }

    /**
     * Eskari_lerro klasearen konstruktorea parametroekin.
     *
     * @param id_eskari    Eskariaren IDa
     * @param id_lerro     Lerroaren IDa
     * @param id_produktu  Produktuaren IDa
     * @param kopurua      Produktuaren kopurua
     * @param salneurria   Produktuaren salneurria
     */
    public Eskari_lerro(int id_eskari, int id_lerro, int id_produktu, int kopurua, double salneurria) {
        this.id_eskari = id_eskari;
        this.id_lerro = id_lerro;
        this.id_produktu = id_produktu;
        this.kopurua = kopurua;
        this.salneurria = salneurria;
    }

    /**
     * Eskari lerroaren informazioa testu moduan itzultzen du.
     *
     * @return Eskari lerroaren informazioa
     */
    @Override
    public String toString() {
        return "Eskari_lerro [ID Eskari: " + id_eskari + ", ID Lerro: " + id_lerro + ", ID Produktu: " + id_produktu
                + ", Kopurua: " + kopurua + ", Salneurria: " + salneurria + "]";
    }
}