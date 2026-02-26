package advancejavaprograms;
import java.util.*;
import java.sql.*;

public class Ctable {

	public static void main(String args[]) {
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demobase","root","1234");
			Statement stmt =con.createStatement();
			stmt.execute("create table myemp(eno int,ename varchar(225),esal int,egrade char(3))");
			System.out.println("table is sucessfully created");
		}catch(SQLException se) {
			se.printStackTrace();
		}
		
	}
}
