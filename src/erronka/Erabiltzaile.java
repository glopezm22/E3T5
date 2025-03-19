package Aplikazioa;

public class Erabiltzaile {
	
	//ATRIBUTOAK
	protected int id;
	protected String izena;
	protected String abizena;
	protected String telefonoa;
	protected String erabiltzailea;
	protected String pasahitza;
	
	//KONSTRUKTOREA HUTSIK
	
	public Erabiltzaile() {
		
	}
	
	//KONSTRUKTOREA BALIOEKIN
	public Erabiltzaile(int id, String izena,String abizena,String telefonoa,String erabiltzailea,String pasahitza) {
			this.id = id;
			this.izena = izena;
			this.abizena = abizena;
			this.telefonoa = telefonoa;
			this.erabiltzailea = erabiltzailea;
			this.pasahitza = pasahitza;
			
		}

	//GETTERS ETA SETTERS
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIzena() {
		return izena;
	}

	public void setIzena(String izena) {
		this.izena = izena;
	}

	public String getAbizena() {
		return abizena;
	}

	public void setAbizena(String abizena) {
		this.abizena = abizena;
	}

	public String getTelefonoa() {
		return telefonoa;
	}

	public void setTelefonoa(String telefonoa) {
		this.telefonoa = telefonoa;
	}

	public String getErabiltzailea() {
		return erabiltzailea;
	}

	public void setErabiltzailea(String erabiltzailea) {
		this.erabiltzailea = erabiltzailea;
	}

	public String getPasahitza() {
		return pasahitza;
	}

	public void setPasahitza(String pasahitza) {
		this.pasahitza = pasahitza;
	}
	
	
	//ToString
	
	@Override
	public String toString() {
		return String.format("%-5d %-20s %-30s %-10.2f %-10.2f %-5d",
	            getId(), getIzena(), getAbizena(), getTelefonoa(), getErabiltzailea(), getPasahitza());
	}
	
}
