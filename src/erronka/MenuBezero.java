package erronka;

import javax.swing.*;
import java.awt.*;

public class MenuBezero {

	public static void main(String[] args) {

		// Frame-a sortu eta parametroak ezarri.
		JFrame frame = new JFrame("GameStop | Bezeroen menua");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		frame.setSize(1920, 1080);
		frame.setLayout(new GridBagLayout());

		JPanel panel = new JPanel(new GridLayout(6, 1, 5, 5));

		// Lehenengo menua sortu eta antolatu egiten da.
		JMenuBar menuBar = new JMenuBar();
		JMenu menu = new JMenu("Nire kontua");
		JMenuItem menuItem1 = new JMenuItem("Datu pertsonalak");
		JMenuItem menuItem2 = new JMenuItem("Itxi saioa");
		menu.add(menuItem1);
		menu.add(menuItem2);
		menuBar.add(menu);

		// Lehenengo menuaren akzioak.
		menuItem2.addActionListener(e -> {
			System.exit(0);
		});

		// Bigarren menua sortu eta antolatu egiten da.
		JMenu menu2 = new JMenu("Nire eskariak");
		JMenuItem menuItem01 = new JMenuItem("Historiala bistaratu");
		JMenuItem menuItem02 = new JMenuItem("Egoera");
		menu2.add(menuItem01);
		menu2.add(menuItem02);
		menuBar.add(menu2);
		
		// Bigarren menuaren akzioak.

		// Hirugarren menua sortu eta antolatu egiten da.
		JMenu menu3 = new JMenu("Produktuak");
		menuBar.add(menu3);
		
		// Hirugarren menuaren akzioak.
		menu3.addActionListener(e -> {
			System.exit(0);
		});

		frame.setJMenuBar(menuBar);

		GridBagConstraints gbc = new GridBagConstraints();
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.CENTER;
		frame.add(panel, gbc);

		frame.setVisible(true);
	}

}
