package MethodandConstructor;
import java.lang.*;
class InvalidAgeException extends Exception{
	int x;
	public String toString() {
		return "you are not eligible to vote";
	}
}
class Demo{
	void agecheck(int age) throws InvalidAgeException{
		if(age<18) {
			throw new InvalidAgeException();
		}
		else {
			System.out.println("you are eligible to vote");
		}
	}
}

public class userdefinedexceptionmethod {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Demo D=new Demo();
		try {
			D.agecheck(5);
		}catch(InvalidAgeException e) {
			e.printStackTrace();
		}
		finally {
			System.out.println("ask others to vote");
		}

	}

}
