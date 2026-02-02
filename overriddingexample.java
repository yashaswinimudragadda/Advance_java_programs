package MethodandConstructor;

class person{
	void walk() {
		System.out.println("person walk slowly.");
	}
}
class employee extends person{
	void walk() {
		System.out.println("employee walks speedly");
	}
}

public class overriddingexample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		employee E =new employee();
		E.walk(); // here the parent methods are not printed only the methods in child are printed this is the example of the overridding /Polymorphism.

	}

}
