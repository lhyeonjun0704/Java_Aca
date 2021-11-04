package Kiosk;

// ȭ�鼳�� ����
// īī�� ����(����) ����: powermockup
// html5��� ��/�� ������Ÿ���� ��. / ��, ��α� �þ� ���� ���ϰ� ���鵵�� ������ ������Ÿ��, mock-up(�ǹ�ũ���� ����)�� ���� ���� �ۼ� ����.
// wireframe : �ܼ� ������ ���� �����ڰ� � ������ �������� 
// mockup : �ϼ��� ���� �ǹ�ũ���� ����
// prototype : user inferface simulation ��, �Ϻ� ������� �߰��Ǿ� ������ ������ �׽�Ʈ�� ������ ��.

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
