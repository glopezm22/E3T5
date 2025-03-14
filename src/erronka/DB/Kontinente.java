package erronka.DB;

/**
 * Kontinente klaseak kontinenteen informazioa gordetzen du.
 */
public class Kontinente {

    private int id;
    private String izena;

    public Kontinente() {
    }
    
    /**
     * Kontinente klasearen konstruktorea.
     *
     * @param id    Kontinentearen IDa
     * @param izena Kontinentearen izena
     */
    public Kontinente(int id, String izena) {
        this.id = id;
        this.izena = izena;
    }

    /**
     * Kontinentearen informazioa testu moduan itzultzen du.
     *
     * @return Kontinentearen informazioa
     */
    @Override
    public String toString() {
        return "Kontinente [ID: " + id + ", Izena: " + izena + "]";
    }
}