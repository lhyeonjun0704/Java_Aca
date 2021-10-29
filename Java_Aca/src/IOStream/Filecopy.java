package IOStream;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

// Q) e:/aa.txt를 복사하여 e:/ff.txt를 만드는 file 복사프로그램을 작성하시오.


public class Filecopy {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(new FileReader("C:/Users/82106/Desktop/aa.txt"));
		
		PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter("C:/Users/82106/Desktop/ff.txt")));
		
		//FileReader fr = new FileReader("");
		//BufferedReader br = new BufferedReader(fr);
		
		//FileWriter fw = new FileWriter("");
		//BufferedWriter bw = new BufferedWriter(fw);
		
		String s = null;
		while((s = br.readLine()) != null) {
			System.out.println("copy now");
			pw.println(s);
		}
		br.close(); pw.close();
	}

}
