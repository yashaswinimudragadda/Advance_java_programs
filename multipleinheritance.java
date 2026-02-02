package MethodandConstructor;

class A1{
	void methoda() {
		System.out.println("method of class a");
	}
}
class B1 extends A1{
	void methodb(){
		System.out.println("method of b");
	}
}
class C extends B1{
	void methodc() {
		System.out.println("method of c");
	}
}

public class multipleinheritance {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		C c=new C();// c is object of class c.
		c.methoda();
		c.methodb();
		c.methodc();
		System.out.println();
		B b=new B();
		b.methodb();
		b.methoda();
		System.out.println();
		A a=new A();
		a.methoda();
		
		

	}

}
