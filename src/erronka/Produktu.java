package Aplikazioa;

public class Produktu {
	//ATRIBUTOAK
			private int id;
			private String izena;
			private String deskribapena;
			private double balioa;
			private double salneurria;
			private int idKategoria;
			
			
			//KONSTRUKTOREA

			public Produktu() {
				
			}
			/**
		     * Produktuaren objektu bat sortzeko eraikitzailea.
		     * Eraikitzaile honek produktuen id, izena, deskribapena,
		     * balioa, salneurria eta idKategoria hasieratzen ditu.
		     * 
		     * @param id Produktuaren identifikatzailea.
		     * @param izena Produktuaren izena.
		     * @param deskribapena Produktuaren deskribapena.
		     * @param balioa Produktuaren balioa.
		     * @param salneurria Produktuaren salneurria.
		     * @param idKategoria Produktuaren kategoria identifikatzailea.
		     */

			public Produktu(int id, String izena, String deskribapena, double balioa, double salneurria, int idKategoria) {
				this.id = id;
				this.izena = izena;
				this.deskribapena = deskribapena;
				this.balioa = balioa;
				this.salneurria = salneurria;
				this.idKategoria = idKategoria;
			}


			//GETTERS ETA SETTERS
			 /**
		     * Produktuaren ID-a lortzeko metodoa.
		     * 
		     * @return Produktuaren identifikatzailea.
		     */
		    public int getId() {
		        return id;
		    }

		    /**
		     * Produktuaren ID-a ezartzeko metodoa.
		     * 
		     * @param id Produktuaren identifikatzailea.
		     */
		    public void setId(int id) {
		        this.id = id;
		    }

		    /**
		     * Produktuaren izena lortzeko metodoa.
		     * 
		     * @return Produktuaren izena.
		     */
		    public String getIzena() {
		        return izena;
		    }

		    /**
		     * Produktuaren izena ezartzeko metodoa.
		     * 
		     * @param izena Produktuaren izena.
		     */
		    public void setIzena(String izena) {
		        this.izena = izena;
		    }

		    /**
		     * Produktuaren deskribapena lortzeko metodoa.
		     * 
		     * @return Produktuaren deskribapena.
		     */
		    public String getDeskribapena() {
		        return deskribapena;
		    }

		    /**
		     * Produktuaren deskribapena ezartzeko metodoa.
		     * 
		     * @param deskribapena Produktuaren deskribapena.
		     */
		    public void setDeskribapena(String deskribapena) {
		        this.deskribapena = deskribapena;
		    }

		    /**
		     * Produktuaren balioa lortzeko metodoa.
		     * 
		     * @return Produktuaren balioa.
		     */
		    public double getBalioa() {
		        return balioa;
		    }

		    /**
		     * Produktuaren balioa ezartzeko metodoa.
		     * 
		     * @param balioa Produktuaren balioa.
		     */
		    public void setBalioa(double balioa) {
		        this.balioa = balioa;
		    }

		    /**
		     * Produktuaren salneurria lortzeko metodoa.
		     * 
		     * @return Produktuaren salneurria.
		     */
		    public double getSalneurria() {
		        return salneurria;
		    }

		    /**
		     * Produktuaren salneurria ezartzeko metodoa.
		     * 
		     * @param salneurria Produktuaren salneurria.
		     */
		    public void setSalneurria(double salneurria) {
		        this.salneurria = salneurria;
		    }

		    /**
		     * Produktuaren kategoria ID-a lortzeko metodoa.
		     * 
		     * @return Produktuaren kategoria ID-a.
		     */
		    public int getIdKategoria() {
		        return idKategoria;
		    }

		    /**
		     * Produktuaren kategoria ID-a ezartzeko metodoa.
		     * 
		     * @param idKategoria Produktuaren kategoria ID-a.
		     */
		    public void setIdKategoria(int idKategoria) {
		        this.idKategoria = idKategoria;
		    }
		    
		    //METODOAK
		    /**
		     * BDproduktu objektuaren informazio guztia itzultzen duen metodoa.
		     * Produktuaren **id**, **izena**, **deskribapena**, **balioa**,
		     * **salneurria** eta **kategoria ID** inprimatzen ditu.
		     * 
		     * @return Produktuaren informazioa **String** formatuan.
		     */

			@Override
			public String toString() {
				return String.format("%-5d %-20s %-30s %-10.2f %-10.2f %-5d",
			            getId(), getIzena(), getDeskribapena(), getBalioa(), getSalneurria(), getIdKategoria());
			}
			
	}

