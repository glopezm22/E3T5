package erronka;

import java.util.ArrayList;
import java.util.List;

public class BDproduktu {
	private List<Produktu> produktuak = new ArrayList<>();

		//KOSNTRUKTOREA
		
	    /**
	     * Konstruktore hutsa. Produktuen zerrenda hutsik hasten da.
	     */
		public BDproduktu() {
			this.produktuak = new ArrayList<>();
		}
		
	    /**
	     * Produktuen zerrenda jakin batekin hasten den konstruktorea.
	     * 
	     * @param produktuak Hasierako produktuen zerrenda.
	     */
		public BDproduktu(List<Produktu> produktuak) {
			this.produktuak = produktuak;
		}
		
		//GETETRS ETA SETTERS
	    /**
	     * Produktuen zerrenda eskuratzen du.
	     * 
	     * @return Produktuen zerrenda.
	     */
		public List<Produktu> getProduktuak() {
			return produktuak;
		}
	
	    /**
	     * Produktuen zerrenda ezartzen du.
	     * 
	     * @param produktuak Ezarri nahi den produktuen zerrenda.
	     */
		public void setProduktuak(List<Produktu> produktuak) {
			this.produktuak = produktuak;
		}
		
		
		//METODOAK
		
		/**
	     * Produktu bat gehitzeko metodoa.
	     * Produktu berri bat lista honetan gehitzen du.
	     * 
	     * @param produktu Gehitu nahi den produktua.
	     */
	
		public void produktuGehitu(Produktu produktu) {
			produktuak.add(produktu);
		}
}
