package uitl;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/projects", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    // ADD THIS TEST BLOCK TEMPORARILY
    public static void main(String[] args) {
        Connection testCon = getConnection();
        if (testCon != null) {
            System.out.println("Connection Successful! Your database is ready.");
        } else {
            System.out.println("Connection Failed! Check your URL, username, or password.");
        }
    }
}