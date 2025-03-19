package Aplikazioa;

import java.util.ArrayList;

public class BDbezero {
private ArrayList<Bezero> bezeroak;
	
	/**
     * BDbezero objektuaren konstruktorra, bezeroen zerrenda hutsik hasteko.
     */
	    public BDbezero() {
	    	this.bezeroak = new ArrayList<>();
	    }

	    /**
     * BDbezero objektuaren konstruktorra, bezeroen zerrenda emandako baten bidez hasteko.
     * 
     * @param bezeroak BDbezero objektuari emandako bezeroen zerrenda
     */
	    public BDbezero(ArrayList<Bezero> bezeroak) {
	        this.bezeroak = bezeroak;
	    }
	 
	    //GETTERS ETA SETTERS
	    /**
     * Bezeroen zerrenda eskuratzeko metodoa.
     * 
     * @return bezeroak BDbezero objektuaren bezeroen zerrenda
     */
    public ArrayList<Bezero> getBezeroak() {
        return bezeroak;
    }

    /**
     * Bezeroen zerrenda aldatzeko metodoa.
     * 
     * @param bezeroak BDbezero objektuaren bezeroen zerrenda berria
     */
    public void setBezeroak(ArrayList<Bezero> bezeroak) {
        this.bezeroak = bezeroak;
    }

    
	//METODOAK

	/**
	     * BDbezero bezero berri bat zerrendara gehitzen du.
	     * Mezua inprimatzen du, bezeroa zerrendara gehitu dela adierazteko.
	     *
	     * @param bezero BDbezero bezeroa gehitzeko
	     */

		public void bezeroGehitu(Bezero bezero) {
			this.bezeroak.add(bezero);
		  }
}
