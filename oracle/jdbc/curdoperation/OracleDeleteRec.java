// program to  delete the records

package oracleConnections;
import java.sql.*;

public class OracleDeleteRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
	        try {
	        	Connection con= DriverManager.getConnection(host,username,password);
	        	Statement stmt = con.createStatement();
	        	stmt.executeUpdate("delete from EMP where egrade='a'");
	        	System.out.println("deleted records");
	        }catch(SQLException se) {
	        	se.printStackTrace();
	        }

}
}
