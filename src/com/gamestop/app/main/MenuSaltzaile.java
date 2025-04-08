package com.gamestop.app.main;

import com.gamestop.app.auth.Login;
import com.gamestop.app.panels.EskariakPanels;
import com.gamestop.app.panels.KontuaPanels;
import com.gamestop.app.panels.ProduktuakPanels;
import com.gamestop.app.panels.ErabiltzaileakPanels;

import javax.swing.*;
import java.awt.*;

/**
 * Saltzaileen interfaze nagusia kudeatzeko klasea.
 * Menua eta panelak kudeatzen ditu CardLayout erabiliz, bezeroen menua baino aukera gehiagorekin.
 */
public class MenuSaltzaile {

	/**
     * Aplikazioa (frame-a soilik) abiarazten duen metodoa.
     * @param args Komando-lerroko argumentuak (ez dira erabiltzen)
     */
	public static void main(String[] args) {
		// Frame nagusia eta CardLayout-a sortu
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
		JFrame frame = new JFrame("GameStop | Saltzaileen menua");
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

		// "Erabiltzaileak" menua
		JMenu erabiltzaileak = sortuErabiltzaileakMenua(frame, cardLayout);
		menuBar.add(erabiltzaileak);

		// "Produktuak" menua
		JMenu produktuak = sortuProduktuakMenua(frame, cardLayout);
		menuBar.add(produktuak);

		// "Eskariak" menua
		JMenu eskariak = sortuEskariakMenua(frame, cardLayout);
		menuBar.add(eskariak);

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

		// Panelak gehitu framera
		frame.add(KontuaPanels.saltzaileenDatuPertsonalak(), "NireKontua");
		frame.add(KontuaPanels.pasahitzaPanela(), "PasahitzaAldatu");

		return nireKontua;
	}

	/**
     * Erabiltzaileak menua sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenu objektua
     */
	private static JMenu sortuErabiltzaileakMenua(JFrame frame, CardLayout cardLayout) {
		JMenu erabiltzaileak = new JMenu("Erabiltzaileak");

		JMenuItem gehitu = new JMenuItem("Gehitu");
		gehitu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ErabiltzaileakGehitu"));
		erabiltzaileak.add(gehitu);

		JMenuItem ezabatu = new JMenuItem("Ezabatu");
		ezabatu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ErabiltzaileakEzabatu"));
		erabiltzaileak.add(ezabatu);

		JMenuItem kontsultatu = new JMenuItem("Kontsultatu");
		kontsultatu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ErabiltzaileakKontsultatu"));
		erabiltzaileak.add(kontsultatu);

		// Panelak gehitu framera
		frame.add(ErabiltzaileakPanels.erabiltzaileaEzabatu(), "ErabiltzaileakEzabatu");
		frame.add(ErabiltzaileakPanels.erabiltzaileakKontsultatu(), "ErabiltzaileakKontsultatu");

		return erabiltzaileak;
	}
	
	/**
     * Produktuak menua sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenu objektua
     */
	private static JMenu sortuProduktuakMenua(JFrame frame, CardLayout cardLayout) {
		JMenu produktuak = new JMenu("Produktuak");

		JMenuItem bistaratu = new JMenuItem("Katalogoa");
		bistaratu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakBistaratu"));
		produktuak.add(bistaratu);

		JMenuItem gehitu = new JMenuItem("Gehitu");
		gehitu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakGehitu"));
		produktuak.add(gehitu);

		JMenuItem ezabatu = new JMenuItem("Ezabatu");
		ezabatu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakEzabatu"));
		produktuak.add(ezabatu);

		JMenuItem editatu = new JMenuItem("Editatu");
		editatu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ProduktuakEditatu"));
		produktuak.add(editatu);

		// Panelak gehitu framera
		frame.add(ProduktuakPanels.produktuakBistaratu(null), "ProduktuakBistaratu");
		frame.add(ProduktuakPanels.produktuakGehitu(), "ProduktuakGehitu");
		frame.add(ProduktuakPanels.produktuakEzabatu(), "ProduktuakEzabatu");
		frame.add(ProduktuakPanels.produktuakEditatu(), "ProduktuakEditatu");

		return produktuak;
	}
	
