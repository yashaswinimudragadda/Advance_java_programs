package oracleConnections;
import java.sql.*;
import java.util.*;

public class OraclePreDisplayRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
	        String sql = "select eno,ename, esal, egrade from EMP where eno=?";
	        try {
	        	 Connection con=DriverManager.getConnection(host,username,password);
	        	PreparedStatement pst=con.prepareStatement(sql);
	        	Scanner sc=new Scanner(System.in);
	        	System.out.print("enter the eno number of the person: ");
	        	int eno=sc.nextInt();
	        	pst.setInt(1, eno);
	        	
	        	ResultSet rs=pst.executeQuery();
	        	if(rs.next()) {
	        		System.out.println("Employee detail: ");
	        		System.out.println("Eno: "+rs.getInt("eno"));
	        		System.out.println("Ename: "+rs.getString("ename"));
	        		System.out.println("Esal: "+rs.getInt("esal"));
	        		System.out.println("Egrade: "+rs.getString("egrade"));
	        		
	        	}else {
	        		System.out.println("no record found for eno: "+eno);
	        	}
	        }catch(SQLException se) {
	        	se.printStackTrace();
	        }
	}

}
