package MethodandConstructor;


class Mycalci { // why should not we use public class Mycalci here.
	int a;
	int b;
	int c;
	int mysum() {
		return a+b+c;
	}
	int mysum(int x, int y) {
		int a=x;
		int b=y;
		return a+b;
	}
	int mysum(int x, int y, int z) {
		int a=x;
		int b=y;
	    int c=z;
		return a+b+c; 
	}
}
public class overloadingmethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Mycalci mc = new Mycalci();
		mc.a=1;
		mc.b=2;
		mc.c=1;
		System.out.println(mc.mysum());
		System.out.println(mc.mysum(2,4));
		System.out.println(mc.mysum(1,1,1));

	}

}
