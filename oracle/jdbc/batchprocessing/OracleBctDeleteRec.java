package oracleConnections;
import java.sql.*;
import java.util.Scanner;

public class OracleBctDeleteRec {
	  public static void main(String[] args) {

	        String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
	        String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
	        String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";

	        Connection con = null;
	        
	        
	        try {
	        	 con = DriverManager.getConnection(host, username, password);
	             con.setAutoCommit(false);
	             
	             // -------- Statement Batch --------
	             
	             Statement stmt=con.createStatement();
	             stmt.addBatch("delete from EMP where egrade='a'");
	             
	             int[] done = stmt.executeBatch();

		        	if(done[0] > 0){
		        	    System.out.println("Statement batch update successful. Rows updated: " + done[0]);
		        	}else{
		        	    System.out.println("No rows updated in Statement batch.");
		        	}
	             stmt.executeBatch();
	             
	             // -------- PreparedStatement Batch --------
	             
	             PreparedStatement pst=con.prepareStatement("delete from EMP where eno=?");
	             Scanner sc=new Scanner(System.in);
	      	     System.out.print("enter employee number(eno) to delete ");
	      	     int eno=sc.nextInt();
	      	     pst.setInt(1, eno);
	      	     pst.addBatch();
	      	     
	      	     int[] result = pst.executeBatch();
	      	     con.commit();
	             
	      	      if(result[0] > 0) {
	                System.out.println("Record deleted successfully");
	               } else {
	                System.out.println("No record found with eno: " + eno);
	               }
	             
	      	    stmt.close();
	            pst.close();
	            con.close();
	            sc.close(); 
	             
	        }catch(SQLException se) {

	            try {
	                if(con != null)
	                    con.rollback();
	            } catch(SQLException e) {
	                e.printStackTrace();
	            }
	            se.printStackTrace();
	        }
	        
	      
	  }
}
	  

