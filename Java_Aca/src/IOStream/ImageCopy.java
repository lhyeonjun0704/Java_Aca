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
		
		// if(args.length == 2){ // �������ϸ�� �纻���ϸ� ���ؼ� 2������
		fis1 = new FileInputStream("C:/Users/82106/Desktop/img_06.jpg");
		fos1 = new FileOutputStream("img_87.jpg", false); // true�� append����
		
		while((temp = fis1.read()) != -1) {
			//read() ��ȣ ���� ��������� �� ����Ʈ ������ ó��
			fos1.write(temp); // ���Ͽ� ���
			System.out.println(temp + "copying now");
		}
		System.out.println("End Copy");
		fis1.close(); fos1.close();
	}

}
