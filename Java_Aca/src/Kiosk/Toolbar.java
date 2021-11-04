package Kiosk;

// src-new-pacakge images폴더 하나 준비 후 그 안에 넣음
// Jbutoon 드래그 후 속성창 icon classpath 선택

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JToolBar;
import javax.swing.JButton;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.SwingConstants;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Toolbar extends JFrame {

	private JPanel contentPane;
	private JLabel lblNewLabel;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Toolbar frame = new Toolbar();
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
	public Toolbar() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 622, 518);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JToolBar toolBar = new JToolBar();
		toolBar.setBounds(56, 31, 343, 183);
		contentPane.add(toolBar);
		
		JButton btnNewButton = new JButton("");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				lblNewLabel.setForeground(Color.RED);
			}
		});
		btnNewButton.setIcon(new ImageIcon(Toolbar.class.getResource("/img/fc.PNG")));
		toolBar.add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("");
		btnNewButton_1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				lblNewLabel.setFont(new Font("굴림", Font.ITALIC ,30));
			}
		});
		btnNewButton_1.setIcon(new ImageIcon(Toolbar.class.getResource("/img/ins.PNG")));
		toolBar.add(btnNewButton_1);
		
		lblNewLabel = new JLabel("New label");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 15));
		lblNewLabel.setBounds(371, 252, 202, 55);
		contentPane.add(lblNewLabel);
	}
}
