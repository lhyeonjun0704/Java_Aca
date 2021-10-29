package IOStream;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

// DB : oracle, mssql, mysql, maradb

//file의 스트림
// 그림파일 복사, 전송
// 01110110000111 babo 강 바다

// stream : byte stream / 문자 stream
// (input / output stream) (reader, writer)

// 파일 작성방법  - 텍스트뷰어
// open - read(메모리 -> 출력) - close

public class Iost {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//open
		FileReader fr = new FileReader("C:/Users/82106/Desktop/aa.txt");
		
		BufferedReader br = new BufferedReader(fr);
		
		//read는 파일에서 읽어서 to 기억창고(변수)
		// write는 키보드 등으로 입려갛여 to 파일에
		String s = null;
		//file read - 화면출력(write) // byte경우에는 readInt
		while((s = br.readLine()) != null) {
			System.out.println(s);
		}
		
		br.close();
		fr.close();
		
		// FileInputStream f1 = new FileInputStream("aa.txt");
		// FileInputStream은 이미지 파일에 더 적합함.
		FileInputStream f1 = new FileInputStream("C:/Users/82106/Desktop/aa.txt");
		int cnt;
		while((cnt = f1.available()) > 0) { //
			byte[] b1 = new byte[cnt];
			int bada = f1.read(b1);// read()라면 1byte 읽어 int 에 넣음
			//read(byte배열) -> 입력 스트림에서 byte배열 크기만큼 읽어 byte배열에 저장함.
			if(bada == -1) break;
			String str1 = new String(b1);
			System.out.println(str1);
			System.out.println("출력중");
		}
		f1.close();
	}

}
