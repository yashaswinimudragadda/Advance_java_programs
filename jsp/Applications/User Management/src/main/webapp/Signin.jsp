<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <%
     if("post".equalsIgnoreCase(request.getMethod())){
    	  String email=request.getParameter("email");
    	  String pass=request.getParameter("pass");
    	  
    	  
    	  try{
    		  
    		  Class.forName("com.mysql.cj.jdbc.Driver");
    		  Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projects","root","1234");
    		  PreparedStatement ps= conn.prepareStatement("Select * from users where email =? and password=?");
    		  
    		  ps.setString(1,email);
    		  ps.setString(2,pass);
    		  
    		  ResultSet rs=ps.executeQuery();
    		  
    		  if(rs.next()){
    			  session.setAttribute("user_id",rs.getInt("id"));
    			  session.setAttribute("username",rs.getString("username"));
    			  response.sendRedirect("profile.jsp");
    		  }else{
    			  out.println("<script>alert('invalied credentials');</script>");
    		  }
    	  }catch(Exception e){
    		  out.print(e.getMessage());
    	  }
     }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-ligt d-flex align-items-center vh-100">
 <div class="container" style="max-width:400px">
  <div class="card p-4 shadow border-0">
   <h3 class="text-center mb-4">Welcome Back</h3>
   <form method="post">
    <input type="email" name="email" class="form-control mb-3" placeholder="email" required>
    <input type="password" name="pass" class="form-control mb-3" placeholder="password" required>
     <button type="submit" class="btn btn-success w-100">Login</button>
   </form>
  </div>
  </div>
</body>
</html>