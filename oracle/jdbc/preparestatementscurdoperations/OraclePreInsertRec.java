// program to enter the values in run time.
package oracleConnections;

import java.sql.*;
import java.util.Scanner;
import java.io.*;

public class OraclePreInsertRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
		try {
			Connection con=DriverManager.getConnection(host,username,password);
			try {
				String sql="insert into EMP values (?,?,?,?)";
				PreparedStatement pst=con.prepareStatement(sql);
				Scanner sc=new Scanner(System.in);
				System.out.print("enter the eno value: ");
				int eno=sc.nextInt();
				pst.setInt(1,eno);
				System.out.print("enter the ename value");
				String ename=sc.next();
				pst.setString(2, ename);
				System.out.print("enter the esal value");
				int esal=sc.nextInt();
				pst.setInt(3,esal);
				System.out.print("enter the egrade value");
				String egrade=sc.next();
				pst.setString(4,egrade);
			
				int count =pst.executeUpdate();
				System.out.println(count+" row(s) affected");
				con.close();
			}
			catch(SQLException s) {
				System.out.println(s);
			}
			
		}catch(Exception s) {}
	}

}
