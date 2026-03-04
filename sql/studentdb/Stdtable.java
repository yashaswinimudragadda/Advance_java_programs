package test;
import java.sql.*;
import java.util.*;

public class Stdtable {
	public static void main(String args[]) {
		try {
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","1234");
			Statement stmt=con.createStatement();
			  stmt.executeUpdate(
		                "CREATE TABLE std (" +
		                "sid INT PRIMARY KEY, " +
		                "sname VARCHAR(50), " +
		                "course VARCHAR(50), " +
		                "marks INT)"
		            );
			System.out.println("table is created");
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}

}
