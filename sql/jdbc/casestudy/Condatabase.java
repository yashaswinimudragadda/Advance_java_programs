package advancejavaprograms;
import java.util.*;
import java.sql.*;

public class Condatabase {
public static void main(String arg[]) {
	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","1234");
		Statement stmt = con.createStatement();
		System.out.println("connection successfull");
		stmt.execute("create database demobase");
		System.out.println("successfully create database");
		
	}catch (SQLException se) {
        se.printStackTrace();
    }
}
}