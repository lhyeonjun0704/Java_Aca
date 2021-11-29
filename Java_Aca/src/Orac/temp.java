package Orac;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class temp {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection con1 = null; // 접속객체 con 1 선어 // ctr1 + shift+o 로 import
		
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 드라이버로딩(ojdbc8.jar, ojdbc6.jar)
		// 대소문자, 띄어쓰기 x, 스태틱메소드(new 없이 사용) 객체.메소드() => 클래스.스태틱메소드()
		//1)add throws declaration~
		//2) surround with try/catch
		
		// db 접속 / 클래스.스태틱메소드()
		con1 = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "hr", "hr");
		
		System.out.println("접속 완료"); // 클래스.스태틱 메소드()
		
		// c:\program files\java\jdk.../jre/lib/ext 에도 ojdbc6.jar 넣기
		//실행은 왼쪽에서 .java run as -java apllication
		
	}

}
