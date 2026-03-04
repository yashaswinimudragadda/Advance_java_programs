package test;
import java.sql.*;

public class CallSelectExample {

    public static void main(String args[]) {

        try {
            // 1️⃣ Connect to database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentdb",
                "root",
                "1234"
            );

            CallableStatement stmt =
            	    con.prepareCall("{call getAllStudents()}");

            	ResultSet rs = stmt.executeQuery();

            	while(rs.next()) {
            	    System.out.println(
            	        rs.getInt("sid") + " " +
            	        rs.getString("sname") + " " +
            	        rs.getString("course") + " " +
            	        rs.getInt("marks")
            	    );
            	};

            // 4️⃣ Execute
            int count = stmt.executeUpdate();

            if(count > 0)
                System.out.println("Record selected  successfully!");
            else
                System.out.println("Selection failed!");

            // 5️⃣ Close connection
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