	/**
     * Eskariak menua sortzen du.
     * @param frame Menu barra gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     * @return Osatutako JMenu objektua
     */
	private static JMenu sortuEskariakMenua(JFrame frame, CardLayout cardLayout) {
		JMenu eskariak = new JMenu("Eskariak");

		JMenuItem bistaratu = new JMenuItem("Bistaratu");
		bistaratu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "EskariakBistaratu"));
		eskariak.add(bistaratu);

		// Panelak gehitu framera
		frame.add(EskariakPanels.eskariakBistaratu(), "EskariakBistaratu");

		return eskariak;
	}	
	
	/**
     * Frame-an erabili behar diren panelak gehitzen ditu.
     * @param frame Panelak gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     */
    private static void gehituPanelak(JFrame frame, CardLayout cardLayout) {
        frame.add(Login.ongietorria(), "OngiEtorria");
        frame.add(KontuaPanels.saltzaileenDatuPertsonalak(), "NireKontua");
        frame.add(KontuaPanels.pasahitzaPanela(), "PasahitzaAldatu");
        frame.add(ProduktuakPanels.produktuakBistaratu(null), "ProduktuakBistaratu");
        frame.add(ProduktuakPanels.produktuakGehitu(), "ProduktuakGehitu");
        frame.add(ProduktuakPanels.produktuakEzabatu(), "ProduktuakEzabatu");
        frame.add(ProduktuakPanels.produktuakEditatu(), "ProduktuakEditatu");
        frame.add(EskariakPanels.eskariakBistaratu(), "EskariakBistaratu");
        frame.add(ErabiltzaileakPanels.erabiltzaileaEzabatu(), "ErabiltzaileakEzabatu");
        frame.add(ErabiltzaileakPanels.erabiltzaileakKontsultatu(), "ErabiltzaileakKontsultatu");

        // Erabiltzaileak gehitzeko panela konfiguratu
        konfiguratuErabiltzaileakGehituPanela(frame, cardLayout);

        cardLayout.show(frame.getContentPane(), "OngiEtorria");
    }

    /**
     * Erabiltzaileak gehitzeko panela konfiguratzen du.
     * @param frame Panelak gehitzeko frame-a
     * @param cardLayout Panelak aldatzeko layout-a
     */
    private static void konfiguratuErabiltzaileakGehituPanela(JFrame frame, CardLayout cardLayout) {
        JPanel erabiltzaileakGehituMainPanel = new JPanel(new BorderLayout());
        frame.add(erabiltzaileakGehituMainPanel, "ErabiltzaileakGehitu");

        // Aukeraketa-panela
        JPanel comboBoxPanel = new JPanel();
        JComboBox<String> comboBox = new JComboBox<>(new String[] { "Saltzailea", "Bezeroa" });
        comboBoxPanel.add(comboBox);
        erabiltzaileakGehituMainPanel.add(comboBoxPanel, BorderLayout.NORTH);

        // CardLayout-aren panela
        JPanel cardPanel = new JPanel(new CardLayout());
        erabiltzaileakGehituMainPanel.add(cardPanel, BorderLayout.CENTER);

        // Panelak gehitu
        cardPanel.add(ErabiltzaileakPanels.saltzaileaGehitu(), "Saltzailea");
        cardPanel.add(ErabiltzaileakPanels.bezeroaGehitu(), "Bezeroa");

        // ComboBox-aren akzioa konfiguratu
        comboBox.addActionListener(e -> {
            CardLayout cl = (CardLayout) (cardPanel.getLayout());
            cl.show(cardPanel, (String) comboBox.getSelectedItem());
        });
    }
}