package com.gamestop.app.main;

import com.gamestop.app.auth.Login;
import com.gamestop.app.panels.EskariakPanels;
import com.gamestop.app.panels.KontuaPanels;
import com.gamestop.app.panels.ProduktuakPanels;

import javax.swing.*;
import java.awt.*;

/**
 * Bezeroen interfaze nagusia kudeatzeko klasea.
 * Menua eta panelak kudeatzen ditu CardLayout erabiliz.
 */
@SuppressWarnings("unused")
public class MenuBezero {

	/**
     * Aplikazioa (frame-a soilik) abiarazten duen metodoa.
     * @param args Komando-lerroko argumentuak (ez dira erabiltzen)
     */
    public static void main(String[] args) {
        JFrame frame = sortuFrameNagusia();
        CardLayout cardLayout = new CardLayout();
        frame.setLayout(cardLayout);

        gehituPanelak(frame, cardLayout);

        frame.setJMenuBar(sortuMenuBarra(frame, cardLayout));
        frame.setVisible(true);
    }

    /**
     * Frame nagusia sortu eta konfiguratzen du.
     * @return Konfiguratutako JFrame objektua
     */
	private static JFrame sortuFrameNagusia() {
		JFrame frame = new JFrame("GameStop | Bezeroen menua");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setResizable(false);
		frame.setSize(1280, 720);
        frame.setLocationRelativeTo(null);
		Login.kargatuIkonoa(frame);
		return frame;
	}
	
    /**
     * Menu barra nagusia sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenuBar objektua
     */
    private static JMenuBar sortuMenuBarra(JFrame frame, CardLayout cardLayout) {
        JMenuBar menuBar = new JMenuBar();

		// "Nire kontua" menua
        JMenu nireKontua = sortuKontuaMenua(frame, cardLayout);
        menuBar.add(nireKontua);

		// "Eskariak" menua
        JMenu eskariak = sortuEskariakMenua(frame, cardLayout);
        menuBar.add(eskariak);

		// "Produktuak" menua
        JMenu produktuak = sortuProduktuakMenua(frame, cardLayout);
        menuBar.add(produktuak);

        return menuBar;
    }

    /**
     * Nire kontua menua sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenu objektua
     */
	private static JMenu sortuKontuaMenua(JFrame frame, CardLayout cardLayout) {
		JMenu nireKontua = new JMenu("Nire kontua");

		JMenuItem datuPertsonalak = new JMenuItem("Datu pertsonalak");
		datuPertsonalak.addActionListener(e -> cardLayout.show(frame.getContentPane(), "NireKontua"));
		nireKontua.add(datuPertsonalak);

		JMenuItem pasahitzaAldatu = new JMenuItem("Pasahitza aldatu");
		pasahitzaAldatu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "PasahitzaAldatu"));
		nireKontua.add(pasahitzaAldatu);

		JMenuItem saioaItxi = new JMenuItem("Itxi saioa");
		saioaItxi.addActionListener(e -> Login.saioaItxi(frame));
		nireKontua.add(saioaItxi);

		JMenuItem irten = new JMenuItem("Programatik irten");
		irten.addActionListener(e -> System.exit(0));
		nireKontua.add(irten);

		return nireKontua;
	}
	
	/**
     * Eskariak menua sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenu objektua
     */
    private static JMenu sortuEskariakMenua(JFrame frame, CardLayout cardLayout) {
        JMenu eskariak = new JMenu("Nire eskariak");

        JMenuItem historiala = new JMenuItem("Historiala bistaratu");
        historiala.addActionListener(e -> cardLayout.show(frame.getContentPane(), "Historiala"));
        eskariak.add(historiala);

        return eskariak;
    }

    /**
     * Produktuak menua sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenu objektua
     */
    private static JMenu sortuProduktuakMenua(JFrame frame, CardLayout cardLayout) {
        JMenu productsMenu = new JMenu("Produktuak");

        JMenuItem bistaratu = new JMenuItem("Katalogoa");
        bistaratu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakBistaratu"));
        productsMenu.add(bistaratu);

        return productsMenu;
    }
    
    /**
     * Frame-an erabili behar diren panelak gehitzen ditu.
     * @param frame Panelak gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     */
    private static void gehituPanelak(JFrame frame, CardLayout cardLayout) {
        frame.add(Login.ongietorria(), "OngiEtorria");
        frame.add(KontuaPanels.bezeroenDatuPertsonalak(), "NireKontua");
        frame.add(KontuaPanels.pasahitzaPanela(), "PasahitzaAldatu");
        frame.add(EskariakPanels.historialaikusiSortu(), "Historiala");
        frame.add(ProduktuakPanels.produktuakBistaratu(), "ProduktuakBistaratu");

        cardLayout.show(frame.getContentPane(), "OngiEtorria");
    }
}