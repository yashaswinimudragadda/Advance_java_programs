package MethodandConstructor;

abstract class Bank{                        // abstract class contains abstract method
	                                        //it is like name 
	                                        //of work in child class we describe about 
	                                        //the what the actual work is about.
	abstract void irate();
}
class Bank1 extends Bank{
	void irate() {
		System.out.println("1% interset rate");
	}
}
class Bank2 extends Bank1{
	void irate() {
		System.out.println("11% interset rate");
	}
}

public class abstractexample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Bank1 obj=new Bank1();
		Bank2 obj2 =new Bank2();
		obj.irate();
		obj2.irate();
		

	}

}
