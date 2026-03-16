<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Input Page</title>
</head>
<body>

    <h2>Enter Details</h2>
    <form action="display.jsp" method="get">
        
        Age: <input type="number" name="age" required><br><br>
        
        Salary: <input type="number" name="sal" step="0.01" required><br><br>
        
        Double Value: <input type="number" name="val" step="any" required><br><br>
        
        <button type="submit">Submit Data</button>
        
    </form>

    <hr>
    <a href="corejava4.jsp">Next Problem</a>

</body>
</html>