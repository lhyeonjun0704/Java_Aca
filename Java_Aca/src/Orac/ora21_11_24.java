package Orac;

public class ora21_11_24 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//linux : copty -> cp ���� �纻(cp.exe ���� ����)
		
		if(args.length != 2) {
			System.out.println("���� 2���� �ʿ��մϴ�.");
			//��������
			return;
			// c: exit(1); / �ڹ� : System.exit(1); / c# : Environment.Exit(1)
		}
		
		System.out.println(Integer.parseInt(args[0]) + Integer.parseInt(args[1]));
	}

}
