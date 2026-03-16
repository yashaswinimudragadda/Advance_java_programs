<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--- variable declareations --%>
<%
String bcode="b201";
int bno=1;
String bname="unix";
float bprice=455.73f;
char bpcode='u';
boolean bav= true;

out.println("====book details====");
out.println("bookcode = "+bcode);
out.println("bname = "+bname);
out.println("book price = "+bprice);
out.println("book rice code = "+bpcode);
out.println("bav = "+bav);

%>
<a href="corejava3.jsp">next problem</a>
</body>
</html>