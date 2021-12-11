package Ora_03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con1 = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con1 = DriverManager.getConnection("jdbc:oracle:thin:@172.26.1.127:1521:xe", "hr", "hr");
		
		String sql2 = "update teltable5 set id = ?, name = ?, tel = ?, d = ? where name = ?";
		
		PreparedStatement pst1 = con1.prepareStatement(sql2);
		
		//GUI
//		int id = Integer.parseInt(JOptionPane.showInputDialog("아이디는?"));
//		String name = JOptionPane.showInputDialog("이름은?");
//		String tel = JOptionPane.showInputDialog("전화번호는?");
//		String ipsail = JOptionPane.showInputDialog("날짜는?");
		
		
		//-----------------------
		/*키보드로 사원명과 변경될 전화번호를 입력받아 db를 업데이트하시오 *
		 * 
		
		 */
		Scanner sc = new Scanner(System.in);
		System.out.println("수정 위한 이름? :");
		String name1 = sc.nextLine();
		
		System.out.println("변경 아이디? :");
		int id2 = sc.nextInt();
		
		System.out.println("변경 이름? :");
		String name2 = sc.nextLine();
		
		System.out.println("변경 전화번호? :"); 
		String tel2 = sc.nextLine();
		
		System.out.println("변경 날짜? :");
		String hd2 = sc.nextLine();
		
		
		pst1.setInt(1, id2);
		pst1.setString(2, name2);
		pst1.setString(3, tel2);
		pst1.setString(4, hd2);
		pst1.setString(5, name1);
		
		int rowcnt1 = pst1.executeUpdate();
		System.out.println("listen " + rowcnt1 + "행 insert");
		con1.close();
		
	}

}
