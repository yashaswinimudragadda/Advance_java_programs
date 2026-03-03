package test;
import java.sql.*;
import java.util.*;

public class StdBatchCallabeltoInsert {
	public static void main(String args[]) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","1234");
			CallableStatement stmt=con.prepareCall("{call insertStudent(?,?,?,?)}");
			stmt.setInt(1, 301);
			stmt.setString(2, "Teja");
			stmt.setString(3,"MCA");
			stmt.setInt(4, 89);
			stmt.addBatch();
			
			stmt.setInt(1, 302);
			stmt.setString(2, "Roja");
			stmt.setString(3,"MCA");
			stmt.setInt(4, 99);
			stmt.addBatch();
			
		    int[] result = stmt.executeBatch();

            System.out.println("Batch insert using procedure successfully!");
            System.out.println("Number of rows inserted: " + result.length);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}

}
