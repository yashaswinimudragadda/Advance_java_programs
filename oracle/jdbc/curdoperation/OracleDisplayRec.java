
// for displaying records
package oracleConnections;
import java.sql.*;

public class OracleDisplayRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
	        try {
	        	Connection con=DriverManager.getConnection(host,username,password);
	        	Statement stmt = con.createStatement();
	            System.out.println("==============================================");
	            System.out.println("ENO\tENAME\tESAL\tEGRADE");
	            System.out.println("==============================================");
	            ResultSet rs=stmt.executeQuery("select * from EMP");
	            while(rs.next()) {
	            	System.out.println(rs.getInt(1)+"\t"+
	            rs.getString(2)+"\t"+rs.getInt(3)+"\t"+rs.getString(4));
	            	
	            }
	            System.out.println("==============================================");
	            


	        }catch(SQLException se) {
	        	se.printStackTrace();
	        }

}
}
