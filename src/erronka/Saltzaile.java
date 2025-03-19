package Aplikazioa;

public class Saltzaile extends Erabiltzaile{

	private String kontratazioData;
	private int idNagusi;
	
	//KONSTRUKTORE HUTSA
	public Saltzaile() {
		
	}

	//KONSTRUKTOREA KLASE NAGUSITIK HEDATZEN DITUEN ATRIBUTOAK GEHI SALTZAILE KLASEA DITUEN ATRIBUTOAK
	public Saltzaile(int id, String izena, String abizena, String telefonoa, String erabiltzailea, String pasahitza,
			String kontratazioData, int idNagusi) {
		super(id, izena, abizena, telefonoa, erabiltzailea, pasahitza);
		this.kontratazioData = kontratazioData;
		this.idNagusi = idNagusi;
	}
	
	//GETTERS ETA SETTERS

	public String getKontratazioData() {
		return kontratazioData;
	}

	public void setKontratazioData(String kontratazioData) {
		this.kontratazioData = kontratazioData;
	}

	public int getIdNagusi() {
		return idNagusi;
	}

	public void setIdNagusi(int idNagusi) {
		this.idNagusi = idNagusi;
	}
	
	
	@Override
	public String toString() {
		return String.format("%-5d %-20s %-30s %-10.2f %-10.2f %-5d",
	            getId(), getIzena(), getAbizena(), getTelefonoa(), getErabiltzailea(), getPasahitza(), getKontratazioData(), getIdNagusi());
	}
	
}
