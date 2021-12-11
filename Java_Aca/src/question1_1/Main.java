package question1_1;

import java.util.Scanner;

public class Main {

	public String solution(int n, String str) {
		String answer = "";
//		System.out.println(str);
		String [] temp = str.split(" ");
		
//		for(String x: temp) {
//			System.out.println(x);
//		}
		
		answer += temp[0] + " ";
		
		for(int i = 1; i < temp.length; i++) {
			if(Integer.parseInt(temp[i]) > Integer.parseInt(temp[i-1])) {
				answer += temp[i] + " ";
			}
		}
		
		return answer;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Main T = new Main();
		Scanner sc = new Scanner(System.in);
		
		int n = sc.nextInt();
		sc.nextLine();
		String str = sc.nextLine();
		
		System.out.println(T.solution(n, str));
	}

}
