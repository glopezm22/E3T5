package Aplikazioa;

import java.util.ArrayList;
import java.util.List;

public class BDeskariLerro {
	/**
	 * BDeskariLerro klaseak eskari lerroen datu-basearen kudeaketa egiten du.
	 */
	
		//ATRIBUTOAK
		private List<EskariLerro> eskariLerroak = new ArrayList<>();
		
		//KONSTRUKTOREA
		/**
	     * BDeskariLerro objektu bat sortzen du, eskari lerroak zerrenda hutsarekin.
	     */
	    public BDeskariLerro() {
	        this.eskariLerroak = new ArrayList<>();
	    }

	    /**
	     * BDeskariLerro objektu bat sortzen du, eskatutako eskari lerroak zerrenda batekin.
	     * 
	     * @param eskariLerroak EskariLerro objektuen zerrenda, BDeskariLerro objektuari emango zaiona.
	     */
	    public BDeskariLerro(List<EskariLerro> eskariLerroak) {
	        this.eskariLerroak = eskariLerroak;
	    }

	    // GETTERS ETA SETTERS

	    /**
	     * Eskari lerroak lortzeko metodoa.
	     * 
	     * @return EskariLerro objektuen zerrenda.
	     */
	    public List<EskariLerro> getEskariLerroak() {
	        return eskariLerroak;
	    }

	    /**
	     * Eskari lerroak ezartzeko metodoa.
	     * 
	     * @param eskariLerroak EskariLerro objektuen zerrenda, BDeskariLerro objektuari esleituko zaiona.
	     */
	    public void setEskariLerroak(List<EskariLerro> eskariLerroak) {
	        this.eskariLerroak = eskariLerroak;
	    }

	    // METODOAK

	    /**
	     * Eskari lerro berri bat gehitzen du eskariLerroak zerrendara.
	     * 
	     * @param eskariLerro Gehitu nahi den EskariLerro objektua.
	     */
			public void eskariLerroGehitu(EskariLerro eskariLerro) {
				 eskariLerroak.add(eskariLerro);
			}
}
