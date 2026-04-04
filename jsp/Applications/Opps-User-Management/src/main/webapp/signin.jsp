<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>
<%@ page import="com.project.dao.UserDAO" %>

<%
    String msg = request.getParameter("msg");
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        UserDAO dao = new UserDAO();
        try {
            User user = dao.loginUser(email, pass);
            if (user != null) {
                // Store the whole object or just the ID in session
                session.setAttribute("user_id", user.getId());
                session.setAttribute("user_name", user.getUsername());
                response.sendRedirect("profile.jsp");
                return;
            } else {
                msg = "invalid";
            }
        } catch (Exception e) {
            out.print("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">
    <div class="container" style="max-width: 400px;">
        <% if("registered".equals(msg)) { %>
            <div class="alert alert-success">Registration successful! Please login.</div>
        <% } else if("invalid".equals(msg)) { %>
            <div class="alert alert-danger">Invalid email or password.</div>
        <% } %>
        
        <div class="card shadow p-4">
            <h3 class="text-center mb-4">Login</h3>
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-success w-100">Sign In</button>
            </form>
            <p class="mt-3 text-center small">New here? <a href="signup.jsp">Create Account</a></p>
        </div>
    </div>
</body>
</html>