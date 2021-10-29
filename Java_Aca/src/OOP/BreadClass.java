package OOP;

class Bread{
	String ty;
	int price;
	
	public String getTy() {
		return ty;
	}
	public void setTy(String ty) {
		this.ty = ty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Bread [type=" + ty + ", price=" + price + "]";
	}
	
	
}

public class BreadClass {
	public static void main(String[] args) {
		Bread bd = new Bread();
		bd.setPrice(5000);
		bd.setTy("tiramisu");
		System.out.println( bd.getTy() + " " + bd.getPrice() + "¿ø" );
		System.out.println(bd);
	}
}
