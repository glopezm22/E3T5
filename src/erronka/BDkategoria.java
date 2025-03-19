package Aplikazioa;

import java.util.ArrayList;
import java.util.List;

/**
 * BDkategoria klaseak kategoriak kudeatzeko datu-basea maneiatzen du.
 * Kategoriak gordetzen ditu eta hainbat eragiketa egiteko metodoak eskaintzen ditu.
 */
public class BDkategoria {
	//ATRIBUTOAK
		private List <Kategoria> kategoriak = new ArrayList<>();
		
		//KONSTRUKTOREA
		
		 /**
		 * Konstruktore hutsa. Kategoriak zerrenda hutsik hasten da.
		 */
		public BDkategoria() {
			this.kategoriak =  new ArrayList<>();
		}
		
		 /**
		 * Kategoriak zerrenda jakin batekin hasten den konstruktorea.
		 * 
		 * @param kategoriak Hasierako kategoriak zerrenda.
		 */
		public BDkategoria(List<Kategoria> kategoriak) {
			this.kategoriak = kategoriak;
		}


		//GETTERS ETA SETTERS
		
		/**
		 * Kategoriak zerrenda eskuratzen du.
		 * 
		 * @return Kategoriak zerrenda.
		 */
		public List<Kategoria> getKategoriak() {
			return kategoriak;
		}

		/**
		 * Kategoriak zerrenda ezartzen du.
		 * 
		 * @param kategoriak Ezarri nahi den kategoriak zerrenda.
		 */
		public void setKategoriak(List<Kategoria> kategoriak) {
			this.kategoriak = kategoriak;
		}
		
		//METODOAK
	    /**
		 * Kategoria berri bat gehitzen du kategoriak zerrendara.
		 * 
		 * @param kategoria Gehitu nahi den kategoria.
		 */

		public void katgoriaGehitu(Kategoria kategoria) {
			kategoriak.add(kategoria);
		}
}
