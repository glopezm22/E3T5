package Aplikazioa;

import java.util.ArrayList;
import java.util.List;

/**
 * BDinbentario klaseak produktuen inbentarioaren datu-basea kudeatzen du.
 * Inbentarioaren zerrenda gordetzen du eta hainbat funtzionalitate eskaintzen ditu.
 */

public class BDinbentario {
	//ATRIBUTOAK
		private List <Inbentario> inbentarioak = new ArrayList<>();
		
		//KONSTRUKTOREA
		  /**
		 * Konstruktore hutsa. Inbentarioen zerrenda hutsik hasten da.
		 */
		public BDinbentario() {
			this.inbentarioak = new ArrayList<>();
		}

		/**
		 * Inbentarioen zerrenda zehatz batekin hasten den konstruktorea.
		 * 
		 * @param inbentarioak Hasierako inbentarioen zerrenda.
		 */
		public BDinbentario(List<Inbentario> inbentarioak) {
			this.inbentarioak = inbentarioak;
		}

		
		//GETTERS ETA SETTERS
		  /**
		 * Inbentarioen zerrenda eskuratzen du.
		 * 
		 * @return Inbentarioen zerrenda.
		 */
		public List<Inbentario> getInbentarioak() {
			return inbentarioak;
		}

		/**
		 * Inbentarioen zerrenda ezartzen du.
		 * 
		 * @param inbentarioak Ezarri nahi den inbentarioen zerrenda.
		 */
		public void setInbentarioak(List<Inbentario> inbentarioak) {
			this.inbentarioak = inbentarioak;
		}
		
		//METODOAK

		/**
		 * Inbentario berri bat gehitzen du inbentarioen zerrendara.
		 * 
		 * @param inbentario Gehitu nahi den BDinbentario objektua.
		 */

		public void inbentarioGehitu(Inbentario inbentario) {
			inbentarioak.add(inbentario);
		}
}
