<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book CRUD System</title>
    <style>
        body { font-family: sans-serif; background: #f4f4f4; padding: 20px; }
        .container { max-width: 800px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #4a90e2; color: white; }
        .btn { padding: 5px 10px; text-decoration: none; border-radius: 3px; color: white; font-size: 12px; }
        .btn-del { background: #dc3545; }
        .btn-edit { background: #ffc107; color: black; }
        input[type="text"] { width: 95%; padding: 8px; margin: 5px 0; }
    </style>
</head>
<body>

<div class="container">
    <h2>Book Management</h2>

    <%
        // Database Connection Configuration
        String url = "jdbc:mysql://localhost:3306/projects";
        String user = "root";
        String pass = "1234";
        Connection conn = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        String action = request.getParameter("action");
        String message = "";

        // --- Controller Logic ---
        
        // 1. CREATE
        if ("insert".equals(action)) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO books_details_jsp(book_name, author) VALUES(?,?)");
            ps.setString(1, request.getParameter("bookname"));
            ps.setString(2, request.getParameter("author"));
            ps.executeUpdate();
            message = "Book added successfully!";
        }

        // 2. DELETE
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement ps = conn.prepareStatement("DELETE FROM books_details_jsp WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            message = "Book deleted!";
        }

        // 3. UPDATE (The actual execution)
        if ("update_exec".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement ps = conn.prepareStatement("UPDATE books_details_jsp SET book_name=?, author=? WHERE id=?");
            ps.setString(1, request.getParameter("bookname"));
            ps.setString(2, request.getParameter("author"));
            ps.setInt(3, id);
            ps.executeUpdate();
            message = "Update successful!";
        }

    %>

    <%
        // If "edit" is clicked, pre-fill the form
        String editId = "", editName = "", editAuthor = "";
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM books_details_jsp WHERE id=?");
            ps.setInt(1, id);
            ResultSet rsEdit = ps.executeQuery();
            if(rsEdit.next()){
                editId = String.valueOf(rsEdit.getInt("id"));
                editName = rsEdit.getString("book_name");
                editAuthor = rsEdit.getString("author");
            }
        }
    %>

    <form action="index.jsp" method="post">
        <input type="hidden" name="action" value="<%= editId.isEmpty() ? "insert" : "update_exec" %>">
        <input type="hidden" name="id" value="<%= editId %>">
        
        <label>Book Name:</label><br>
        <input type="text" name="bookname" value="<%= editName %>" required><br>
        
        <label>Author:</label><br>
        <input type="text" name="author" value="<%= editAuthor %>" required><br>
        
        <input type="submit" value="<%= editId.isEmpty() ? "Add Book" : "Update Book" %>">
        <% if(!editId.isEmpty()) { %> <a href="index.jsp">Cancel</a> <% } %>
    </form>

    <p style="color: green;"><%= message %></p>

    <table>
        <tr>
            <th>ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Actions</th>
        </tr>
        <%
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM books_details_jsp");
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("book_name") %></td>
            <td><%= rs.getString("author") %></td>
            <td>
                <a href="index.jsp?action=edit&id=<%= rs.getInt("id") %>" class="btn btn-edit">Edit</a>
                <a href="index.jsp?action=delete&id=<%= rs.getInt("id") %>" class="btn btn-del" onclick="return confirm('Delete this?')">Delete</a>
            </td>
        </tr>
        <% } conn.close(); %>
    </table>
</div>

</body>
</html>