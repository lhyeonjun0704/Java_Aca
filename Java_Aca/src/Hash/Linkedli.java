package Hash;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

//Queue q1 = new LinkedList();
// LinkedList <String> q1 = new LinkedList <String>();


// Stack�� �����̸� 3�������� generic���� �ְ� �ٽ� ������ ����ϴ� ���α׷��� �ۼ��Ͻÿ�.


public class Linkedli {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Queue<String> q1 = new LinkedList<String>();
		
		q1.offer("�ٺ�");
		q1.offer("�´�");
		q1.offer("�򰭰���");
		
		System.out.println(q1.size());
		if(!q1.isEmpty()) q1.poll();
		System.out.println(q1);
		Stack<String> st1 = new Stack<String>();
		st1.push("ī��");
		st1.push("������");
		st1.push("�ҺҰ��");
		System.out.println(st1.size());
		
		while(!st1.isEmpty()) {
			System.out.println(st1.pop());
		}
		System.out.println(st1);
		
	}

}
