<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap');
.lbl{
color:red;
font-family:"DM Sans", sans-serif;
font-size:16px;
}
button{
padding: 8px 30px;
background-color:blue;
border-radius:10px;
}
p{
color:white;
}
</style>
</head>
<body>
<h2>enter the employee details</h2>
<form action="display.jsp">
<label  class="lbl" for="eno"><storng>Eno:</storng></label>
<input type="number" name="eno" required><br><br>
<label class="lbl"  for="esal"><strong>Esal:</strong></label>
<input type="number" name="esal" required><br><br>
<label class="lbl"  for="epf"><strong>Epf:</strong></label>
<input type="number" name="epf" required><br><br>
<label class="lbl"  for="egrade"><strong>Egrade:</strong></label>
<input type="text" name="egrade" required><br><br>
<button type="submit"><p>Submit</p></button>
</form>
</body>
</html>