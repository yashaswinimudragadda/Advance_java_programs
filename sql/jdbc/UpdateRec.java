package advancejavaprograms;
import java.util.*;
import java.sql.*;

public class UpdateRec {
	public static void main(String args[]) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demobase","root","1234");
			Statement stmt =con.createStatement();
			stmt.executeUpdate("update myemp set esal=esal+100 where egrade='a'");
			System.out.println("records is updated ");
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}

}
