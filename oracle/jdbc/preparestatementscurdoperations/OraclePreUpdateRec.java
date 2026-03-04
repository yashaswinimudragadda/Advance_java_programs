package oracleConnections;
import java.sql.*;
import java.util.*;


public class OraclePreUpdateRec {
	public static void main(String args[] ) {
		   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
	        
	        String sql="Update EMP set egrade=? ,esal=? where eno=?";
	        
	        
	        try {
	        	
	        	Connection con=DriverManager.getConnection(host,username,password);
	        	 con.setAutoCommit(false);
	        	PreparedStatement pst=con.prepareStatement(sql);
	        	Scanner sc= new Scanner(System.in);
	        	System.out.print("enter the eno value which need to be updated: ");
	        	int eno= sc.nextInt();
	            System.out.print("enter the updated grade: ");
	            String egrade = sc.next();
	            System.out.print("enter the updated esal: ");
	            int esal = sc.nextInt();
	            
	            
	            pst.setString(1, egrade);
	            pst.setInt(2, esal);
	            pst.setInt(3, eno);
	        	
	        	int rowsupdated=pst.executeUpdate();

	            if (rowsupdated > 0) {
	                con.commit();  // ✅ Save permanently
	                System.out.println("Updation successfully completed and committed");
	            } else {
	                con.rollback(); // ❌ Undo changes
	                System.out.println("No record found. Rollback executed.");
	            }
	        	}catch(SQLException se) {
	        		se.printStackTrace();
	        	}
	}

}
