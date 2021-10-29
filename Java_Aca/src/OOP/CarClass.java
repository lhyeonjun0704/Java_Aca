package OOP;


// 객체의 생명주기
// 생성자(construction)가 자동 생성. 초기 값을 넣는 역할
// 객체소멸 : garbage collector가 전담 (소멸자)


// 접근 지정자
// public(외부 접근 가능), private(내부), protected(상속), default(패키지)

class Car{
	private String color;
	private int door;
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getDoor() {
		return door;
	}

	public void setDoor(int door) {
		this.door = door;
	}

	public void drive() {
		
//		this.setColor(ex);
//		this.setDoor(n);
//		System.out.println(this.getColor());
//		System.out.println(this.getDoor());
		System.out.println("Drving Now");

	}
	
	@Override
	public String toString() {
		return "Car [color=" + color + ", door=" + door + "]";
	}
	
}


public class CarClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car mycar = new Car();
		
		mycar.drive();
		mycar.setColor("red");
		mycar.setDoor(4);
		System.out.println(mycar);
		
	}

}
