package com.project.dao;

import com.project.model.User;
import com.project.util.DBUtils;
import java.sql.*;

public class UserDAO {

    // 1. SIGNUP: Save a new user
    public boolean registerUser(User user) throws Exception {
        String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, "user"); // Default role
            return ps.executeUpdate() > 0;
        }
    }

    
    /* we have to fetch all the  details to reduce  database hits and stores the data in the server */
    // 2. SIGNIN: Validate user and return User object
    public User loginUser(String email, String password) throws Exception {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DBUtils.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();                           
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                return u;
            }
        }
        return null;
    }

    // 3. PROFILE: Get User details by ID
    public User getUserById(int id) throws Exception {
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection conn = DBUtils.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                return u;
            }
        }
        return null;
    }

    // 4. UPDATE: Change name and role
    public boolean updateUser(User user) throws Exception {
        String sql = "UPDATE users SET username = ?, role = ? WHERE id = ?";
        try (Connection conn = DBUtils.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getRole());
            ps.setInt(3, user.getId());
            return ps.executeUpdate() > 0;
        }
    }

    // 5. DELETE: Remove account
    public boolean deleteUser(int id) throws Exception {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection conn = DBUtils.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
}