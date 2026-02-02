package MethodandConstructor;
import java.lang.*;



public class expectionhandlingexample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a=100,b=0,c;
		try {
			System.out.println("begin");
			System.out.println("ready to do divison");
			c=a/b;
			System.out.println("result= "+c);
			System.out.println("division completed");
			System.out.println("success");
		}catch(ArithmeticException e) {
			System.out.println(e);
		}
		try {
			System.out.println("begin");
			System.out.println("ready to do divison");
			c=a/b;
			System.out.println("result= "+c);
			System.out.println("division completed");
			System.out.println("success");
		}catch(ArithmeticException e) {
			System.out.println(e.toString());
		}
		try {
			System.out.println("begin");
			System.out.println("ready to do divison");
			c=a/b;
			System.out.println("result= "+c);
			System.out.println("division completed");
			System.out.println("success");
		}catch(ArithmeticException e) {
			e.printStackTrace();
		}
		try {
			System.out.println("begin");
			System.out.println("ready to do divison");
			c=a/b;
			System.out.println("result= "+c);
			System.out.println("division completed");
			System.out.println("success");
		}catch(ArithmeticException e) {
			System.out.println(e.getMessage());
		}
		finally{
			System.out.println("error");
		}
		

	}

}
