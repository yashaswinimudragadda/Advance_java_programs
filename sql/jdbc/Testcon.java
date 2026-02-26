package advancejavaprograms;

import java.sql.*;

public class Testcon {
    public static void main(String args[]) {
        try {
            // 1. Manually load the driver (helps debug if JAR is missing)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Fix the URL (added the colon after mysql)
            String url = "jdbc:mysql://localhost:3306/"; 
            Connection con = DriverManager.getConnection(url, "root", "1234");
            
            System.out.println("Connection successful!");
            
            con.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Error: MySQL Driver JAR not found in Build Path!");
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
}