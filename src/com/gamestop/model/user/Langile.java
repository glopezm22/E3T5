package com.gamestop.model.user;

import java.time.LocalDate;

/**
 * Langile klaseak langileen informazioa gordetzen du.
 */
public class Langile {

    private int id;
    private String izena;
    private String abizena;
    private String emaila;
    private String telefonoa;
    private LocalDate kontrataziodata;
    private int id_nagusi;
    private int soldata;

	public Langile() {
	}
	
    /**
     * Langile klasearen konstruktorea.
     *
     * @param id              Langilearen IDa
     * @param izena           Langilearen izena
     * @param abizena         Langilearen abizena
     * @param emaila          Langilearen emaila
     * @param telefonoa       Langilearen telefonoa
     * @param kontrataziodata Langilearen kontratazio data
     * @param id_nagusi       Langilearen nagusiaren IDa
     * @param soldata         Langilearen soldata
     */
    public Langile(int id, String izena, String abizena, String emaila, String telefonoa, LocalDate kontrataziodata, int id_nagusi, int soldata) {
        this.id = id;
        this.izena = izena;
        this.abizena = abizena;
        this.emaila = emaila;
        this.telefonoa = telefonoa;
        this.kontrataziodata = kontrataziodata;
        this.id_nagusi = id_nagusi;
        this.soldata = soldata;
    }
    
    public int getId() {
        return id;
    }

    /**
     * Langilearen informazioa testu moduan itzultzen du.
     *
     * @return Langilearen informazioa
     */
    @Override
    public String toString() {
        return "Langile [ID: " + id + ", Izena: " + izena + ", Abizena: " + abizena + ", Emaila: " + emaila + ", Telefonoa: "
                + telefonoa + ", Kontratazio data: " + kontrataziodata + ", ID Nagusi: " + id_nagusi + ", Soldata: " + soldata + "]";
    }
}