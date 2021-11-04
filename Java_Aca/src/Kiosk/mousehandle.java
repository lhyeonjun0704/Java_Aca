package Kiosk;

// 화면설계 도구
// 카카오 오븐(무료) 유사: powermockup
// html5기반 웹/앱 프로토타이핑 툴. / 웹, 블로그 시안 등을 편리하게 만들도록 도와줘 프로토타입, mock-up(실물크기의 모형)을 쉽게 빨리 작성 가능.
// wireframe : 단순 디자인 형식 개발자가 어떤 식으로 개발할지 
// mockup : 완성평가 위한 실물크기의 모형
// prototype : user inferface simulation 즉, 일부 사용기능이 추가되어 실제에 가깝게 테스트가 가능한 것.

import java.awt.BasicStroke;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Graphics;
import java.awt.Graphics2D;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;

public class mousehandle extends JFrame {

	private JPanel contentPane;
	int x, y;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					mousehandle frame = new mousehandle();
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
	public mousehandle() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.addMouseMotionListener(new MouseMotionAdapter() {
			@Override
			public void mouseDragged(MouseEvent arg0) {
				Graphics g = getGraphics();
				g.setColor(Color.red);
				Graphics2D g2d = (Graphics2D)g;
				g2d.setStroke(new BasicStroke(10));
				
				int badaX = arg0.getX();
				int badaY = arg0.getY();
				
				g.drawLine(x, y, badaX, badaY);
				x = badaX;
				y = badaY;
				
			}
		});
		contentPane.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				x = e.getX();
				y = e.getY();
			}
		});
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
	}

}
