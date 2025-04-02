package com.gamestop.model.product;

/**
 * Inbentario klaseak inbentario osoaren informazioa gordetzen du.
 */
public class Inbentario {

    private int id_produktu;
    private int id_biltegi;
    private int kopurua;

	public Inbentario() {
	}
	
    /**
     * Inbentario klasearen konstruktorea.
     *
     * @param id_produktu Produktuaren IDa
     * @param id_biltegi  Biltegiaren IDa
     * @param kopurua     Produktuaren kopurua
     */
    public Inbentario(int id_produktu, int id_biltegi, int kopurua) {
        this.id_produktu = id_produktu;
        this.id_biltegi = id_biltegi;
        this.kopurua = kopurua;
    }

    /**
     * Inbentarioaren informazioa testu moduan itzultzen du.
     *
     * @return Inbentarioaren informazioa
     */
    @Override
    public String toString() {
        return "Inbentario [ID Produktu: " + id_produktu + ", ID Biltegi: " + id_biltegi + ", Kopurua: " + kopurua + "]";
    }
}