<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 1. Session Check
    if(session.getAttribute("user_id") == null) {
        response.sendRedirect("signin.jsp");
        return;
    }

    int userId = (int)session.getAttribute("user_id");
    String dbUrl = "jdbc:mysql://localhost:3306/projects"; 
    
    // 2. Handle Update Logic
    if("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("update") != null) {
        String newName = request.getParameter("name");
        String newRole = request.getParameter("role");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection conn = DriverManager.getConnection(dbUrl, "root", "1234");
            
            // CRITICAL: Ensure 'fullname' and 'role' match your DB column names exactly
            PreparedStatement ps = conn.prepareStatement("UPDATE users SET username=?, role=? WHERE id=?");
            ps.setString(1, newName);
            ps.setString(2, newRole);
            ps.setInt(3, userId);
            
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0) {
                session.setAttribute("username", newName); // Update the navbar greeting
                out.print("<div class='alert alert-success m-0 rounded-0 text-center'>Profile updated successfully!</div>");
            }
            conn.close();
        } catch(Exception e) {
            out.print("<div class='alert alert-danger m-0 rounded-0'>" + e.getMessage() + "</div>");
        }
    }
    
    // 3. Fetch User Data
    String name="", email="", role="";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Added driver load here too
        Connection conn = DriverManager.getConnection(dbUrl, "root", "1234");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE id=?");
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            // CRITICAL: Ensure these match your DB columns (e.g., 'fullname' vs 'name')
            name = rs.getString("username"); 
            email = rs.getString("email");
            role = rs.getString("role");
        }
        conn.close();
    } catch(Exception e) {
        out.print("");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { min-height: 100vh; display: flex; flex-direction: column; }
        .main-content { flex: 1; display: flex; align-items: center; padding: 40px 0; }
        .profile-card { max-width: 500px; width: 100%; margin: auto; }
    </style>
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
        <div class="container">
            <a class="navbar-brand" href="#">User Dashboard</a>
            <div class="ms-auto">
                <span class="text-light me-3">Welcome, <%= (session.getAttribute("username") != null ? session.getAttribute("username") : "User") %></span>
                <a href="logout.jsp" class="btn btn-outline-danger btn-sm">Logout</a>
            </div>
        </div>
    </nav>

    <div class="main-content">
        <div class="container">
            <div class="card shadow profile-card p-4">
                <div class="text-center mb-4">
                    <h3 class="fw-bold">Profile Settings</h3>
                    <p class="text-muted small">Update your personal information below</p>
                </div>
                
                <form method="post">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Full Name</label>
                        <input type="text" name="name" value="<%= name != null ? name : "" %>" class="form-control" placeholder="Enter full name">
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Email Address</label>
                        <input type="text" value="<%= email != null ? email : "" %>" class="form-control bg-white" disabled>
                        <div class="form-text">Email cannot be changed.</div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Role</label>
                        <input type="text" name="role" value="<%= role != null ? role : "" %>" class="form-control" placeholder="student/staff">
                    </div>

                    <div class="d-grid gap-2 mt-4">
                        <button type="submit" name="update" class="btn btn-primary">Save Changes</button>
                    </div>

                    <div class="mt-3 text-center">
                        <a href="delete_user.jsp" class="text-danger small text-decoration-none" 
                           onclick="return confirm('Are you sure you want to permanently delete your account?')">
                           Delete Account
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>