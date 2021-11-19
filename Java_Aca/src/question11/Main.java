package question11;

import java.util.Scanner;

public class Main {

	public String solution(String str) {
		String answer = "";
		int n = 1;
		
		char [] temp = str.toCharArray();
		char temp_s = 'k';
		for(int i = 0; i < temp.length; i++) {
			if(temp_s != temp[i]) {
				if(n == 1) {
					n = 1;
				} else {
					answer += String.valueOf(n);
					n = 1;
				}
				answer += String.valueOf(temp[i]);
				temp_s = temp[i];
				
			} else {
				n++;
				if(i == temp.length-1) {
					answer += String.valueOf(n);
				}
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
