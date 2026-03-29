<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ExpenseDAO" %>

<%
    try {
        // 1. Get the data from the index.jsp form fields
        // These names ("itemName", "category", "amount") must match the 'name' attribute in your HTML form
        String name = request.getParameter("itemName");
        String category = request.getParameter("category");
        String amountStr = request.getParameter("amount");

        // 2. Simple Validation & Conversion
        if (name != null && amountStr != null) {
            double amount = Double.parseDouble(amountStr);

            // 3. Call your DAO to insert into MySQL
            ExpenseDAO dao = new ExpenseDAO();
            boolean isAdded = dao.addExpense(name, category, amount);

            if (isAdded) {
                // 4. Success! Redirect back to index.jsp to show the new data
                response.sendRedirect("index.jsp");
            } else {
                out.println("<h3>Error: Could not save expense to database.</h3>");
                out.println("<a href='index.jsp'>Go Back</a>");
            }
        }
    } catch (Exception e) {
        // This catches things like someone typing text into the 'Amount' box
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        out.println("<a href='index.jsp'>Go Back</a>");
    }
%>