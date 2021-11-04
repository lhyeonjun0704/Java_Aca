package Kiosk;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class aaa extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					aaa frame = new aaa();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public aaa() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 528, 428);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel txtID = new JLabel("id");
		txtID.setHorizontalAlignment(SwingConstants.CENTER);
		txtID.setBounds(62, 214, 99, 39);
		contentPane.add(txtID);
		
		JLabel txtPW = new JLabel("pw");
		txtPW.setHorizontalAlignment(SwingConstants.CENTER);
		txtPW.setBounds(62, 279, 99, 39);
		contentPane.add(txtPW);
		
		textField = new JTextField();
		textField.setBounds(189, 214, 200, 46);
		contentPane.add(textField);
		textField.setColumns(10);
		
		textField_1 = new JTextField();
		textField_1.setBounds(189, 279, 200, 46);
		contentPane.add(textField_1);
		textField_1.setColumns(10);
		
		JButton btnNewButton = new JButton("New button");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				dispose();
				setVisible(false);
				String id = textField.getText();
				String pw = textField_1.getText();
				
				new fff(id, pw).setVisible(true);
			}
		});
		btnNewButton.setBounds(108, 102, 256, 72);
		contentPane.add(btnNewButton);
	}
}
