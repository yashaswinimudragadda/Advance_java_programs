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

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        user.setUsername(request.getParameter("new_username"));
        user.setEmail(request.getParameter("new_email"));
        user.setRole(request.getParameter("new_role"));
        
        if(dao.updateUser(user)) {
            // Redirect to the DISPLAY page after successful save
            response.sendRedirect("display_profile.jsp?status=updated");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card mx-auto shadow-sm" style="max-width: 500px;">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Edit Your Information</h5>
            </div>
            <div class="card-body">
                <form method="post">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="new_username" class="form-control" value="<%= user.getUsername() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="new_email" class="form-control" value="<%= user.getEmail() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Role</label>
                        <input type="text" name="new_role" class="form-control" value="<%= user.getRole() %>" required>
                    </div>
                    <div class="d-flex justify-content-between">
                        <a href="display_profile.jsp" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>