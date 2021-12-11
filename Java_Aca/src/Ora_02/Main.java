package Ora_02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		Connection con1 = null;
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con1 = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "hr", "hr");
		
		String name = sc.next();
		
		// JDBC �ۼ�
//		String sql2 = "select * from employees";
//		String sql2 = "select * from employees where upper(first_name) = 'NANCY'";
//		String sql2 = "select * from employees where upper(first_name) =" + "'" + name + "'";
//		String sql2 = "select * from employees where lower(first_name) = ?";
//		String sql2 = "select * from employees where first_name like ?";
		
		// Q) ������ �Է¹޾� �ش������� �ٹ��ϴ� ����� �̸�, �μ���, �Ի���� ����ϴ� jdbc ���α׷� �ۼ�.
		String sql2 ="select e.first_name, d.department_name, e.hire_date from employees e join departments d on "
				+ "d.department_id = e.department_id join locations l on l.location_id = d.location_id where lower(city) = ?";
		
		
		
		
//		Statement st2 = con1.createStatement();
		PreparedStatement ps2 = con1.prepareStatement(sql2);
		ps2.setString(1, name);
		
		ResultSet rs2 = ps2.executeQuery();
		
//		ResultSet rs2 = st2.executeQuery(sql2);
		
		
//		ResultSetMetaData rsmd = rs2.getMetaData();
//		int numberOfColumns=rsmd.getColumnCount();

		
//		System.out.println(rs2);
		
//		for(int i = 1; i < numberOfColumns; i++) {
//			System.out.print(rsmd.getColumnName(i) + " ");
//		}
		System.out.println();
		
		while(rs2.next()) { // data�� �ִ��� Ȯ��
//			int id = rs2.getInt("employee_id");
			String fname = rs2.getString("first_name");
			String dep_name =rs2.getString("department_name");
			String h_date = rs2.getString("hire_Date");
//			System.out.println(h_date);
			String hire_date = h_date.substring(5, 7);		
			System.out.println(rs2.getRow() + "\t" + fname + "\t" + dep_name +  "\t" + hire_date + "��");
		}
		
		con1.close();
		
		System.out.println("���� ����");
		
	}

}
