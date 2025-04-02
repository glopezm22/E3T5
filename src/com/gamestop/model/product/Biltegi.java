package com.gamestop.model.product;

/**
 * Biltegi klaseak biltegien informazioa gordetzen du, kokalekuekin erlazionatuz.
 */
public class Biltegi {

    private int id;
    private String izena;
    private int id_kokaleku;

	public Biltegi() {
	}
	
    /**
     * Biltegi klasearen konstruktorea.
     *
     * @param id          Biltegiaren IDa
     * @param izena       Biltegiaren izena
     * @param id_kokaleku Biltegiaren kokalekuaren IDa
     */
    public Biltegi(int id, String izena, int id_kokaleku) {
        this.id = id;
        this.izena = izena;
        this.id_kokaleku = id_kokaleku;
    }

    /**
     * Biltegiaren informazioa testu moduan itzultzen du.
     *
     * @return Biltegiaren informazioa
     */
    @Override
    public String toString() {
        return "Biltegi [ID: " + id + ", Izena: " + izena + ", ID Kokaleku: " + id_kokaleku + "]";
    }
}