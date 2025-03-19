package Aplikazioa;

public class Bezero extends Erabiltzaile {
	
		//ATRIBUTOAK
		private String helbidea;
		
		
		//KONSTRUKTOREA
		
		public Bezero() {
			
		}

	    public Bezero(int id, String izena, String abizena, String telefonoa, String erabiltzailea, String pasahitza,
				String helbidea) {
			super(id, izena, abizena, telefonoa, erabiltzailea, pasahitza);
			this.helbidea = helbidea;
		}




		// GETTERS ETA SETTERS
	   
	    /**
	     * Bezeroaren helbidea lortzeko metodoa.
	     * 
	     * @return Bezeroaren helbidea.
	     */
	    public String getHelbidea() {
	        return this.helbidea;
	    }

	    /**
	     * Bezeroaren helbidea aldatzeko metodoa.
	     * 
	     * @param helbidea Bezeroaren helbidea berria.
	     */
	    public void setHelbidea(String helbidea) {
	        this.helbidea = helbidea;
	    }

	   
	    /**
	     * Bezeroaren datuen kateatua itzultzen du,
	     *
	     * @return Bezeroaren datuak
	     */
	    
	    @Override
		public String toString() {
			return String.format("%-5d %-20s %-30s %-10.2f %-10.2f %-5d",
		            getId(), getIzena(), getAbizena(), getTelefonoa(), getErabiltzailea(), getPasahitza(),getHelbidea());
		}
		
	   
	    
		
	}

