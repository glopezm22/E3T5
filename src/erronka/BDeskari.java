package Aplikazioa;

import java.util.ArrayList;
import java.util.List;

public class BDeskari {
	/**
	 * BDeskari klaseak eskarien datu-basearen kudeaketa egiten du.
	 * Eskari bakoitzak bezeroaren ID-a, egoeraren ID-a, saltzailearen ID-a eta eskaera data dauka.
	 */

	    //ATRIBUTOAK
	   private List<Eskari> eskariak = new ArrayList<>();
	   

	   //KONSTRUKTOREA
	   
	   /**
	     * BDeskari objektu bat sortzen du, eskariak zerrenda hutsarekin.
	     */
	    public BDeskari() {
	        this.eskariak = new ArrayList<>();
	    }

	    /**
	     * BDeskari objektu bat sortzen du, eskatutako eskariak zerrenda batekin.
	     * 
	     * @param eskariak Eskari objektuen zerrenda, BDeskari objektuari emango zaiona.
	     */
	   public BDeskari(List<Eskari> eskariak) {
	       this.eskariak = eskariak;
	   }

	   //GETTERS ETA SETTERS
	   /**
	     * Eskariak lortzeko metodoa.
	     * 
	     * @return Eskari objektuen zerrenda.
	     */
	    public List<Eskari> getEskariak() {
	        return eskariak;
	    }

	    /**
	     * Eskariak ezartzeko metodoa.
	     * 
	     * @param eskariak Eskari objektuen zerrenda, BDeskari objektuari esleituko zaiona.
	     */
	    public void setEskariak(List<Eskari> eskariak) {
	        this.eskariak = eskariak;
	    }

	   
	    //METODOAK

	   /**
	    * Eskari berri bat gehitzen du eskariak zerrendara.
	    * 
	    * @param eskari Gehitu nahi den Eskari objektua.
	    */

	   public void eskariGehitu(Eskari eskari) {
	       eskariak.add(eskari);
	         
	   }
}
