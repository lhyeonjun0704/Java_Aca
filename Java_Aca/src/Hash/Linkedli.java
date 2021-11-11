package Hash;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

//Queue q1 = new LinkedList();
// LinkedList <String> q1 = new LinkedList <String>();


// Stack에 음식이름 3개정도를 generic으로 넣고 다시 꺼내어 출력하는 프로그램을 작성하시오.


public class Linkedli {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Queue<String> q1 = new LinkedList<String>();
		
		q1.offer("바보");
		q1.offer("온달");
		q1.offer("평강공주");
		
		System.out.println(q1.size());
		if(!q1.isEmpty()) q1.poll();
		System.out.println(q1);
		Stack<String> st1 = new Stack<String>();
		st1.push("카레");
		st1.push("볶음밥");
		st1.push("뚝불고기");
		System.out.println(st1.size());
		
		while(!st1.isEmpty()) {
			System.out.println(st1.pop());
		}
		System.out.println(st1);
		
	}

}
