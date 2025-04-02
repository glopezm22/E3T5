package com.gamestop.model.user;

/**
 * Erabiltzaile klaseak erabiltzaileen informazioa gordetzen du.
 */
public class Erabiltzaile {
    private String id;
    private String izena;
    private String abizena;
    private String emaila;
    private String erabiltzailea;
    private String pasahitza;
    private String mota;
    
    /**
     * Erabiltzaile klasearen konstruktorea.
     * @param id
     * @param izena
     * @param abizena
     * @param emaila
     * @param erabiltzailea
     * @param pasahitza
     * @param mota
     */
    public Erabiltzaile(String id, String izena, String abizena, String emaila, String erabiltzailea, String pasahitza, String mota) {
        this.id = id;
        this.izena = izena;
        this.abizena = abizena;
        this.emaila = emaila;
        this.erabiltzailea = erabiltzailea;
        this.pasahitza = pasahitza;
        this.mota = mota;
    }

    public String getId() {
        return id;
    }

    public String getIzena() {
        return izena;
    }

    public String getAbizena() {
        return abizena;
    }
    
	public String getEmaila() {
		return emaila;
	}
	
    public String getErabiltzailea() {
        return erabiltzailea;
    }
    
	public String getPasahitza() {
        return pasahitza;
    }

    public String getMota() {
        return mota;
    }
    
    @Override
    public String toString() {
        return izena + " " + abizena + " (" + mota + ")";
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Erabiltzaile erabiltzailea = (Erabiltzaile) o;
        return id == erabiltzailea.id;
    }
}