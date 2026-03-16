<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formation about the employees</title>
<style>
table{
border-collapse:collapse;
width:40%;
margin-top:20px;
font-family:Arial,sans-serif;
}
th,td{
border:1px,solid #dddddd;
text-align:left;
padding:12px;

}
th{
background-color:#fafafa;
}
</style>
</head>
<body>
<h2>Employee Data summary</h2>
<%
String enostr=request.getParameter("eno");
String esalstr=request.getParameter("esal");
String epfstr=request.getParameter("epf");
String  egradestr=request.getParameter("egrade");

try{
	//parse string to numeric type
	
	int eno=Integer.parseInt(enostr);
	float esal = Float.parseFloat(esalstr);
	double epf= Double.parseDouble(epfstr);
	// To get a char, we take the character at index 0
	char egrade = egradestr.charAt(0);
%>
<table>
<tr>
<th><strong>Field</strong></th>
<th><storng>Values</storng></th>
</tr>
<tr>
<td><strong>Eno</strong></td>
<td><%= eno %></td>

</tr>
<tr>
<td><strong>Esal</strong></td>
<td><%=esal %></td>
</tr>
<tr>
<td><strong>Epf</strong></td>
<td><%=epf %></td>
</tr>
<tr>
<td><strong>Egrade</strong></td>
<td><%=egrade %></td>
</tr>
</table>
<%
}catch(Exception e){
	out.println("<p style='color:red;'><strong>Error:</strong> Please ensure all fields are filled with numbers.</p>");}

%>
<br>
    <a href="employee_details.jsp">Back to Form</a>



</body>
</html>