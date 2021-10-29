package IOStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ImageCopy {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		int temp = 0;
		FileInputStream fis1 = null;
		FileOutputStream fos1 = null;
		
		// if(args.length == 2){ // 원본파일명과 사본파일명 합해서 2개파일
		fis1 = new FileInputStream("C:/Users/82106/Desktop/img_06.jpg");
		fos1 = new FileOutputStream("img_87.jpg", false); // true는 append개념
		
		while((temp = fis1.read()) != -1) {
			//read() 괄호 안이 비어있으면 한 바이트 단위로 처리
			fos1.write(temp); // 파일에 출력
			System.out.println(temp + "copying now");
		}
		System.out.println("End Copy");
		fis1.close(); fos1.close();
	}

}
