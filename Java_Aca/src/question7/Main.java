package question7;

import java.util.Scanner;

public class Main {
	
	public String solution(String str) {
		String answer = "";
		str = str.toUpperCase();
		int lt = 0, rt = str.length() - 1;
		while(lt<rt) {
			if(str.charAt(lt) != str.charAt(rt)) {
				System.out.println("NO");
				break;
			}else {
				continue;
			}
		}
		
		return answer;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Main T = new Main();
		Scanner sc = new Scanner(System.in);
		String str = sc.next();
		
		System.out.println(T.solution(str));
		
	}

}
