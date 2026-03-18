<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Even/Odd Checker</title>
</head>
<body>

<form>
    <table>
        <tr>
            <td>Enter the n value:</td>
            <td><input type="number" required name="n"></td>
            <td><button type="submit" name="btn">Click Here</button></td>
        </tr>
    </table>
</form>

<%
String nstr = request.getParameter("n");

if(nstr != null) {
    try {
        int n = Integer.parseInt(nstr);
        if(n > 0) {
%>
            <div class="result">
                <h1>Checking Even/Odd up to <%= n %></h1>
                <%
                int i = 1;
                while(i <= n) {
                    if(i % 2 == 0) {
                        out.println(i + " is even<br>");
                    } else {
                        out.println(i + " is odd<br>");
                    }
                    i++;
                }
                %>
            </div> <%
        } else {
            out.println("<p>Please enter a value greater than 0.</p>");
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: Invalid input.</p>");
    }
} // End of nstr != null check
%>

</body>
</html>
