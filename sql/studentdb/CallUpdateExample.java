package test;
import java.sql.*;

public class CallUpdateExample {

    public static void main(String args[]) {

        try {
            // 1️⃣ Connect to database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentdb",
                "root",
                "1234"
            );

            CallableStatement stmt =
            	    con.prepareCall("{call updateMarks(?,?)}");

            	stmt.setInt(1, 401);
            	stmt.setInt(2, 95);

            	stmt.execute();

            // 4️⃣ Execute
            int count = stmt.executeUpdate();

            if(count > 0)
                System.out.println("Record updated successfully!");
            else
                System.out.println("updation  failed!");

            // 5️⃣ Close connection
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}