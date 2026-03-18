<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Switch case</title>
<style>
.result{
display:flex;
flex-direction:column;
align-items:center;
justify-content:center;

border:1px solid #ddd;
border-radius:10px;

padding: 20px;
margin:20px auto;
width:fit-content;
background-color:#f9f9f9;
box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}
</style>

</head>
<body>

<form>
enter the value your value here :
<input type="number" name="n" required>
<button type="submit">click here</button>
</form>


<%String Valn = request.getParameter("n");
if(Valn != null)
	{
	try{
		int n = Integer.parseInt(Valn);
%>
<div class = "result">
<h1> printing values up to the entered n value</h1>
<%
int i=1;
 while(n>=i){
	out.println(i+"<br>"); 
	i++;
 }
%>
</div>

<%
        } catch(Exception e) {
            out.println("<p style='color:red;'>Error: Check your value.</p>");
        }
    }
%>





</body>
</html>
