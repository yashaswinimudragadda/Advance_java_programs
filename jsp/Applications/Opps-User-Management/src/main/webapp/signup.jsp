<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>
<%@ page import="com.project.dao.UserDAO" %>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));

        UserDAO dao = new UserDAO();
        try {
            if (dao.registerUser(user)) {
                response.sendRedirect("signin.jsp?msg=registered");
            }
        } catch (Exception e) {
            out.print("<div class='alert alert-danger m-0'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">
    <div class="container" style="max-width: 400px;">
        <div class="card shadow p-4">
            <h3 class="text-center mb-4">Create Account</h3>
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>
            <p class="mt-3 text-center small">Already have an account? <a href="signin.jsp">Login</a></p>
        </div>
    </div>
</body>
</html>