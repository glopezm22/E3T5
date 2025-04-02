package com.gamestop.model.order;

import java.time.LocalDate;

/**
 * Eskari klaseak eskaeren informazioa gordetzen du.
 */
public class Eskari {

    private int id;
    private int id_bezero;
    private int id_egoera;
    private int id_saltzaile;
    private LocalDate eskaera_data;

	public Eskari() {
	}
	
    /**
     * Eskari klasearen konstruktorea.
     *
     * @param id            Eskariaren IDa
     * @param id_bezero     Bezeroaren IDa
     * @param id_egoera     Eskariaren egoeraren IDa
     * @param id_saltzaile  Saltzailearen IDa
     * @param eskaera_data  Eskariaren data
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