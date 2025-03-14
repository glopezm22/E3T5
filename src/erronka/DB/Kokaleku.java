package erronka.DB;

/**
 * Kokaleku klaseak kokalekuen informazioa gordetzen du.
 */
public class Kokaleku {

    private int id;
    private String helbidea;
    private String postakodea;
    private String udalerria;
    private String probintzia;
    private String id_herrialde;

	public Kokaleku() {
	}
	
    /**
     * Kokaleku klasearen konstruktorea.
     *
     * @param id           Kokalekuaren IDa
     * @param helbidea     Kokalekuaren helbidea
     * @param postakodea   Kokalekuaren postakodea
     * @param udalerria     Kokalekuaren udalerria
     * @param probintzia   Kokalekuaren probintzia
     * @param id_herrialde Kokalekuaren herrialdearen IDa
     */
    public Kokaleku(int id, String helbidea, String postakodea, String udalerria, String probintzia,
            String id_herrialde) {
        this.id = id;
        this.helbidea = helbidea;
        this.postakodea = postakodea;
        this.udalerria = udalerria;
        this.probintzia = probintzia;
        this.id_herrialde = id_herrialde;
    }

    /**
     * Kokalekuaren informazioa testu moduan itzultzen du.
     *
     * @return Kokalekuaren informazioa
     */
    @Override
    public String toString() {
        return "Kokaleku [ID: " + id + ", Helbidea: " + helbidea + ", Postakodea: " + postakodea + ", Udalerria: "
                + udalerria + ", Probintzia: " + probintzia + ", ID Herrialde: " + id_herrialde + "]";
    }
}