package question5;

import java.util.Scanner;

public class Main {
	
	public String solution(String str) {
		String answer;
		char[] s = str.toCharArray();
		int lt = 0, rt = str.length()-1;
		while(lt < rt) {
			if(!Character.isAlphabetic(s[lt])) lt++; // isAlphabetic은  알파벳인가를 판별하는 함수.
			else if(!Character.isAlphabetic(s[rt])) rt--;
			else {
				char tmp = s[lt];
				s[lt] = s[rt];
				s[rt] = tmp;
				lt++;
				rt--;
			}
		}
		answer = String.valueOf(s);
		
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
