package MethodandConstructor;

class A{
	void methoda() {
		System.out.println("method of class a");
		}
}
class B extends A{
	void methodb() {
		System.out.println("method of class b");
	}
}


public class inheritance {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		B b= new B(); //b is object for class B.
		b.methodb();
		
		System.out.println();
	
		b.methoda();  // object of class b can also used for methods of A class.
		
		System.out.println();
		
		A a=new A();
		a.methoda();  // a is object for class A.
		
		System.out.println();
		//a.methodb(); it won't possible because it is not extending b class so it not possible to use object of a class to Class B.

	}

}
