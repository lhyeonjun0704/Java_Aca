package OOP;


// ��ü�� �����ֱ�
// ������(construction)�� �ڵ� ����. �ʱ� ���� �ִ� ����
// ��ü�Ҹ� : garbage collector�� ���� (�Ҹ���)


// ���� ������
// public(�ܺ� ���� ����), private(����), protected(���), default(��Ű��)

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
