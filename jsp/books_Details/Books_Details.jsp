<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
border-collapse:collapse;
width:40px;
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
<form action="display.jsp">
<table>
<caption>Books details</caption>
<tr>
<td>bcode:</td>
<td><input value="bcode" type="number"  name="bcode" placeholder="enter bcode here"></td>
</tr>
<tr><td>bprice:</td><td><input value="bprice" type="number" name="bprice" placeholder="enter bprice"></td></tr>
<tr>
<td>bpdisc:</td><td><input value="bpdisc" type="number" name="bpdisc" placeholder="enter discount "></td></tr>
<tr><td>bpcode:</td><td><input value="bpcode" type="number" name="bpcode" placeholder="enter bpcode"></td></tr>
<tr><td>bav:</td><td><input  type="text"  name="bav" placeholder="enter true or false"></td></tr>
<tr><td><button type="submit"><p>Submit</p></button></td></tr>
</table>
</form>
</body>
</html>
