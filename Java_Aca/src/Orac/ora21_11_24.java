package Orac;

public class ora21_11_24 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//linux : copty -> cp 원본 사본(cp.exe 인자 인자)
		
		if(args.length != 2) {
			System.out.println("인자 2개가 필요합니다.");
			//강제종료
			return;
			// c: exit(1); / 자바 : System.exit(1); / c# : Environment.Exit(1)
		}
		
		System.out.println(Integer.parseInt(args[0]) + Integer.parseInt(args[1]));
	}

}
