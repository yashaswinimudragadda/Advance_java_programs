package test;
import java.sql.*;
import java.util.*;
public class StdBUpdate {
	public static void main(String [] args) {
		try {
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","1234");
			CallableStatement stmt=con.prepareCall("{call updateMarks(?,?)}");
			
			stmt.setInt(1, 301);
			stmt.setInt(2, 32);
			stmt.addBatch();
			
			stmt.setInt(1, 203);
			stmt.setInt(2,98);
			stmt.addBatch();
			
			
			int [] result=stmt.executeBatch();
			System.out.println("update rows: "+result.length);
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
