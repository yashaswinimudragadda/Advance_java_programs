<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// this replaces Scanner's sc.nextline()
String name= request.getParameter("fullname");
if(name!= null && !name.trim().isEmpty()){
%>
<div class="name-card">
<table border="0">
<tr>
<td><strong>identified name:</strong></td>
<td><%=name %></td>
</tr>
</table>
</div>
<%
}
else{
	out.println("please go back and enter a name.");
}
%>
<br>
<a href="Runtime.jsp">Try another name</a>
</body>
</html>