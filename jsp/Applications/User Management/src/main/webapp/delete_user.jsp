<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
//1.session Check

if(session.getAttribute("user_id") == null){
	response.sendRedirect("signin.jsp");
	return;
}

int userId=(int)session.getAttribute("user_id");
String dbUrl="jdbc:mysql://localhost:3306/projects";

//2.handle deletelogic
if("post".equalsIgnoreCase(request.getMethod()) && request.getParameter("delete") != null){
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbUrl, "root", "1234");
		//deletion query
		
		PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE id=?");
		ps.setInt(1, userId);
		int rowsAffected = ps.executeUpdate();
		if(rowsAffected>0){
			session.setAttribute("username","none");//setting to none
			out.print("<div class='alert alert-info m-0 rounded-0 text-center'>Profile deleted successfully!</div>");
		}
		conn.close();
	}catch(Exception e) {
		out.print("<div class='alert alert-danger m-0 rounded-0'>" + e.getMessage() + "</div>");
	}
	}


//3. Fetch User Data
String name="", email="", role="";
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); // Added driver load here too
    Connection conn = DriverManager.getConnection(dbUrl, "root", "1234");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE id=?");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
        // CRITICAL: Ensure these match your DB columns (e.g., 'fullname' vs 'name')
        name = rs.getString("username"); 
        email = rs.getString("email");
        role = rs.getString("role");
    }
    conn.close();
} catch(Exception e) {
    out.print("");
}

%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            background-color: #f8f9fa;
        }
        .delete-container {
            max-width: 450px;
            margin: auto;
        }
    </style>
</head>
<body>

    <div class="container delete-container">
        <div class="card shadow-lg border-0">
            <div class="card-body p-5 text-center">
                <div class="text-danger mb-4">
                    <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
                      <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                    </svg>
                </div>

                <h2 class="fw-bold h4">Delete Account?</h2>
                <p class="text-muted mb-4">
                    Are you sure you want to delete the account for <strong><%= (name.isEmpty() ? "this user" : name) %></strong>? 
                    This action is permanent and cannot be undone.
                </p>

                <form method="post">
                    <div class="d-grid gap-2">
                        <button type="submit" name="delete"class="btn btn-danger btn-lg shadow-sm">
                            Yes, Delete Permanently
                        </button>
                        <a href="profile.jsp" class="btn btn-light border mt-2">
                            No, Keep My Account
                        </a>
                    </div>
                </form>
            </div>
            <div class="card-footer bg-white text-center py-3 border-0">
                <small class="text-muted">Logged in as: <%= email %></small>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>