package Aplikazioa;

/**
 * Inbentario klaseak biltegiko produktuen informazioa gordetzen du.
 * Produktu bakoitzak produktuen ID-a, biltegiaren ID-a eta kopurua dauka.
 */
public class Inbentario {
	//ATRIBUTOAK
		private int idProduktu;
		private int idBiltegi;
		private int kopurua;
		
		//KONSTRUKTOREA
		
		public Inbentario() {
			
		}
		/**
		 * Inbentario objektu berri bat sortzen du, produktuaren ID-a, biltegiaren ID-a eta kopurua jasota.
		 * 
		 * @param idProduktu Produktuaren identifikadorea.
		 * @param idBiltegi Biltegiaren identifikadorea.
		 * @param kopurua Produktuaren kopurua biltegi honetan.
		 */

		public Inbentario(int idProduktu, int idBiltegi, int kopurua) {
			this.idProduktu = idProduktu;
			this.idBiltegi = idBiltegi;
			this.kopurua = kopurua;
		}
		
		// GETTERS ETA SETTERS
		/**
		 * Produktuaren identifikadorea lortzeko metodoa.
		 * 
		 * @return Produktuaren identifikadorea.
		 */
		public int getIdProduktu() {
			return idProduktu;
		}

		/**
		 * Produktuaren identifikadorea ezartzeko metodoa.
		 * 
		 * @param idProduktu Produktuaren identifikadorea.
		 */
		public void setIdProduktu(int idProduktu) {
			this.idProduktu = idProduktu;
		}

		/**
		 * Biltegiaren identifikadorea lortzeko metodoa.
		 * 
		 * @return Biltegiaren identifikadorea.
		 */
		public int getIdBiltegi() {
			return idBiltegi;
		}

		/**
		 * Biltegiaren identifikadorea ezartzeko metodoa.
		 * 
		 * @param idBiltegi Biltegiaren identifikadorea.
		 */
		public void setIdBiltegi(int idBiltegi) {
			this.idBiltegi = idBiltegi;
		}

		/**
		 * Produktuaren kopurua biltegi honetan lortzeko metodoa.
		 * 
		 * @return Produktuaren kopurua.
		 */
		public int getKopurua() {
			return kopurua;
		}

		/**
		 * Produktuaren kopurua biltegi honetan ezartzeko metodoa.
		 * 
		 * @param kopurua Produktuaren kopurua biltegi honetan.
		 */
		public void setKopurua(int kopurua) {
			this.kopurua = kopurua;
		}
		
		/**
		 * Objektuaren datuak itzultzen ditu formatu testu batean.
		 * 
		 * @return Objektuaren datuak testu moduan (produktuen ID, biltegiaren ID eta kopurua).
		 */

		@Override
		public String toString() {
			return String.format(" %-10d %-10d %-10d", 
            getIdProduktu(), getIdBiltegi(), getKopurua());		
			}
		
}
