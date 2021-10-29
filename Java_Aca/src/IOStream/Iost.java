package IOStream;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

// DB : oracle, mssql, mysql, maradb

//file�� ��Ʈ��
// �׸����� ����, ����
// 01110110000111 babo �� �ٴ�

// stream : byte stream / ���� stream
// (input / output stream) (reader, writer)

// ���� �ۼ����  - �ؽ�Ʈ���
// open - read(�޸� -> ���) - close

public class Iost {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//open
		FileReader fr = new FileReader("C:/Users/82106/Desktop/aa.txt");
		
		BufferedReader br = new BufferedReader(fr);
		
		//read�� ���Ͽ��� �о to ���â��(����)
		// write�� Ű���� ������ �Է����� to ���Ͽ�
		String s = null;
		//file read - ȭ�����(write) // byte��쿡�� readInt
		while((s = br.readLine()) != null) {
			System.out.println(s);
		}
		
		br.close();
		fr.close();
		
		// FileInputStream f1 = new FileInputStream("aa.txt");
		// FileInputStream�� �̹��� ���Ͽ� �� ������.
		FileInputStream f1 = new FileInputStream("C:/Users/82106/Desktop/aa.txt");
		int cnt;
		while((cnt = f1.available()) > 0) { //
			byte[] b1 = new byte[cnt];
			int bada = f1.read(b1);// read()��� 1byte �о� int �� ����
			//read(byte�迭) -> �Է� ��Ʈ������ byte�迭 ũ�⸸ŭ �о� byte�迭�� ������.
			if(bada == -1) break;
			String str1 = new String(b1);
			System.out.println(str1);
			System.out.println("�����");
		}
		f1.close();
	}

}
