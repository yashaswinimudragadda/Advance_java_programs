<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.ExpenseDAO, model.Expense, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Manager</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; }
        .container { max-width: 900px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; text-align: center; margin-bottom: 30px; }
        
        /* Form Styling */
        .expense-form { display: flex; flex-wrap: wrap; gap: 10px; justify-content: center; background: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 30px; }
        input, select { padding: 10px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; }
        .btn-add { background-color: #27ae60; color: white; border: none; padding: 10px 20px; cursor: pointer; font-weight: bold; transition: 0.3s; }
        .btn-add:hover { background-color: #219150; }

        /* Table Styling */
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 15px; text-align: left; border-bottom: 1px solid #eee; }
        th { background-color: #3498db; color: white; text-transform: uppercase; font-size: 13px; }
        tr:hover { background-color: #f9f9f9; }
        .empty-msg { text-align: center; color: #7f8c8d; padding: 20px; }
    </style>
</head>
<body>

<div class="container">
    <h2>📊 Personal Expense Manager</h2>

    <form action="addExpenseAction.jsp" method="post" class="expense-form">
        <input type="text" name="itemName" placeholder="What did you buy?" required>
        
        <select name="category">
            <option value="Food">Food & Drinks</option>
            <option value="Transport">Transport</option>
            <option value="Shopping">Shopping</option>
            <option value="Bills">Bills & Utilities</option>
            <option value="Other">Other</option>
        </select>
        
        <input type="number" name="amount" placeholder="Amount (Rs)" step="0.01" required>
        
        <button type="submit" class="btn-add">Add Expense</button>
    </form>

    <%
        try {
            ExpenseDAO dao = new ExpenseDAO();
            List<Expense> list = dao.getAllExpenses();
            request.setAttribute("expenses", list);
        } catch (Exception e) {
            out.println("<p style='color:red'>Error loading data: " + e.getMessage() + "</p>");
        }
    %>

    <table>
        <thead>
            <tr>
                <th>Item Name</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Date Added</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty expenses}">
                    <c:forEach var="ex" items="${expenses}">
                        <tr>
                            <td><strong>${ex.itemName}</strong></td>
                            <td>${ex.category}</td>
                            <td>₹${ex.amount}</td>
                            <td>${ex.dateAdded}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="empty-msg">No expenses found. Start adding some!</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

</body>
</html>