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
        
        int max=0;
        int min=0;

    %>

    <p><strong>Element at index 2:</strong> <%= a[2] %></p>

    <p><strong>Array elements:</strong> 
    <%
    for (int i = 0; i < a.length; i++) {
        out.println(a[i] + "\t<br>");
        
        if (a[i] > max) {
            max = a[i];
        } else if (a[i] < min) {
            min = a[i];
        }
    }
    out.println("<br>"+max+" this is the max value in the array.<br>");
    out.println(min+" this is the min value in the array.");
    
    %>
    </p>
</body>
</html>
