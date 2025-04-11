package com.gamestop.model.order;

import java.time.LocalDate;

/**
 * Eskaeren informazioa gordetzeeko klasea.
 */
public class Eskari {

    private int id;
    private int id_bezero;
    private int id_egoera;
    private int id_saltzaile;
    private LocalDate eskaera_data;

    /**
     * Eskari klasearen konstruktore lehenetsia.
     */
	public Eskari() {
	}
	
	/**
     * Eskari klasearen konstruktorea parametroekin.
     *
     * @param id            Eskariaren identifikazio zenbakia
     * @param id_bezero     Eskaria egiten duen bezeroaren IDa
     * @param id_egoera     Eskariaren uneko egoeraren IDa
     * @param id_saltzaile  Eskariaren kudeatzen duen saltzailearen IDa
     * @param eskaera_data  Eskaria egiteko data zehatza
     */
    public Eskari(int id, int id_bezero, int id_egoera, int id_saltzaile, LocalDate eskaera_data) {
        this.id = id;
        this.id_bezero = id_bezero;
        this.id_egoera = id_egoera;
        this.id_saltzaile = id_saltzaile;
        this.eskaera_data = eskaera_data;
    }

    /**
     * Eskariaren informazioa testu moduan itzultzen du.
     *
     * @return Eskariaren informazioa
     */
    @Override
    public String toString() {
        return "Eskari [ID: " + id + ", ID Bezero: " + id_bezero + ", ID Egoera: " + id_egoera + ", ID Saltzaile: "
                + id_saltzaile + ", Eskaera data: " + eskaera_data + "]";
    }
}