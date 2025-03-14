package erronka.DB;

/**
 * Saltzaile klaseak saltzaileen informazioa gordetzen du.
 */
public class Saltzaile extends Langile {

    private String erabiltzailea;
    private String pasahitza;

	public Saltzaile() {
	}
	
    /**
     * Saltzaile klasearen konstruktorea.
     *
     * @param id            Saltzailearen IDa
     * @param erabiltzailea Saltzailearen erabiltzailea
     * @param pasahitza     Saltzailearen pasahitza
     */
    public Saltzaile(int id, String erabiltzailea, String pasahitza) {
        super(id, null, null, null, null, null, 0, 0);
        this.erabiltzailea = erabiltzailea;
        this.pasahitza = pasahitza;
    }

    /**
     * Saltzailearen informazioa testu moduan itzultzen du.
     *
     * @return Saltzailearen informazioa
     */
    @Override
    public String toString() {
        return "Saltzaile [ID: " + super.getId() + ", Erabiltzailea: " + erabiltzailea + ", Pasahitza: " + pasahitza + "]";
    }
}