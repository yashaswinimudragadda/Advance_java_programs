package model;

import java.sql.Timestamp;

/**
 * This is a 'Plain Old Java Object' (POJO).
 * It mirrors the 'expenses' table in your MySQL database.
 */
public class Expense {
    private int id;
    private String itemName;
    private String category;
    private double amount;
    private Timestamp dateAdded;

    // Default Constructor
    public Expense() {}

    // Constructor to quickly create an object when fetching from SQL
    public Expense(int id, String itemName, String category, double amount, Timestamp dateAdded) {
        this.id = id;
        this.itemName = itemName;
        this.category = category;
        this.amount = amount;
        this.dateAdded = dateAdded;
    }

    // Getters
    // Note: JSTL uses these getters to show data. 
    // e.g., ${e.itemName} calls getItemName()
    
    public int getId() {
        return id;
    }

    public String getItemName() {
        return itemName;
    }

    public String getCategory() {
        return category;
    }

    public double getAmount() {
        return amount;
    }

    public Timestamp getDateAdded() {
        return dateAdded;
    }

    // Setters (Useful if you need to modify an object later)
    public void setId(int id) { this.id = id; }
    public void setItemName(String itemName) { this.itemName = itemName; }
    public void setCategory(String category) { this.category = category; }
    public void setAmount(double amount) { this.amount = amount; }
    public void setDateAdded(Timestamp dateAdded) { this.dateAdded = dateAdded; }
}