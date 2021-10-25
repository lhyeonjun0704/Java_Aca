package OOP;

class Car{
	String color;
	int door;
	public void drive() {
		System.out.println("Drving Now");
	}	
	
}


public class CarClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car mycar = new Car();
		mycar.drive();
		mycar.color = "blue";
		System.out.println(mycar.color);
	}

}
