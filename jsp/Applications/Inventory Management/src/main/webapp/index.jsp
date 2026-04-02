<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Database Configuration
    String dbUrl = "jdbc:mysql://localhost:3306/projects";
    String dbUser = "root";
    String dbPass = "1234";
    
    // Handle Form Submission (POST)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("pname");
        String category = request.getParameter("category");
        int qty = Integer.parseInt(request.getParameter("qty"));
        double price = Double.parseDouble(request.getParameter("price"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            PreparedStatement ps = conn.prepareStatement("INSERT INTO products(name, category, quantity, price) VALUES(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setInt(3, qty);
            ps.setDouble(4, price);
            ps.executeUpdate();
            conn.close();
            // Refresh to avoid form resubmission
            response.sendRedirect("index.jsp"); 
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Smart Inventory Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body { background-color: #f4f7f6; }
        .main-card { border: none; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        .table-container { background: white; border-radius: 15px; padding: 20px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
    </style>
</head>
<body>

<div class="container py-5">
    <div class="text-center mb-5">
        <h1 class="display-5 fw-bold text-primary"><i class="bi bi-box-seam"></i> Inventory System</h1>
    </div>

    <div class="row g-4">
        <div class="col-lg-4">
            <div class="card main-card p-4">
                <h4 class="mb-4">Add New Product</h4>
                <form method="POST">
                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="pname" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Category</label>
                        <select name="category" class="form-select">
                            <option value="Electronics">Electronics</option>
                            <option value="Groceries">Groceries</option>
                            <option value="Furniture">Furniture</option>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col-6 mb-3">
                            <label class="form-label">Quantity</label>
                            <input type="number" name="qty" class="form-control" value="0">
                        </div>
                        <div class="col-6 mb-3">
                            <label class="form-label">Price ($)</label>
                            <input type="number" step="0.01" name="price" class="form-control" value="0.00">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 mt-3 py-2 fw-bold">Save to Inventory</button>
                </form>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="table-container">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="mb-0">Current Stock</h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Product</th>
                                <th>Category</th>
                                <th>Stock</th>
                                <th>Price</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM products ORDER BY id DESC");

                                    while(rs.next()) {
                                        int stock = rs.getInt("quantity");
                                        String badgeClass = (stock < 5) ? "bg-danger" : "bg-success";
                            %>
                            <tr>
                                <td><strong><%= rs.getString("name") %></strong></td>
                                <td><span class="text-muted small"><%= rs.getString("category") %></span></td>
                                <td>
                                    <span class="badge rounded-pill <%= badgeClass %>"><%= stock %> Left</span>
                                </td>
                                <td>$<%= String.format("%.2f", rs.getDouble("price")) %></td>
                                <td class="text-center">
                                    <div class="btn-group">
                                        <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                    conn.close();
                                } catch (Exception e) {
                                    out.println("<tr><td colspan='5'>Error loading data.</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>