package oracleConnections;
import java.sql.*;
import java.util.Scanner;
import java.io.*;

public class OraclePreDeleteRec {public static void main(String args[] ) {
	   String host = "jdbc:oracle:thin:@db.freesql.com:1521/23ai_34ui2";
       String username = "MUDRAGADDARAJANIY_SCHEMA_EOTQZ";
       String password = "QMR7OVw1FH5653XOT1AES0S#W77G2H";
       
       try {
    	   Connection con=DriverManager.getConnection(host,username,password);
    	   PreparedStatement pst=con.prepareStatement("delete from EMP where eno=?");
    	   Scanner sc=new Scanner(System.in);
    	   System.out.print("enter employee number(eno) to delete ");
    	   int eno=sc.nextInt();
    	   pst.setInt(1, eno);
    	   int rowDeleted=pst.executeUpdate();
    	   if(rowDeleted>0) {
    		   System.out.println("record is deleted successfully");
    	   }else {
    		   System.out.println("No record found from eno:"+eno );
    	   }
    	   
       }catch(SQLException se) {
    	   se.printStackTrace();
       }
}
}


