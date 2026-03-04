package oracleConnections;
import java.sql.*;

public class OracleUpdateRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
	        try {
	        	Connection con = DriverManager.getConnection(host,username,password);
	        	Statement stmt=con.createStatement();
	        	stmt.executeUpdate("update EMP set esal=esal+500 where egrade='a'");
	        	System.out.println("records updated");
	        	
	        	}catch(SQLException se) {
	        		se.printStackTrace();
	        	}

}
}
