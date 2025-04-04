package com.gamestop.app.main;

import com.gamestop.app.auth.Login;
import com.gamestop.app.panels.EskariakPanels;
import com.gamestop.app.panels.KontuaPanels;
import com.gamestop.app.panels.ProduktuakPanels;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import java.awt.CardLayout;
import java.awt.Image;
import java.io.IOException;

@SuppressWarnings("unused")
public class MenuBezero {

    public static void main(String[] args) {
		// Frame nagusia eta CardLayout-a sortu
        JFrame frame = sortuFrameNagusia();
        CardLayout cardLayout = new CardLayout();
        frame.setLayout(cardLayout);

		// Defektuzko panela
		frame.add(Login.ongietorria(), "OngiEtorria");
        cardLayout.show(frame.getContentPane(), "OngiEtorria");

		// Menu barra sortu
        JMenuBar menuBar = sortuMenuBarra(frame, cardLayout);

        frame.setJMenuBar(menuBar);
        frame.setVisible(true);
    }

	// Frame nagusia sortzen da, titulua eta tamaina ezarrita.
	private static JFrame sortuFrameNagusia() {
		JFrame frame = new JFrame("GameStop | Bezeroen menua");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		// frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        frame.setResizable(false);
		frame.setSize(1280, 720);
        frame.setLocationRelativeTo(null);
		Login.kargatuIkonoa(frame);
		return frame;
	}
	
	// Menu barra sortzen da, non menuaren submenuak eta aukerak definitzen diren.
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

	// "Nire kontua" menua sortu.
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

		// Panelak gehitu framera
		frame.add(KontuaPanels.bezeroenDatuPertsonalak(), "NireKontua");
		frame.add(KontuaPanels.pasahitzaPanela(), "PasahitzaAldatu");

		return nireKontua;
	}
	
	// "Eskariak" menua sortu.
    private static JMenu sortuEskariakMenua(JFrame frame, CardLayout cardLayout) {
        JMenu eskariak = new JMenu("Nire eskariak");

        JMenuItem historiala = new JMenuItem("Historiala bistaratu");
        historiala.addActionListener(e -> cardLayout.show(frame.getContentPane(), "Historiala"));
        eskariak.add(historiala);

        JMenuItem egoera = new JMenuItem("Egoera");
        egoera.addActionListener(e -> cardLayout.show(frame.getContentPane(), "EgoeraBistaratu"));
        eskariak.add(egoera);

		// Panelak gehitu framera
        frame.add(EskariakPanels.historialaikusiSortu(), "Historiala");
        frame.add(EskariakPanels.egoeraikusiSortu(), "EgoeraBistaratu");

        return eskariak;
    }

    // "Produktuak" menua sortu.
    private static JMenu sortuProduktuakMenua(JFrame frame, CardLayout cardLayout) {
        JMenu productsMenu = new JMenu("Produktuak");

        JMenuItem bistaratu = new JMenuItem("Katalogoa");
        bistaratu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakBistaratu"));
        productsMenu.add(bistaratu);

		// Panelak gehitu framera
        frame.add(ProduktuakPanels.produktuakBistaratu(null), "ProduktuakBistaratu");

        return productsMenu;
    }
}