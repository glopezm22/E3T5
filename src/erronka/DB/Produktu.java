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

    /**
     * Produktu klasearen konstruktorea.
     *
     * @param id            Produktuaren IDa
     * @param izena         Produktuaren izena
     * @param deskribapena  Produktuaren deskribapena (hutsa izan daiteke)
     * @param balioa        Produktuaren balioa
     * @param salneurria    Produktuaren salneurria
     * @param id_kategoria  Produktuaren kategoria IDa
     * @throws IllegalArgumentException Si alguno de los parámetros es inválido.
     */
    public Produktu(int id, String izena, String deskribapena, double balioa, double salneurria, int id_kategoria) {
        if (izena == null || izena.trim().isEmpty()) {
            throw new IllegalArgumentException("Izena ezin da hutsik egon.");
        }
        if (balioa < 0) {
            throw new IllegalArgumentException("Balioa ezin da negatiboa izan.");
        }
        if (salneurria < 0) {
            throw new IllegalArgumentException("Salneurria ezin da negatiboa izan.");
        }
        if (id_kategoria < 0) {
            throw new IllegalArgumentException("Kategoria IDa ezin da negatiboa izan.");
        }

        this.id = id;
        this.izena = izena;
        this.deskribapena = deskribapena;
        this.balioa = balioa;
        this.salneurria = salneurria;
        this.id_kategoria = id_kategoria;
    }

    public int getId() {
        return id;
    }

    public String getIzena() {
        return izena;
    }

    public String getDeskribapena() {
        return deskribapena;
    }

    public double getBalioa() {
        return balioa;
    }

    public double getSalneurria() {
        return salneurria;
    }

    public int getIdKategoria() {
        return id_kategoria;
    }

    @Override
    public String toString() {
        return "Produktu [ID: " + id + ", Izena: " + izena + ", Deskribapena: " + deskribapena + ", Balioa: " + balioa
                + ", Salneurria: " + salneurria + ", ID Kategoria: " + id_kategoria + "]";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Produktu produktu = (Produktu) o;
        return id == produktu.id;
    }

    @Override
    public int hashCode() {
        return Integer.hashCode(id);
    }
}