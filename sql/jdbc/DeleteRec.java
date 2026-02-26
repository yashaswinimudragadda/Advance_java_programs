package advancejavaprograms;
import java.util.*;
import java.sql.*;

public class DeleteRec {
public static void main(String args[]) {
	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demobase","root","1234");
		Statement stmt =con.createStatement();
		stmt.executeUpdate("Delete from myemp where egrade='a'");
		System.out.println("record are deleted");
	}catch(SQLException se) {
		se.printStackTrace();
	}
}
}
