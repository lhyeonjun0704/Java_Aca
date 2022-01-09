package network;

// networking
// c/s model > web 
// Thread(������)
// socket > websocket > stomp
// process -> �޸������� ���� ��ũ���� ����Ǿ� �޸𸮿� �ö�� ����
// thread ( => TSS:Time Sharing System)

// thread : 
// 	1 process - 1 thread : single thread ����� 1�� - ���ϴ� ��� 1��
// 	1 process - threads(multi) : ����� 3�� ���ϴ� ��� 1��.
// ���ƽ���ġ(context switch) : �ð��� ���� �ɸ���� �����ٰ� ��� x

// �޸𸮿� ������
// <Process> heap, code, static, stack �޸�
// <Thread�� ����> thread���� �޸� �����κ�) heap, code, static / ����� -> 1 Thread �� 1 stack ����

// ��Ƽ������, ��Ƽ���μ���
// ���� �� : ���ÿ� �����۾�
// ������ : ��Ƽ������ -> ���� �޸� ���, �޸𸮰��� ���п� ���ƽ���Ī�� ����, �� ������ ���� ��, �ٸ� �����尡 ���ᵵ�� ���� �ִ�.
// 		  ��Ƽ���μ��� -> ���� �޸� �� CPU ���, �� ���μ��� ���� �ö� �ٸ� ���μ��� ���� ����.

// �����尡 �ǰ��ϴ� Ŭ���� ����� 2���� ���
// 1) java.lang.Thread Ŭ������ ���: �ٸ� Ŭ������ ����� Ư���� �䱸���� �ʴ� ���, �� �� ������� ���� ��ġ�ʴ� �޼ҵ���� ��ӹ޴� ����.
// 2) java.lang.Runnable �������̽� ���: �ٸ� Ŭ������ ��Ӱ����� �Ǿ� �ִ� ��� -> Runnable ����� ����.

// iso : international standart organization
// osi : open system interconnection -> global ��űԾ�(protocol)

//socket programming 
// socket : Client Program �� server program�� ��ȣ ��Ž� , Network���� ��� ������ ��, ��Ʈ��ũ ���� �ۼ����� socket ���Ͽ� �̷����.

class ThreadClass extends Thread{ // ����� �ٷ� �ް�����.
	public void run() // �ٸ� ����� ���°�쿡�� ����.
	{
		System.out.println("������2");
	}
}

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadClass tc1 = new ThreadClass(); // delegation
		tc1.start(); // ThreadClass�� run()ȣ��
		System.out.println("������1");
	}

}
