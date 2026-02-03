package streams;
import java.io.*;
// program to write a textfile.

public class streamcode1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {
			FileOutputStream fout = new FileOutputStream("abc.txt");
			String s="Sachin Tendulkar is my favourite player";
			byte b[]=s.getBytes();
			fout.write(b);
			fout.close();
			System.out.println("success");
		}catch(Exception e) {
			System.out.println(e);
		}

	}

}
