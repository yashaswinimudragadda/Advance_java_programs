<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Prevent caching so the user can't click "Back" to see the profile
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0);

    // 2. Clear specific session attributes if necessary
    session.removeAttribute("user_id");
    session.removeAttribute("username");

    // 3. Destroy the session entirely
    session.invalidate();

    // 4. Redirect to the login page with a success message
    response.sendRedirect("Signin.jsp?msg=logout");
%>