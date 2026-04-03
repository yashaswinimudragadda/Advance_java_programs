<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>

<%
if("post".equalsIgnoreCase(request.getMethod())){
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","1234");
		PreparedStatement ps= conn.prepareStatement("insert into users(username,email,password) values(?,?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,pass);
		ps.executeUpdate();
		response.sendRedirect("Signin.jsp");
	}catch(Exception e){out.print("Error: "+e.getMessage());}
}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light d-flex align-items-center vh-100">
<div class="container" style="max-width:400px;">

<div class="card p-4 shadow">
 
  <h3 class="text-center">Create Account</h3>
    <form method="post">
      <input type="text"name="name" class="form-control mb-3" placeholder="fullname" required>
      <input type="email"name="email" class="form-control mb-3" placeholder="email" required>
      <input type="password"name="pass" class="form-control mb-3" placeholder="password" required>
      <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>
    <p class="mt-3 text-center">Already have an account?<a href="Signin.jsp">Login</a></p>
    </div>
    </div>


</body>
</html>