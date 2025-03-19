package Aplikazioa;

import java.util.ArrayList;
import java.util.List;

/**
 * BDsaltzaile klaseak saltzaileen datu-basearen kudeaketa egiten du.
 * Saltzaileen zerrenda gordetzen du eta hainbat eragiketa egiteko metodoak eskaintzen ditu.
 */
public class BDsaltzaile {

	private List<Saltzaile> saltzaileak = new ArrayList<>();
	
	//KONSTRUKTOREAK
	
    /**
     * Konstruktore hutsa. Saltzaileen zerrenda hutsik hasten da.
     */
	public BDsaltzaile() {
		this.saltzaileak = new ArrayList<>();
	}

    /**
     * Saltzaileen zerrenda jakin batekin hasten den konstruktorea.
     * 
     * @param saltzaileak Hasierako saltzaileen zerrenda.
     */
	public BDsaltzaile(List<Saltzaile> saltzaileak) {
		super();
		this.saltzaileak = saltzaileak;
	}
	
	//GETERS ETA SETTRS

    /**
     * Saltzaileen zerrenda eskuratzen du.
     * 
     * @return Saltzaileen zerrenda.
     */
	public List<Saltzaile> getSaltzaileak() {
		return saltzaileak;
	}

     /**
     * Saltzaileen zerrenda ezartzen du.
     * 
     * @param saltzaileak Ezarri nahi den saltzaileen zerrenda.
     */
	public void setSaltzaileak(List<Saltzaile> saltzaileak) {
		this.saltzaileak = saltzaileak;
	}
	
	//METODOAK
	 /**
     * Saltzaile berri bat gehitzen du saltzaileen zerrendara.
     * 
     * @param saltzaile Gehitu nahi den saltzailea.
     */
    public void saltzaileGehitu(Saltzaile saltzaile) {
        saltzaileak.add(saltzaile);
    }
}
