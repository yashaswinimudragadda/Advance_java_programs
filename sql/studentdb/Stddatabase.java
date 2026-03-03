package test;

import java.sql.*;
import java.lang.*;

public class Stddatabase {

	public static void main(String args[]) {
		try {
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","1234");
			 Statement stmt = con.createStatement();
	            System.out.println("Connection created successfully");
	            stmt.execute("CREATE DATABASE studentdb");
	            System.out.println("Database created successfully");
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
	}
}
