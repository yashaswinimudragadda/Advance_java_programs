<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        table {
            border-collapse: collapse;
            width: 40%;
            margin-top: 20px;
            font-family: Arial, sans-serif;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #fafafa;
        }
    </style>
</head>
<body>
<%
//get data from the url parameters
String agestr = request.getParameter("age");
String salstr= request.getParameter("sal");
String dstr= request.getParameter("val");

try{
	int age = Integer.parseInt(agestr);
	float sal = Float.parseFloat(salstr);
	double d = Double.parseDouble(dstr);
	

%>
<table>
    <tr>
        <th>Field</th>
        <th>Value</th>
    </tr>
    <tr>
        <td><strong>Age</strong></td>
        <td><%= age %> years</td>
    </tr>
    <tr>
        <td><strong>Salary</strong></td>
        <td><%= sal %></td>
    </tr>
    <tr>
        <td><strong>Double Value</strong></td>
        <td><%= d %></td>
    </tr>
</table>
<%
}catch(Exception e){
out.println("<p style='color:red;'><strong>Error:</strong> please ensure all field are filled with numbers.</p>");
}
%>
<br>
<a href="corejava3.jsp">back to form</a>

</body>
</html>