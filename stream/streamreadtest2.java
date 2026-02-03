package streams;
import java.io.*;

public class streamreadtest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {
			FileInputStream fout = new FileInputStream("abc.txt");
			int i=0;
			while((i=fout.read())!=-1);
			{
				System.out.println((char)i);
			}
			fout.close();
			System.out.println("success");
		}catch(Exception e) {
			System.out.println(e);
		}

	}

}
