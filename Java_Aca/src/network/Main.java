package network;

// networking
// c/s model > web 
// Thread(스레드)
// socket > websocket > stomp
// process -> 메모장파일 등이 디스크에서 실행되어 메모리에 올라온 상태
// thread ( => TSS:Time Sharing System)

// thread : 
// 	1 process - 1 thread : single thread 복사기 1대 - 일하는 사원 1명
// 	1 process - threads(multi) : 복사기 3대 일하는 사원 1명.
// 문맥스위치(context switch) : 시간이 많이 걸릴경우 빠르다고 장담 x

// 메모리와 쓰레드
// <Process> heap, code, static, stack 메모리
// <Thread가 들어가면> thread끼리 메모리 공유부분) heap, code, static / 비공유 -> 1 Thread 당 1 stack 가짐

// 멀티스레드, 멀티프로세스
// 같은 점 : 동시에 여러작업
// 차이점 : 멀티스레드 -> 작은 메모리 사용, 메모리공유 덕분에 문맥스위칭이 빠름, 한 스레드 종료 시, 다른 스레드가 종료도리 수가 있다.
// 		  멀티프로세스 -> 많은 메모리 및 CPU 사용, 한 프로세스 종료 시라도 다른 프로세스 영향 없음.

// 스레드가 되게하는 클래스 만드느 2가지 방법
// 1) java.lang.Thread 클래스를 상속: 다른 클래스와 상속이 특별히 요구되지 않는 경우, 이 때 상속으로 인해 원치않는 메소드까지 상속받는 단점.
// 2) java.lang.Runnable 인터페이스 상속: 다른 클래스와 상속관련이 되어 있는 경우 -> Runnable 사용이 좋음.

// iso : international standart organization
// osi : open system interconnection -> global 통신규약(protocol)

//socket programming 
// socket : Client Program 과 server program이 상호 통신시 , Network상의 통신 접속점 즉, 네트워크 상의 송수신은 socket 통하여 이루어짐.

class ThreadClass extends Thread{ // 상속을 바로 받고있음.
	public void run() // 다른 상속이 없는경우에만 쓰자.
	{
		System.out.println("쓰레드2");
	}
}

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThreadClass tc1 = new ThreadClass(); // delegation
		tc1.start(); // ThreadClass의 run()호출
		System.out.println("쓰레드1");
	}

}
