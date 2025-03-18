package erronka.DB;

import java.util.ArrayList;
import java.util.List;

public class DBProduktu {

    private List<Produktu> produktuak;

    public DBProduktu() {
        this.produktuak = new ArrayList<>();
    }

    public DBProduktu(List<Produktu> produktuak) {
        if (produktuak == null) {
            throw new IllegalArgumentException("Produktuak zerrenda ezin da nulua izan.");
        }
        this.produktuak = new ArrayList<>(produktuak);
    }

    public List<Produktu> getProduktuak() {
        return new ArrayList<>(produktuak);
    }

    public void setProduktuak(List<Produktu> produktuak) {
        if (produktuak == null) {
            throw new IllegalArgumentException("Produktuak zerrenda ezin da nulua izan.");
        }
        this.produktuak = new ArrayList<>(produktuak);
    }

    public void gehituProduktua(Produktu produktua) {
        if (produktua == null) {
            throw new IllegalArgumentException("Produktua ezin da nulua izan.");
        }
        this.produktuak.add(produktua);
    }

    public void ezabatuProduktua(Produktu produktua) {
        if (produktua == null) {
            throw new IllegalArgumentException("Produktua ezin da nulua izan.");
        }
        if (!this.produktuak.remove(produktua)) {
            throw new IllegalArgumentException("Produktua ez dago zerrendan.");
        }
    }
}