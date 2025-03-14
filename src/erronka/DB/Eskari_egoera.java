package erronka.DB;

/**
 * Eskari_egoera klaseak eskaeren egoera gordetzen du.
 */
public class Eskari_egoera {

    private int id;
    private String deskribapena;
    
	public Eskari_egoera() {
	}

    /**
     * Eskari_egoera klasearen konstruktorea.
     *
     * @param id            Egoeraren IDa
     * @param deskribapena  Egoeraren deskribapena
     */
    public Eskari_egoera(int id, String deskribapena) {
        this.id = id;
        this.deskribapena = deskribapena;
    }

    /**
     * Egoeraren informazioa testu moduan itzultzen du.
     *
     * @return Egoeraren informazioa
     */
    @Override
    public String toString() {
        return "Eskari_egoera [ID: " + id + ", Deskribapena: " + deskribapena + "]";
    }
}