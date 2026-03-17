<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<style>
table{
border-collapse:collapse;
width:40px;
margin-top:20px;
font-family:Arial,sans-serif;

}
th,td{
border:1px,solid #dddddd;
text-align:center;
padding:12px;

}
th{
backgroud-color:#fafafa;
}
</style>
</head>
<body>

<%
String bcodestr = request.getParameter("bcode");
String bpricestr = request.getParameter("bprice");
String bpdiscstr = request.getParameter("bpdisc");
String bpcodestr = request.getParameter("bpcode");
String bavstr = request.getParameter("bav");

try {
    int bcodeint = Integer.parseInt(bcodestr);
    int bpriceint = Integer.parseInt(bpricestr);
    int bpdiscint = Integer.parseInt(bpdiscstr);
    int bpcodeint = Integer.parseInt(bpcodestr);

    // better for checkbox
    boolean bav = (bavstr != null);
%>

<table border="1">
<caption><strong>Book Details</strong></caption>

<tr>
<th>Field</th>
<th>Value</th>
</tr>

<tr>
<td>bcode</td>
<td><%= bcodeint %></td>
</tr>

<tr>
<td>bprice</td>
<td><%= bpriceint %></td>
</tr>

<tr>
<td>bpdisc</td>
<td><%= bpdiscint %></td>
</tr>

<tr>
<td>bpcode</td>
<td><%= bpcodeint %></td>
</tr>

<tr>
<td>bav</td>
<td><%= bav %></td>
</tr>

</table>

<%
} catch(Exception e) {
%>
<p style="color:red;">
<strong>Error:</strong> Please ensure all fields are filled with valid numbers.
</p>
<%
}
%>

<br>
<a href="Books_details.jsp">Back to Form</a>

</body>
</html>