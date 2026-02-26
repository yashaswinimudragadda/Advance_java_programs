
// for inserting values into oracle
package advancejavaprograms;
import java.lang.*;
import java.sql.*;


public class CRecord {
	public static void main(String args[]) {
		try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demobase","root","1234");
		Statement stmt =con.createStatement();
		stmt.executeUpdate("insert into myemp values(102,'varun',2500,'a')");
		System.out.println("record inserted");
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}

}
