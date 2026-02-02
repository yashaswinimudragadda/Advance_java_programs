package MethodandConstructor;

class H1{
	void methodh1(){
		System.out.println("method of classh1");
	}
}
class H2 extends H1{
	void methodh2(){
		System.out.println("method of classh2");
	}
}
class H3 extends H1{
	void methodh3() {
		System.out.println("method of classh3");
	}
}
class H4 extends H1{
	void methodh4() {
		System.out.println("method of classh4");
	}
}

public class heiranchicalinheritance {

	public static void main(String[] args) {
		H4 obj4 = new H4();
		obj4.methodh1(); // Works (Inherited from Parent)
		obj4.methodh4(); // Works (Own method)
		
		// To access H2's methods, you need an H2 object
		H2 obj2 = new H2();
		obj2.methodh2(); 
		obj2.methodh1(); // Also works!
		
		H3 obj3 = new H3();
		obj3.methodh1();
		obj3.methodh3();//works ( in can call the own method and parent methods
		
	}
}
