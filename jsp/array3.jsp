<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic Array Input</title>
</head>
<body>
    <h2>Array Input via JSP</h2>

    <%-- Part 1: Ask for the size --%>
    <% if (request.getParameter("size") == null) { %>
        <form method="get">
            Enter Size of Array: <input type="number" name="size" required>
            <button type="submit">Next</button>
        </form>
    <% } %>

    <%-- Part 2: Generate input fields based on the size --%>
    <% 
        String sizeParam = request.getParameter("size");
        if (sizeParam != null && request.getParameter("val0") == null) {
            int n = Integer.parseInt(sizeParam);
    %>
        <form method="post">
            <input type="hidden" name="finalSize" value="<%= n %>">
            <% for (int i = 0; i < n; i++) { %>
                Enter value for index <%= i %>: 
                <input type="number" name="val<%= i %>" required><br>
            <% } %>
            <button type="submit">Display Array</button>
        </form>
    <% } %>

    <%-- Part 3: Process and Display the results --%>
    <%
        String finalSize = request.getParameter("finalSize");
        if (finalSize != null) {
            int n = Integer.parseInt(finalSize);
            int[] a = new int[n];
            out.print("<h3>The Array Elements are:</h3>");
            for (int i = 0; i < n; i++) {  
                a[i] = Integer.parseInt(request.getParameter("val" + i));
                out.print(a[i] + "&nbsp;&nbsp;&nbsp;");
            }
        }
    %>
</body>
</html>
