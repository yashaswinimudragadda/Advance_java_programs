package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Expense; // Import your Model
import uitl.DBConnection; // Import your Connection class

public class ExpenseDAO {

    // This method returns a Collection of all expenses
    public List<Expense> getAllExpenses() {
        List<Expense> list = new ArrayList<>();
        String sql = "SELECT * FROM expenses ORDER BY date_added DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                // Converting the SQL row into a Java Object
                Expense e = new Expense(
                    rs.getInt("id"),
                    rs.getString("item_name"),
                    rs.getString("category"),
                    rs.getDouble("amount"),
                    rs.getTimestamp("date_added")
                );
                list.add(e); // Adding to your ArrayList
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean addExpense(String name, String category, double amount) {
        boolean success = false;
        String sql = "INSERT INTO expenses (item_name, category, amount) VALUES (?, ?, ?)";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, amount);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}