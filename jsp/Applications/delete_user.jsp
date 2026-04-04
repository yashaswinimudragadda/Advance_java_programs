<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.dao.UserDAO" %>

<%
    // 1. Session Protection
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("signin.jsp");
        return;
    }

    int id = (int) session.getAttribute("user_id");

    // 2. Process Delete Action
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("confirmDelete") != null) {
        UserDAO dao = new UserDAO();
        try {
            if (dao.deleteUser(id)) {
                session.invalidate(); // Destroy session after deletion
                response.sendRedirect("signin.jsp?msg=deleted");
                return;
            }
        } catch (Exception e) {
            out.print("<div class='alert alert-danger'>Error deleting account: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Delete Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">
    <div class="container" style="max-width: 500px;">
        <div class="card shadow-sm border-0">
            <div class="card-body p-5 text-center">
                <h2 class="text-danger mb-3">Wait!</h2>
                <p class="text-muted">Are you sure you want to delete your account? This action is permanent and all your data will be lost.</p>
                
                <form method="post">
                    <div class="d-grid gap-2">
                        <button type="submit" name="confirmDelete" class="btn btn-danger btn-lg">Yes, Delete My Account</button>
                        <a href="profile.jsp" class="btn btn-light border">No, Take Me Back</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>