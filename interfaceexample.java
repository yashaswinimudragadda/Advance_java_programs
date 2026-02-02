package MethodandConstructor;
interface I1{
	void greetone();
}
interface I2{
	void greetTwo();
}
class I3 implements I1,I2{
	public void greetone() {
		System.out.println("hello");
	}
	public void greetTwo() {
		System.out.println("world");
	}
}
public class interfaceexample {

	public static void main(String[] args) {
		// using interface we can include the methods in other class
		
		I3 objc = new I3();
		objc.greetone();
		objc.greetTwo();

	}

}
