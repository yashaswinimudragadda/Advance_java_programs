package advancejavaprograms;

// for multiple records insertion

import java.lang.*;
import java.sql.*;

public class MultipleRec {
	public static void main(String args[]) {
		try {
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/demobase","root","1234");
		Statement stmt =con.createStatement();
		stmt.executeUpdate("insert into myemp values (104,'sarath',3500,'b');");
		stmt.executeUpdate("insert into myemp values (105,'sarathbabu',2500,'a');");
		stmt.executeUpdate("insert into myemp values (106,'ramu',3500,'b');");
		stmt.executeUpdate("insert into myemp values (107,'sarathbabu',2500,'a');");
		stmt.executeUpdate("insert into myemp values (108,'baalu',3500,'b');");
		stmt.executeUpdate("insert into myemp values (109,'anil',2500,'a');");
		System.out.println("records inserted success fully");
		
		}
		catch(SQLException se) {
			se.printStackTrace();
		}

		
		
		
		
	}

}
