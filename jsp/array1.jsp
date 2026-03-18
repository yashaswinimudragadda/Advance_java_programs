<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Array in JSP</title>
</head>
<body>
    <h2>Working with Arrays in JSP</h2>

    <%
        // Declaration and instantiation
        int a[] = new int[5];
        
        // Initialization
        a[0] = 10; a[1] = 20; a[2] = 30; a[3] = 40; a[4] = 50;
        
        // declaration and instantiation of array 2
        
         int b [] = new int[5];
         b[0] = 10; b[1] = 20; b[2] = 30; b[3] = 40; b[4] = 50;

    %>

    <p><strong>Element at index 2:</strong> <%= a[2] %></p>

    <p><strong>Array elements:</strong> 
    <%
        for (int x =0;x<b.length;x++) {
            out.print(a[x]+b[x]+"<br>"); // Using HTML space entity
        }
    %>
    </p>
</body>
</html>
