package erronka.DB;

/**
 * Produktu klaseak produktuen informazioa gordetzen du.
 */
public class Produktu {

    private int id;
    private String izena;
    private String deskribapena;
    private double balioa;
    private double salneurria;
    private int id_kategoria;

    public Produktu() {
    }
    
    /**
     * Produktu klasearen konstruktorea.
     *
     * @param id            Produktuaren IDa
     * @param izena         Produktuaren izena
     * @param deskribapena  Produktuaren deskribapena
     * @param balioa        Produktuaren balioa
     * @param salneurria    Produktuaren salneurria
     * @param id_kategoria  Produktuaren kategoria IDa
     */
    public Produktu(int id, String izena, String deskribapena, double balioa, double salneurria, int id_kategoria) {
        this.id = id;
        this.izena = izena;
        this.deskribapena = deskribapena;
        this.balioa = balioa;
        this.salneurria = salneurria;
        this.id_kategoria = id_kategoria;
    }

    /**
     * Produktuaren informazioa testu moduan itzultzen du.
     *
     * @return Produktuaren informazioa
     */
    @Override
    public String toString() {
        return "Produktu [ID: " + id + ", Izena: " + izena + ", Deskribapena: " + deskribapena + ", Balioa: " + balioa
                + ", Salneurria: " + salneurria + ", ID Kategoria: " + id_kategoria + "]";
    }
}