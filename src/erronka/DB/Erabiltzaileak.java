package erronka.DB;

public class Erabiltzaileak {
    private int id;
    private String izena;
    private String abizena;
    private String emaila;
    private String erabiltzailea;
    private String pasahitza;
    private String mota;

    public Erabiltzaileak(int id, String izena, String abizena, String emaila, String erabiltzailea, String pasahitza, String mota) {
        this.id = id;
        this.izena = izena;
        this.abizena = abizena;
        this.emaila = emaila;
        this.erabiltzailea = erabiltzailea;
        this.pasahitza = pasahitza;
        this.mota = mota;
    }

    public int getId() {
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
}