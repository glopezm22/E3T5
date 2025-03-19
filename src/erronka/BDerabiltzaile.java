package Aplikazioa;

import java.util.ArrayList;
import java.util.List;


public class BDerabiltzaile {
	private List<Erabiltzaile> erabiltzaileak = new ArrayList<>();

	//KOSNTRUKTOREA
	
    /**
     * Konstruktore hutsa. erabiltzailen zerrenda hutsik hasten da.
     */
	public BDerabiltzaile() {
		this.erabiltzaileak = new ArrayList<>();
	}
	
    /**
     * erabiltzailen zerrenda jakin batekin hasten den konstruktorea.
     * 
     * @param erabiltzaileak Hasierako erabiltzailen zerrenda.
     */
	public BDerabiltzaile(List<Erabiltzaile> erabiltzaileak) {
		this.erabiltzaileak = erabiltzaileak;
	}
	
	//GETETRS ETA SETTERS
    /**
     * erabiltzailen zerrenda eskuratzen du.
     * 
     * @return erabiltzailen zerrenda.
     */
	public List<Erabiltzaile> getErabiltzaileak() {
		return erabiltzaileak;
	}

    /**
     * erabiltzailen zerrenda ezartzen du.
     * 
     * @param erabiltzaileak Ezarri nahi den erabiltzailen zerrenda.
     */
	public void setErabiltzaileak(List<Erabiltzaile> erabiltzaileak) {
		this.erabiltzaileak = erabiltzaileak;
	}
	
	
	//METODOAK
	
	/**
     * Erabiltzaile bat gehitzeko metodoa.
     * Erabiltzaile berri bat lista honetan gehitzen du.
     * 
     * @param erabiltzaileak Gehitu nahi den erabiltzailea.
     */

	public void produktuGehitu(Erabiltzaile erabiltzaile) {
		erabiltzaileak.add(erabiltzaile);
	}
}
