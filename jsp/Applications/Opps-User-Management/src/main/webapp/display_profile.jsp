<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.User" %>
<%@ page import="com.project.dao.UserDAO" %>

<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("signin.jsp");
        return;
    }

    int id = (int) session.getAttribute("user_id");
    UserDAO dao = new UserDAO();
    User user = dao.getUserById(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark mb-4">
        <div class="container">
            <span class="navbar-brand">User Dashboard</span>
            <a href="logout.jsp" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </nav>

    <div class="container">
        <% if("updated".equals(request.getParameter("status"))) { %>
            <div class="alert alert-success">Profile updated successfully!</div>
        <% } %>

        <div class="card mx-auto shadow border-0" style="max-width: 600px;">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <div class="bg-info text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width:100px; height:100px; font-size: 3rem;">
                        <%= user.getUsername().substring(0,1).toUpperCase() %>
                    </div>
                    <h3><%= user.getUsername() %></h3>
                    <span class="badge bg-primary px-3"><%= user.getRole() %></span>
                </div>

                <table class="table">
                    <tr>
                        <th class="text-muted">Email:</th>
                        <td><%= user.getEmail() %></td>
                    </tr>
                    <tr>
                        <th class="text-muted">User ID:</th>
                        <td>#<%= user.getId() %></td>
                    </tr>
                </table>

                <div class="mt-4 d-grid gap-2">
                    <a href="profile.jsp" class="btn btn-outline-primary">Update Profile Information</a>
                    <a href="delete_user.jsp" class="btn btn-link text-danger">Delete My Account</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>