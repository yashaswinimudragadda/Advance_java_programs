<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book database connection checking</title>
</head>
<body>
<h1>Connection status</h1>
<%
try{
	String connectionUrl="jdbc:mysql://localhost:3306/projects";
	Connection connection=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection = DriverManager.getConnection(connectionUrl,"root","1234");
	if(!connection.isClosed())
%>
<font size="+3" color="green">  // connected database with tomcat 
<%
out.println("successfull connection to"+"mysqlserver using tcp/ip");
connection.close();
}catch(Exception ex){

%></font>
<font size="+3" color="red">
<%
out.println("unable to connect");
}
%>
</font>


</body>
</html>