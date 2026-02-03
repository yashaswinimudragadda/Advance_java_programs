package streams;

import java.io.FileInputStream;
import java.io.*;

public class streamwritetest3 {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		try {
			FileInputStream fout = new FileInputStream("abc.txt");
			FileOutputStream fin=new FileOutputStream("xyz.txt");
			
			int i=0;
			while((i=fout.read())!=-1) {
				fin.write((byte)i);
			}
			fout.close();
			System.out.println("success");
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
