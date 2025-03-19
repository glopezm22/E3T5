package Aplikazioa;

/**
 * EskariLerro klaseak eskari baten lerroaren informazioa gordetzeko erabiltzen da.
 * Klase honek eskari lerroaren atributuak eta hauek manipulatzen dituzten metodoak eskaintzen ditu.
 */

public class EskariLerro {
	
	//ATRIBUTOAK
	private int idEskari;
	private int idLerro;
	private int idProduktu;
	private int kopurua;
	private int salneurria;
	
	//KONSTRUKTOREA

	public EskariLerro() {
		
	}
	
	/**
	 * EskariLerro objektu bat sortzeko konstruktorea.
	 * 
	 * @param idEskari Eskariaren identifikatzailea
	 * @param idLerro Eskari lerroaren identifikatzailea
	 * @param idProduktu Produktuaren identifikatzailea
	 * @param kopurua Eskariko produktuen kopurua
	 * @param salneurria Produktuaren salneurria
	 */

	public EskariLerro(int idEskari, int idLerro, int idProduktu, int kopurua, int salneurria) {
		this.idEskari = idEskari;
		this.idLerro = idLerro;
		this.idProduktu = idProduktu;
		this.kopurua = kopurua;
		this.salneurria = salneurria;
	}

	
	// GETTERS ETA SETTERS
	/**
	 * Eskariaren identifikatzailea eskuratzeko metodoa.
	 * 
	 * @return Eskariaren identifikatzailea
	 */
	public int getIdEskari() {
		return idEskari;
	}

	/**
	 * Eskariaren identifikatzailea ezartzeko metodoa.
	 * 
	 * @param idEskari Eskariaren identifikatzailea
	 */
	public void setIdEskari(int idEskari) {
		this.idEskari = idEskari;
	}

	/**
	 * Eskari lerroaren identifikatzailea eskuratzeko metodoa.
	 * 
	 * @return Eskari lerroaren identifikatzailea
	 */
	public int getIdLerro() {
		return idLerro;
	}

	/**
	 * Eskari lerroaren identifikatzailea ezartzeko metodoa.
	 * 
	 * @param idLerro Eskari lerroaren identifikatzailea
	 */
	public void setIdLerro(int idLerro) {
		this.idLerro = idLerro;
	}

	/**
	 * Produktuaren identifikatzailea eskuratzeko metodoa.
	 * 
	 * @return Produktuaren identifikatzailea
	 */
	public int getIdProduktu() {
		return idProduktu;
	}

	/**
	 * Produktuaren identifikatzailea ezartzeko metodoa.
	 * 
	 * @param idProduktu Produktuaren identifikatzailea
	 */
	public void setIdProduktu(int idProduktu) {
		this.idProduktu = idProduktu;
	}

	/**
	 * Eskariko produktuen kopurua eskuratzeko metodoa.
	 * 
	 * @return Eskariko produktuen kopurua
	 */
	public int getKopurua() {
		return kopurua;
	}

	/**
	 * Eskariko produktuen kopurua ezartzeko metodoa.
	 * 
	 * @param kopurua Eskariko produktuen kopurua
	 */
	public void setKopurua(int kopurua) {
		this.kopurua = kopurua;
	}

	/**
	 * Produktuaren salneurria eskuratzeko metodoa.
	 * 
	 * @return Produktuaren salneurria
	 */
	public int getSalneurria() {
		return salneurria;
	}

	/**
	 * Produktuaren salneurria ezartzeko metodoa.
	 * 
	 * @param salneurria Produktuaren salneurria
	 */
	public void setSalneurria(int salneurria) {
		this.salneurria = salneurria;
	}
	
	/**
	 * BDeskariLerro objektuaren datuak formateatuta itzultzen dituen toString metodoa.
	 * 
	 * @return BDeskariLerro objektuaren datuak formateatuta
	 */
	
	@Override
	public String toString() {
		return String.format("%-5d %-20s %-30s %-10.2f %-10.2f %-5d",
        getIdEskari(),getIdLerro(),getIdProduktu(),getKopurua(),getSalneurria());
	}
	
	
}