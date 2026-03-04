package test;

import java.sql.*;

public class StdBDelete {

    public static void main(String args[]) {

        try {
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentdb",
                "root",
                "1234"
            );

            CallableStatement stmt =
                con.prepareCall("{call deleteStudent(?)}");

            stmt.setInt(1, 301);
            stmt.addBatch();

            int[] result = stmt.executeBatch();

            System.out.println("Deleted rows: " + result.length);

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}