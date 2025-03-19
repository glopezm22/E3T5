package Aplikazioa;

/**
 * Kategoria klaseak produktuen kategoriak gordetzen ditu.
 * Kategoria bakoitzak ID bat eta izen bat dauka.
 */
public class Kategoria {
	//ATRIBUTOAK
		private int id;
		private String izena;
		
		//KONSTRUKTOREA
		
		public Kategoria() {
			
		}
		/**
		 * Kategoria klaseko objektu berri bat sortzen du, kategoriaren identifikatzailea eta izena jasota.
		 * 
		 * @param id Kategoriaren identifikatzailea.
		 * @param izena Kategoriaren izena.
		 */

		public Kategoria(int id, String izena) {
			this.id = id;
			this.izena = izena;
		}

		//GETTERS ETA SETTERS
		/**
		 * Kategoriaren identifikatzailea lortzen du.
		 * 
		 * @return Kategoriaren identifikatzailea.
		 */
		public int getId() {
			return id;
		}

		/**
		 * Kategoriaren identifikatzailea ezartzen du.
		 * 
		 * @param id Kategoriaren identifikatzailea.
		 */
		public void setId(int id) {
			this.id = id;
		}

		/**
		 * Kategoriaren izena lortzen du.
		 * 
		 * @return Kategoriaren izena.
		 */
		public String getIzena() {
			return izena;
		}

		/**
		 * Kategoriaren izena ezartzen du.
		 * 
		 * @param izena Kategoriaren izena.
		 */
		public void setIzena(String izena) {
			this.izena = izena;
		}
		
		//METODOAK
		
		/**
		 * BDkategoria objektuaren informazioa itzultzen du formateatuta.
		 * 
		 * @return Kategoriaren IDa eta izena.
		 */

		@Override
		public String toString() {
			return String.format("%-5d %-20s", getId(), getIzena());
		              
		}
}

