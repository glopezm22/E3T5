package Aplikazioa;
import java.util.Date;
/**
 * Eskari klaseak eskaera baten datuak kudeatzen ditu.
 * <p>
 * Klase honek eskaeraren identifikatzailea, bezeroaren identifikatzailea, egoeraren identifikatzailea, saltzailearen 
 * identifikatzailea eta eskaera egindako data gorde eta kudeatzen ditu. Horretaz gain, eskaeren datuak lortu eta aldatu 
 * ahal izateko metodoak eskaintzen ditu.
 * </p>
 */
public class Eskari {
    //ATRIBUTOAK
    private int id;
    private int idBezero;
    private int idEgoera;
    private int idSaltzaile;
    private Date eskaeraData;

    //KONSTRUKTOREA
    
    public Eskari() {
    	
    }
    /**
     * Eskari objektu bat sortzen du, eskaeraren datuak hasieratuz.
     * <p>
     * Klase honek eskaera berri bat sortzen du eta eskaeraren atributuak hasieratzen ditu.
     * </p>
     * 
     * @param id Eskariaren identifikatzailea
     * @param idBezero Eskariaren bezeroaren identifikatzailea
     * @param idEgoera Eskariaren egoeraren identifikatzailea
     * @param idSaltzaile Eskariaren saltzailearen identifikatzailea
     * @param eskaeraData Eskariaren data
     */

    public Eskari( int id, int idBezero, int idEgoera, int idSaltzaile, Date eskaeraData) {
        this.id = id;
        this.idBezero = idBezero;
        this.idEgoera = idEgoera;
        this.idSaltzaile = idSaltzaile;
        this.eskaeraData = eskaeraData;
    }

    //GETTERS ETA SETTERS
     /**
     * Eskariaren identifikatzailea itzultzen du.
     * 
     * @return Eskariaren id
     */
    public int getId() {
        return this.id;
    }

    /**
     * Eskariaren identifikatzailea ezartzen du.
     * 
     * @param id Eskariaren id berria
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Eskariaren bezeroaren identifikatzailea itzultzen du.
     * 
     * @return Eskariaren bezeroaren id
     */
    public int getIdBezero() {
        return this.idBezero;
    }

    /**
     * Eskariaren bezeroaren identifikatzailea ezartzen du.
     * 
     * @param idBezero Eskariaren bezeroaren id berria
     */
    public void setIdBezero(int idBezero) {
        this.idBezero = idBezero;
    }

    /**
     * Eskariaren egoeraren identifikatzailea itzultzen du.
     * 
     * @return Eskariaren egoeraren id
     */
    public int getIdEgoera() {
        return this.idEgoera;
    }

    /**
     * Eskariaren egoeraren identifikatzailea ezartzen du.
     * 
     * @param idEgoera Eskariaren egoeraren id berria
     */
    public void setIdEgoera(int idEgoera) {
        this.idEgoera = idEgoera;
    }

    /**
     * Eskariaren saltzailearen identifikatzailea itzultzen du.
     * 
     * @return Eskariaren saltzailearen id
     */
    public int getIdSaltzaile() {
        return this.idSaltzaile;
    }

    /**
     * Eskariaren saltzailearen identifikatzailea ezartzen du.
     * 
     * @param idSaltzaile Eskariaren saltzailearen id berria
     */
    public void setIdSaltzaile(int idSaltzaile) {
        this.idSaltzaile = idSaltzaile;
    }

    /**
     * Eskariaren data itzultzen du.
     * 
     * @return Eskariaren data
     */
    public Date getEskaeraData() {
        return this.eskaeraData;
    }

    /**
     * Eskariaren data ezartzen du.
     * 
     * @param eskaeraData Eskariaren data berria
     */
    public void setEskaeraData(Date eskaeraData) {
        this.eskaeraData = eskaeraData;
    }
    
    @Override
    public String toString() {
    	return String.format("%-5d %-20s %-30s %-10.2f %-10.2f %-5d", 
        getId(),getIdBezero(),getIdEgoera(),getIdSaltzaile(),getEskaeraData());
    }
    
    
}

