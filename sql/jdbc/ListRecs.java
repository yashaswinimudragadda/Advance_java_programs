package advancejavaprograms;
import java.util.*;
import java.sql.*;


public class ListRecs {
public static void main(String args[]) {
	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demobase","root","1234");
		Statement stmt=con.createStatement();
		System.out.println("====================================================");
		System.out.println("ENO\tENAME\t\t\tESAL\tEGRADE");
		System.out.println("====================================================");
		ResultSet rs=stmt.executeQuery("select * from myemp");
		while(rs.next()) {
			System.out.println(rs.getInt(1)+"\t"+rs.getString(2)+"\t\t\t"+rs.getInt(3)+"\t"+rs.getString(4));
		}}catch(SQLException se) {
			se.printStackTrace();
		}
	System.out.println("====================================================");

	}

}
