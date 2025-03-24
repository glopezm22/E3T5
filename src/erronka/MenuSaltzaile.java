package erronka;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JComboBox;
import java.awt.CardLayout;
import java.awt.BorderLayout;

public class MenuSaltzaile {

	public static void main(String[] args) {
		// Frame nagusia eta CardLayout-a sortu
		JFrame frame = sortuFrameNagusia();
		CardLayout cardLayout = new CardLayout();
		frame.setLayout(cardLayout);

		// Defektuzko panela
		JPanel defaultPanel = new JPanel();
		frame.add(defaultPanel, "Default");
		cardLayout.show(frame.getContentPane(), "Default");

		// Menu barra sortu
		JMenuBar menuBar = sortuMenuBarra(frame, cardLayout);

		// Main Panela konfiguratu
		aukeratuErabiltzaileenPanela(frame, cardLayout);

		frame.setJMenuBar(menuBar);
		frame.setVisible(true);
	}

	// Frame nagusia sortzen da, titulua eta tamaina ezarrita.
	private static JFrame sortuFrameNagusia() {
		JFrame frame = new JFrame("GameStop | Saltzaileen menua");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		frame.setSize(1920, 1080);
		return frame;
	}

	// Menu barra sortzen da, non menuaren submenuak eta aukerak definitzen diren.
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

		JMenuItem irten = new JMenuItem("Itxi programa");
		irten.addActionListener(e -> System.exit(0));
		nireKontua.add(irten);

		// Panelak gehitu framera
		frame.add(NireKontuaMenu.saltzaileenDatuPertsonalak(), "NireKontua");
		frame.add(NireKontuaMenu.pasahitzaPanela(), "PasahitzaAldatu");

		return nireKontua;
	}

	// "Erabiltzaileak" menua sortu.
	private static JMenu sortuErabiltzaileakMenua(JFrame frame, CardLayout cardLayout) {
		JMenu erabiltzaileak = new JMenu("Erabiltzaileak");

		JMenuItem gehitu = new JMenuItem("Gehitu");
		gehitu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ErabiltzaileakGehitu"));
		erabiltzaileak.add(gehitu);

		JMenuItem ezabatu = new JMenuItem("Ezabatu");
		ezabatu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "ErabiltzaileakEzabatu"));
		erabiltzaileak.add(ezabatu);

		JMenuItem kontsultatu = new JMenuItem("Kontsultatu");
		erabiltzaileak.add(kontsultatu);

		// Panelak gehitu framera
		frame.add(ErabiltzaileakMenu.erabiltzaileaEzabatu(), "ErabiltzaileakEzabatu");

		return erabiltzaileak;
	}
	
	// Erabiltzaile panela bistaratzeko aukeratuko da "Saltzailea" edo "Bezeroa" aukeren artean.
	private static void aukeratuErabiltzaileenPanela(JFrame frame, CardLayout cardLayout) {
		JPanel erabiltzaileakGehituMainPanel = new JPanel(new BorderLayout());
		frame.add(erabiltzaileakGehituMainPanel, "ErabiltzaileakGehitu");

		// ComboBox-aren panela, aukeratzeko Saltzailea ala Bezeroa gehituko dugun.
		JPanel comboBoxPanel = new JPanel();
		JComboBox<String> comboBox = new JComboBox<>(new String[] { "Saltzailea", "Bezeroa" });
		comboBoxPanel.add(comboBox);
		erabiltzaileakGehituMainPanel.add(comboBoxPanel, BorderLayout.NORTH);

		// CardLayout-aren panela, Saltzailea edo Bezeroa aukeratzeko.
		JPanel cardPanel = new JPanel(new CardLayout());
		erabiltzaileakGehituMainPanel.add(cardPanel, BorderLayout.CENTER);

		// "Saltzailea" eta "Bezeroa" panelak gehitu CardLayout-ean
		cardPanel.add(ErabiltzaileakMenu.saltzaileaGehitu(), "Saltzailea");
		cardPanel.add(ErabiltzaileakMenu.bezeroaGehitu(), "Bezeroa");

		// ComboBox-aren akzioa konfiguratu
		comboBox.addActionListener(e -> {
			CardLayout cl = (CardLayout) (cardPanel.getLayout());
			cl.show(cardPanel, (String) comboBox.getSelectedItem());
		});
	}

	// "Produktuak" menua sortu.
	private static JMenu sortuProduktuakMenua(JFrame frame, CardLayout cardLayout) {
		JMenu produktuak = new JMenu("Produktuak");

		JMenuItem bistaratu = new JMenuItem("Bistaratu");
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
		frame.add(ProduktuakMenu.produktuakBistaratu(), "ProduktuakBistaratu");
		frame.add(ProduktuakMenu.produktuakGehitu(), "ProduktuakGehitu");
		frame.add(ProduktuakMenu.produktuakEzabatu(), "ProduktuakEzabatu");
		frame.add(ProduktuakMenu.produktuakEditatu(), "ProduktuakEditatu");

		return produktuak;
	}
	
	// "Eskariak" menua sortu.
	private static JMenu sortuEskariakMenua(JFrame frame, CardLayout cardLayout) {
		JMenu eskariak = new JMenu("Eskariak");

		JMenuItem bistaratu = new JMenuItem("Bistaratu");
		bistaratu.addActionListener(e -> cardLayout.show(frame.getContentPane(), "EskariakBistaratu"));
		eskariak.add(bistaratu);

		// Panelak gehitu framera
		frame.add(EskariakMenu.eskariakBistaratu(), "EskariakBistaratu");

		return eskariak;
	}	
}