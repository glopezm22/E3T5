package erronka;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Insets;
import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.BoxLayout;
import javax.swing.DefaultListModel;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import java.text.SimpleDateFormat;

public class EskariakMenu {

	// SALTZAILEAK - Eskariak bistaratzeko panela sortzeko metodoa.
	public static JPanel eskariakBistaratu() {
	    JPanel panel = new JPanel(new BorderLayout());
	    JLabel label = new JLabel("Historiala", SwingConstants.CENTER);
	    label.setFont(new Font("Arial", Font.BOLD, 24));
	    panel.add(label, BorderLayout.NORTH);

	    // Panel nagusia
	    JPanel centerPanel = new JPanel(new GridBagLayout());
	    GridBagConstraints gbc = new GridBagConstraints();
	    gbc.insets = new Insets(10, 10, 10, 10);
	    gbc.fill = GridBagConstraints.HORIZONTAL;
	    gbc.anchor = GridBagConstraints.WEST;

	    JComboBox<String> comboBoxHistoriala = new JComboBox<>();
	    JTextField txtEskariId = sortuTextFieldEditatugabea(10);
	    JTextField txtBezeroa = sortuTextFieldEditatugabea(20);
	    JTextField txtData = sortuTextFieldEditatugabea(15);
	    JTextField txtEgoera = sortuTextFieldEditatugabea(15);

	    // ID balioa lortu
	    int id = Login.id;
	    if (id <= 0) {
	        JOptionPane.showMessageDialog(null, "Errorea: Erabiltzaile ID baliogabea.");
	        return panel;
	    }

	    kargatuSaltzaileenEskariak(comboBoxHistoriala, id);

	    comboBoxHistoriala.addActionListener(e -> {
	        String aukeratutakoEskaria = (String) comboBoxHistoriala.getSelectedItem();
	        if (aukeratutakoEskaria != null && !aukeratutakoEskaria.isEmpty()) {
	            try {
	                int eskariId = Integer.parseInt(aukeratutakoEskaria.split(" ")[1]);
	                kargatuSaltzaileenEskarienInformazioa(eskariId, txtEskariId, txtBezeroa, txtData, txtEgoera);
	            } catch (NumberFormatException ex) {
	                JOptionPane.showMessageDialog(null, "Errorea: Eskari ID formatu okerra.");
	            }
	        }
	    });

	    // Konponente guztiak panelera gehitu
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Aukeratu eskaria:", comboBoxHistoriala, 0, 0);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Eskari ID:", txtEskariId, 0, 1);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Bezeroa:", txtBezeroa, 0, 2);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Data:", txtData, 0, 3);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Egoera:", txtEgoera, 0, 4);

	    panel.add(centerPanel, BorderLayout.CENTER);
	    return panel;
	}

	// Textfield-ak sortzeko metodoa.
	private static JTextField sortuTextFieldEditatugabea(int columns) {
	    JTextField eremua = new JTextField(columns);
	    eremua.setEditable(false);
	    return eremua;
	}

	// Konponenteak sortzeko metodoa, etiketarekin
	private static void sortuKonponenteaEtiketarekin(JPanel panel, GridBagConstraints gbc, 
	    String etiketa, JComponent konponentea, int x, int y) {
	    gbc.gridx = 0;
	    gbc.gridy = y;
	    panel.add(new JLabel(etiketa), gbc);
	    gbc.gridx = 1;
	    panel.add(konponentea, gbc);
	}
	
	// SALTZAILEAK - Eskariak ComboBox-ean kargatzeko metodoa.
	private static void kargatuSaltzaileenEskariak(JComboBox<String> comboBox, int saltzaileId) {
	    if (comboBox == null) {
	        JOptionPane.showMessageDialog(null, "Errorea: ComboBox ezin da null izan.");
	        return;
	    }

	    if (saltzaileId <= 0) {
	        JOptionPane.showMessageDialog(null, "Errorea: Saltzaile ID baliogabea.");
	        return;
	    }

	    try (Connection conn = DBmain.konexioa();
	         PreparedStatement pstmt = conn.prepareStatement(
	             "SELECT E.ID FROM ESKARI E WHERE E.ID_SALTZAILE = ?")) {
	        
	        pstmt.setInt(1, saltzaileId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            comboBox.removeAllItems();
	            
	            while (rs.next()) {
	                comboBox.addItem("Eskaria " + rs.getInt("ID"));
	            }
	            
	            if (comboBox.getItemCount() == 0) {
	                comboBox.addItem("Ez dago eskarririk");
	            }
	        }
	    } catch (SQLException ex) {
	        JOptionPane.showMessageDialog(null, "Errorea eskariak kargatzean: " + ex.getMessage());
	        ex.printStackTrace();
	    }
	}

	// SALTZAILEAK - Eskariaren informazioa kargatzeko metodoa.
	private static void kargatuSaltzaileenEskarienInformazioa(int eskariId, JTextField... eremuak) {
	    if (eremuak == null || eremuak.length != 4) {
	        JOptionPane.showMessageDialog(null, "Errorea: Parametro kopuru okerra");
	        return;
	    }

	    try (Connection conn = DBmain.konexioa();
	         PreparedStatement pstmt = conn.prepareStatement(
	             "SELECT E.ID, B.IZENA, B.ABIZENA, E.ESKAERA_DATA, EG.DESKRIBAPENA " +
	             "FROM ESKARI E " +
	             "JOIN BEZERO B ON E.ID_BEZERO = B.ID " +
	             "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " +
	             "WHERE E.ID = ?")) {
	        
	        pstmt.setInt(1, eskariId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                eremuak[0].setText(String.valueOf(rs.getInt("ID")));
	                eremuak[1].setText(izenabizenak(rs));
	                eremuak[2].setText(dataFormateatu(rs.getTimestamp("ESKAERA_DATA")));
	                eremuak[3].setText(egoeraItzuli(rs.getString("DESKRIBAPENA")));
	            } else {
	                eremuakGarbitu(eremuak);
	                JOptionPane.showMessageDialog(null, "Ez da eskaria aurkitu ID honekin: " + eskariId);
	            }
	        }
	    } catch (SQLException ex) {
	        eremuakGarbitu(eremuak);
	        JOptionPane.showMessageDialog(null, "Errorea eskariaren informazioa kargatzean: " + ex.getMessage());
	        ex.printStackTrace();
	    }
	}

	// Metodo laguntzaileak
	private static String izenabizenak(ResultSet rs) throws SQLException {
	    String izena = rs.getString("IZENA");
	    String abizena = rs.getString("ABIZENA");
	    return (izena != null ? izena : "") + " " + (abizena != null ? abizena : "");
	}

	private static String dataFormateatu(Timestamp timestamp) {
	    if (timestamp == null) return "Data ez dago eskuragarri";
	    return new SimpleDateFormat("yyyy-MM-dd").format(timestamp);
	}

	private static String egoeraItzuli(String egoera) {
	    if (egoera == null) return "Egoera ezezaguna";
	    
	    switch (egoera) {
	        case "Pending": return "Bidalita";
	        case "Shipped": return "Entregatua";
	        case "Cancelled": return "Ezeztatua";
	        default: return egoera;
	    }
	}

	private static void eremuakGarbitu(JTextField[] campos) {
	    for (JTextField campo : campos) {
	        campo.setText("");
	    }
	}
	
	public static JPanel egoeraikusiSortu() {
		JPanel panel = new JPanel(new BorderLayout());
		JLabel label = new JLabel("Egoera Bistaratu", SwingConstants.CENTER);
		label.setFont(new Font("Arial", Font.BOLD, 24));
		panel.add(label, BorderLayout.NORTH);

		JPanel centerPanel = new JPanel(new GridBagLayout());
		GridBagConstraints gbc = new GridBagConstraints();
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.WEST;

		JPanel columnsPanel = new JPanel(new GridLayout(0, 3, 10, 10));

		JPanel headerPanel = new JPanel(new GridLayout(1, 3));
		headerPanel.add(new JLabel("Shipped", SwingConstants.CENTER));
		headerPanel.add(new JLabel("Canceled", SwingConstants.CENTER));
		headerPanel.add(new JLabel("Pending", SwingConstants.CENTER));

		// Agregar los encabezados al panel
		columnsPanel.add(headerPanel);

		// Consultar los estados de los pedidos del usuario
		int bezeroId = Login.id; // ID del usuario logueado
		try {
			Connection conn = DBmain.konexioa();
			PreparedStatement pstmt = conn.prepareStatement("SELECT E.ID, EG.DESKRIBAPENA " + "FROM ESKARI E "
					+ "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " + "WHERE E.ID_BEZERO = ?");
			pstmt.setInt(1, bezeroId);
			ResultSet rs = pstmt.executeQuery();

			// Crear listas para los pedidos de cada estado
			DefaultListModel<String> shippedList = new DefaultListModel<>();
			DefaultListModel<String> canceledList = new DefaultListModel<>();
			DefaultListModel<String> pendingList = new DefaultListModel<>();

			// Clasificar los pedidos por estado
			while (rs.next()) {
				int eskariId = rs.getInt("ID");
				String egoera = rs.getString("DESKRIBAPENA");

				if ("Shipped".equals(egoera)) {
					shippedList.addElement("Eskaria " + eskariId);
				} else if ("Canceled".equals(egoera)) {
					canceledList.addElement("Eskaria " + eskariId);
				} else if ("Pending".equals(egoera)) {
					pendingList.addElement("Eskaria " + eskariId);
				}
			}

			// Crear paneles para cada estado y agregar a las columnas
			columnsPanel.add(createStatusColumn(shippedList));
			columnsPanel.add(createStatusColumn(canceledList));
			columnsPanel.add(createStatusColumn(pendingList));

			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Errorea egoerak kargatzean.");
			ex.printStackTrace();
		}

		// Añadir el panel de las columnas al panel central
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.gridwidth = 3;
		centerPanel.add(columnsPanel, gbc);

		panel.add(centerPanel, BorderLayout.CENTER);
		return panel;
	}

	// Método auxiliar para crear las columnas de estado
	private static JPanel createStatusColumn(DefaultListModel<String> statusList) {
		JPanel columnPanel = new JPanel();
		columnPanel.setLayout(new BoxLayout(columnPanel, BoxLayout.Y_AXIS));

		// Añadir los elementos de la lista de estado a la columna
		for (int i = 0; i < statusList.size(); i++) {
			JLabel itemLabel = new JLabel(statusList.get(i), SwingConstants.CENTER);
			itemLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
			columnPanel.add(itemLabel);
		}

		return columnPanel;
	}

	public static JPanel historialaikusiSortu() {
	    // Panel principal
	    JPanel panel = new JPanel(new BorderLayout());
	    
	    // Título
	    JLabel label = new JLabel("Historiala", SwingConstants.CENTER);
	    label.setFont(new Font("Arial", Font.BOLD, 24));
	    panel.add(label, BorderLayout.NORTH);

	    // Panel central con GridBagLayout
	    JPanel centerPanel = new JPanel(new GridBagLayout());
	    GridBagConstraints gbc = new GridBagConstraints();
	    gbc.insets = new Insets(10, 10, 10, 10);
	    gbc.fill = GridBagConstraints.HORIZONTAL;
	    gbc.anchor = GridBagConstraints.WEST;

	    // Componentes UI
	    JComboBox<String> comboBoxHistoriala = new JComboBox<>();
	    JTextField txtEskariId = sortuTextFieldEditatugabea(10);
	    JTextField txtSaltzailea = sortuTextFieldEditatugabea(20);
	    JTextField txtData = sortuTextFieldEditatugabea(15);
	    JTextField txtEgoera = sortuTextFieldEditatugabea(15);

	    // Validar ID de usuario
	    int id = Login.id;
	    if (id <= 0) {
	        JOptionPane.showMessageDialog(null, "Errorea: Erabiltzaile ID baliogabea");
	        return panel;
	    }

	    // Cargar pedidos del cliente
	    kargatuBezeroenEskariak(comboBoxHistoriala, id);

	    // Listener para el ComboBox
	    comboBoxHistoriala.addActionListener(e -> {
	        String aukeratutakoEskaria = (String) comboBoxHistoriala.getSelectedItem();
	        if (aukeratutakoEskaria != null && !aukeratutakoEskaria.isEmpty()) {
	            try {
	                int eskariId = Integer.parseInt(aukeratutakoEskaria.split(" ")[1]);
	                kargatuBezeroenEskarienInformazioa(eskariId, txtEskariId, txtSaltzailea, txtData, txtEgoera);
	            } catch (NumberFormatException ex) {
	                JOptionPane.showMessageDialog(null, "Errorea: Eskari ID formatu okerra");
	            }
	        }
	    });

	    // Añadir componentes al panel (reutilizando método auxiliar)
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Aukeratu eskaria:", comboBoxHistoriala, 0, 0);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Eskari ID:", txtEskariId, 0, 1);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Saltzailea:", txtSaltzailea, 0, 2);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Data:", txtData, 0, 3);
	    sortuKonponenteaEtiketarekin(centerPanel, gbc, "Egoera:", txtEgoera, 0, 4);

	    panel.add(centerPanel, BorderLayout.CENTER);
	    return panel;
	}

	// BEZEROAK - Eskariak ComboBox-ean kargatzeko metodoa optimizado
	private static void kargatuBezeroenEskariak(JComboBox<String> comboBox, int bezeroId) {
	    if (comboBox == null) {
	        JOptionPane.showMessageDialog(null, "Errorea: ComboBox ezin da null izan");
	        return;
	    }

	    if (bezeroId <= 0) {
	        JOptionPane.showMessageDialog(null, "Errorea: Bezero ID baliogabea");
	        return;
	    }

	    try (Connection conn = DBmain.konexioa();
	         PreparedStatement pstmt = conn.prepareStatement(
	             "SELECT E.ID FROM ESKARI E WHERE E.ID_BEZERO = ?")) {
	        
	        pstmt.setInt(1, bezeroId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            comboBox.removeAllItems(); // Limpiar items existentes
	            
	            while (rs.next()) {
	                comboBox.addItem("Eskaria " + rs.getInt("ID"));
	            }
	            
	            if (comboBox.getItemCount() == 0) {
	                comboBox.addItem("Ez dago eskarririk");
	            }
	        }
	    } catch (SQLException ex) {
	        JOptionPane.showMessageDialog(null, "Errorea eskariak kargatzean: " + ex.getMessage());
	        ex.printStackTrace();
	    }
	}

	// BEZEROAK - Eskariaren informazioa kargatzeko metodoa optimizado
	private static void kargatuBezeroenEskarienInformazioa(int eskariId, JTextField... campos) {
	    if (campos == null || campos.length != 4) {
	        JOptionPane.showMessageDialog(null, "Errorea: Parametro kopuru okerra");
	        return;
	    }

	    try (Connection conn = DBmain.konexioa();
	         PreparedStatement pstmt = conn.prepareStatement(
	             "SELECT E.ID, L.IZENA, L.ABIZENA, E.ESKAERA_DATA, EG.DESKRIBAPENA " +
	             "FROM ESKARI E " +
	             "JOIN LANGILE L ON E.ID_SALTZAILE = L.ID " +
	             "JOIN ESKARI_EGOERA EG ON E.ID_EGOERA = EG.ID " +
	             "WHERE E.ID = ?")) {
	        
	        pstmt.setInt(1, eskariId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                campos[0].setText(String.valueOf(rs.getInt("ID")));
	                campos[1].setText(izenabizenak(rs));
	                campos[2].setText(dataFormateatu(rs.getTimestamp("ESKAERA_DATA")));
	                campos[3].setText(egoeraItzuli(rs.getString("DESKRIBAPENA")));
	            } else {
	                eremuakGarbitu(campos);
	                JOptionPane.showMessageDialog(null, "Ez da eskaria aurkitu ID honekin: " + eskariId);
	            }
	        }
	    } catch (SQLException ex) {
	        eremuakGarbitu(campos);
	        JOptionPane.showMessageDialog(null, "Errorea eskariaren informazioa kargatzean: " + ex.getMessage());
	        ex.printStackTrace();
	    }
	}

}