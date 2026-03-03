package test;
import java.sql.*;
import java.util.*;

public class StdBInsert {
	public static void main(String args[]) throws Exception{
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","1234");
		con.setAutoCommit(false);
		Statement stmt= con.createStatement();
		stmt.addBatch("INSERT INTO std VALUES (102,'Priya Sharma','BCA',90);");
		stmt.addBatch("INSERT INTO std VALUES (103,'Arjun Reddy','BSc',78);");
		stmt.addBatch("INSERT INTO std VALUES (104,'Sneha Patel','MBA',88);");
		stmt.addBatch("INSERT INTO std VALUES (105,'Kiran Rao','MTech',92);");
		stmt.executeBatch();
		System.out.println("records entered successfully");
		con.commit();
		con.close();
	}
	

}
