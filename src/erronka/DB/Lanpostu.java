package erronka.DB;

/**
 * Lanpostu klaseak lanpostuen informazioa gordetzen du.
 */
public class Lanpostu {

    private int id;
    private String deskribapena;

	public Lanpostu() {
	}
	
    /**
     * Lanpostu klasearen konstruktorea.
     *
     * @param id            Lanpostuaren IDa
     * @param deskribapena  Lanpostuaren deskribapena
     */
    public Lanpostu(int id, String deskribapena) {
        this.id = id;
        this.deskribapena = deskribapena;
    }

    /**
     * Lanpostuaren informazioa testu moduan itzultzen du.
     *
     * @return Lanpostuaren informazioa
     */
    @Override
    public String toString() {
        return "Lanpostu [ID: " + id + ", Deskribapena: " + deskribapena + "]";
    }
}