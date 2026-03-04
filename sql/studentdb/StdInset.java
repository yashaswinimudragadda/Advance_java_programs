package test;
import java.util.*;
import java.sql.*;

public class StdInset {

    public static void main(String args[]) {

        System.out.println("Insert records using PreparedStatement!");

        String url = "jdbc:mysql://localhost:3306/studentdb";
        String user = "root";
        String pass = "1234";

        String sql = "INSERT INTO std VALUES(?,?,?,?)";

        try (Connection con = DriverManager.getConnection(url, user, pass);
             PreparedStatement prst = con.prepareStatement(sql);
             Scanner sc = new Scanner(System.in)) {

            System.out.print("Enter student id: ");
            int sid = sc.nextInt();
            sc.nextLine(); // clear buffer

            System.out.print("Enter student name: ");
            String sname = sc.nextLine();

            System.out.print("Enter student course: ");
            String course = sc.nextLine();

            System.out.print("Enter student marks: ");
            int marks = sc.nextInt();

            prst.setInt(1, sid);
            prst.setString(2, sname);
            prst.setString(3, course);
            prst.setInt(4, marks);

            int count = prst.executeUpdate();

            System.out.println(count + " row(s) affected");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}