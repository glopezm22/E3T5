package erronka.DB;

/**
 * Bulegari klaseak bulegari baten informazioa gordetzen du, langileekin eta lanpostuekin erlazionatuz.
 */
public class Bulegari extends Langile {

    private int id_lanpostu;

    public Bulegari() {
    }
    
    /**
     * Bulegari klasearen konstruktorea.
     *
     * @param id          Bulegariaren IDa
     * @param id_lanpostu Bulegariaren lanpostuaren IDa
     */
    public Bulegari(int id, int id_lanpostu) {
    	super(id, null, null, null, null, null, 0, 0);
        this.id_lanpostu = id_lanpostu;
    }

    /**
     * Bulegariaren informazioa testu moduan itzultzen du.
     *
     * @return Bulegariaren informazioa
     */
    @Override
    public String toString() {
        return "Bulegari [ID: " + super.getId() + ", ID Lanpostu: " + id_lanpostu + "]";
    }
}