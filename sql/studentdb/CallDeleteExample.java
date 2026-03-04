package test;
import java.sql.*;

public class CallDeleteExample {

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
    con.prepareCall("{call deleteStudent(?)}");

stmt.setInt(1, 301);

stmt.execute();

           

int count = stmt.executeUpdate();

if(count == 1) {
    System.out.println("Student record deleted successfully ✅");
}
else if(count == 0) {
    System.out.println("No student found with given ID ❗");
}
else {
    System.out.println("Multiple records affected (unexpected) ⚠");
}
            // 5️⃣ Close connection
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}