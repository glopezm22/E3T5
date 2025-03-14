package erronka.DB;

/**
 * Bezero_telefono klaseak bezeroen telefono zenbakia gordetzen du, bezeroekin erlazionatuz.
 */
public class Bezero_telefono {

    private int id;
    private int id_bezero;
    private String zenbakia;

	public Bezero_telefono() {
	}
	
    /**
     * Bezero_telefono klasearen konstruktorea.
     *
     * @param id         Telefonoaren IDa
     * @param id_bezero  Bezeroaren IDa
     * @param zenbakia   Telefono zenbakia
     */
    public Bezero_telefono(int id, int id_bezero, String zenbakia) {
        this.id = id;
        this.id_bezero = id_bezero;
        this.zenbakia = zenbakia;
    }

    /**
     * Telefonoaren informazioa testu moduan itzultzen du.
     *
     * @return Telefonoaren informazioa
     */
    @Override
    public String toString() {
        return "Bezero_telefono [ID: " + id + ", ID Bezero: " + id_bezero + ", Tlf. zenbakia: " + zenbakia + "]";
    }
}