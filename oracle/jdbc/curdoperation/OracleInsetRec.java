//multiple records insertion

package oracleConnections;
import java.sql.*;

public class OracleInsetRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
	        try {
	        	Connection con = DriverManager.getConnection(host,username,password);
	        	Statement stmt= con.createStatement();
	        	stmt.executeUpdate("insert into EMP values (102,'varun',2500,'a')");
	        	stmt.executeUpdate("insert into EMP values (103,'gani',5500,'b')");
	        	stmt.executeUpdate("insert into EMP values (102,'nani',2500,'c')");
	        	System.out.println("record Inserted");
	        	
	        	
	        }catch(SQLException se) {
	        	se.printStackTrace();
	        }
	}
}
