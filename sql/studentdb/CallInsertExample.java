package test;
import java.sql.*;

public class CallInsertExample {

    public static void main(String args[]) {

        try {
            // 1️⃣ Connect to database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentdb",
                "root",
                "1234"
            );

            // 2️⃣ Prepare CallableStatement
            CallableStatement stmt =
                con.prepareCall("{call insertStudent(?,?,?,?)}");

            // 3️⃣ Set values
            stmt.setInt(1, 405);
            stmt.setString(2, "Anil");
            stmt.setString(3, "MCA");
            stmt.setInt(4, 90);

            // 4️⃣ Execute
            int count = stmt.executeUpdate();

            if(count > 0)
                System.out.println("Record inserted successfully!");
            else
                System.out.println("Insertion failed!");

            // 5️⃣ Close connection
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}