<%
    // 1. Clear session data
    session.invalidate();

    // 2. Redirect with a logout message
    response.sendRedirect("index.jsp?msg=logout");
%>