import java.util.ArrayList;
import java.util.Scanner;

public class LogicTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		String result = "";
		String temp = "";
		int temp_int = 0;
		int last_result = 0;
		
		ArrayList<String> oper = new ArrayList<>();
		ArrayList<String> numex = new ArrayList<>();
		ArrayList<Integer> result_num = new ArrayList<>();
		
		result = sc.nextLine();
		for(int i = 0; i < result.length(); i++) {
			
			if(result.charAt(i) >= 40 & result.charAt(i) < 47) {
				oper.add(result.substring(i, i+1));
				for(String x : numex) {
					temp += x;
//					System.out.println(temp);
				}
				numex.clear();
				temp_int = Integer.parseInt(temp);
				temp = "";
				result_num.add(temp_int);
//				System.out.println(temp);
			}
			
			else if(result.charAt(i) >= 48 & result.charAt(i) <= 57) {
				
				if(i == result.length() -1) {
					numex.add(result.substring(i, i+1)); 
//					System.out.println(numex);
					for(String x : numex) {
//						System.out.println(x);
						temp += x;
//						System.out.println(temp);
					}
					numex.clear();
					temp_int = Integer.parseInt(temp);
					temp = "";
					result_num.add(temp_int);
//					System.out.println(temp);
				} else numex.add(result.substring(i, i+1)); 
				
				
			}
			
		}
		
//		System.out.println(result_num.get(0) + result_num.get(1));
//		String st = "*";
//		System.out.println(st.getClass());
//		System.out.println(oper.get(0).getClass() == st.getClass());
//		System.out.println(oper.get(0) == st);
		
		for(int i = 0; i < oper.size(); i++) {
			if(oper.get(i).equals("+")) {
				if(i == 0) {
					last_result = result_num.get(i) + result_num.get(i+1);
				}else {
					last_result += result_num.get(i+1);
				}
			} else if(oper.get(i).equals("*")) {
				if(i == 0) {
					System.out.println(result_num.get(i));
					System.out.println(result_num.get(i+1));
					last_result = result_num.get(i) * result_num.get(i+1);
				}else {
					last_result = last_result * result_num.get(i+1);
				}
			} else if(oper.get(i).equals("/")) {
				if(i == 0) {
					last_result = result_num.get(i) / result_num.get(i+1);
				}else {
					last_result /= result_num.get(i+1);
				}
			} else if(oper.get(i).equals("-")) {
				if(i == 0) {
					last_result = result_num.get(i) - result_num.get(i+1);
				}else {
					last_result -= result_num.get(i+1);
				}
			}
		}
		
//		System.out.println(result_num);
		
		System.out.println("oper : " + oper);
		System.out.println("numex : " + numex);
		
		System.out.println(last_result);
		
	}

}
