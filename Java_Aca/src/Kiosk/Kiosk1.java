package Kiosk;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.AbstractListModel;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionListener;
import javax.swing.event.ListSelectionEvent;

public class Kiosk1 extends JFrame {

	private JPanel contentPane;
	
	String msg = "";
	int sum = 0;
	String msg2 = "";
	JList list;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Kiosk1 frame = new Kiosk1();
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
	public Kiosk1() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 580, 482);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		list = new JList();
		list.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent arg0) {
				if(!list.getValueIsAdjusting()) { //twice이벤트방지 
					int index1 = list.getSelectedIndex(); // 선택된 index 0이 종료
					String indexElement1 = (String) list.getModel().getElementAt(index1); // 종로글자
					if(indexElement1.equals("종로")){
						sum -= 1000;
					}
					list.setEnabled(false);
				}
			}
		});
		list.setVisibleRowCount(3);
		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		list.setModel(new AbstractListModel() {
			String[] values = new String[] {"\uC885\uB85C", "\uC885\uB85C \uC678"};
			public int getSize() {
				return values.length;
			}
			public Object getElementAt(int index) {
				return values[index];
			}
		});
		list.setBounds(52, 312, 194, 80);
		contentPane.add(list);
		
		JButton btnNewButton = new JButton("New button");
		btnNewButton.setBounds(52, 80, 194, 59);
		contentPane.add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("New button");
		btnNewButton_1.setBounds(298, 80, 226, 59);
		contentPane.add(btnNewButton_1);
		
		JButton btnNewButton_2 = new JButton("New button");
		btnNewButton_2.setBounds(52, 181, 194, 59);
		contentPane.add(btnNewButton_2);
		
		JButton btnNewButton_3 = new JButton("New button");
		btnNewButton_3.setBounds(316, 181, 208, 53);
		contentPane.add(btnNewButton_3);
		
		JButton btnNewButton_4 = new JButton("New button");
		btnNewButton_4.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				
				msg2 = msg + "합계금액 : " + String.valueOf(sum) + "원";
				JOptionPane.showConfirmDialog(btnNewButton_4, msg2 ,"확인하세요", JOptionPane.YES_NO_OPTION);
				
				msg = "";
				msg2 = "";
				sum = 0;
				list.setEnabled(true);
			}
		});
		btnNewButton_4.setBounds(50, 253, 196, 33);
		contentPane.add(btnNewButton_4);
		
		JButton btnNewButton_5 = new JButton("New button");
		btnNewButton_5.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				JOptionPane.showMessageDialog(null, "취소되었습니다.");
				
				msg = "";
				msg2 = "";
				sum = 0;
				list.setEnabled(true);
			}
		});
		btnNewButton_5.setBounds(310, 247, 214, 46);
		contentPane.add(btnNewButton_5);
	}
}
