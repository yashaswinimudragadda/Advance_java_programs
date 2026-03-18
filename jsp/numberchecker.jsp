<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>number Checker</title>
</head>
<body>
<form>
 <table>
  <caption>numberchecker</caption>
   <tr>
    <td>Select your option:</td>
    <td>
    <select name="otp">
        <option value="arm">Armstrong</option>
        <option value="palan">Palindrome</option>
        <option value="cyclo">Cyclic number</option>
        <option value="prime">Prime number</option>
        <option value="even">Even/Odd number</option>
        <option value="table">Get table</option>
        <option value="ntables">n tables</option>
      </select>
    </td>
   </tr> 
   <tr>
    <td>Enter your n value:</td>
    <td><input name="n" required min="100"></td>
    <td><button type="submit">check</button></td>
    </tr>  
 </table>
</form>
<%
 String nstr=request.getParameter("n");
 String val = request.getParameter("otp"); // Get the selected option
  if(nstr!=null){
	  try{
		  int n=Integer.parseInt(nstr);
%>
<div class="result">
 <h1><%=val.toUpperCase() %> checking</h1>
 <%
  if("arm".equals(val)){
	  int arm_temp=n;
	  int arm_r=0;
	  int arm_sum=0;
	  while(n>0){
		  arm_r=n%10;
		  arm_sum=arm_sum+arm_r*arm_r*arm_r;
		  n=n/10;
	  }
	  String checker1=(arm_temp==arm_sum)?"The given number is armstrong number. ":"The given number not is armstrong number .";	
	  out.println(checker1);
  }
  else if("palan".equals(val)){
	  int palan_temp=n;
	  int palan_r=0;
	  int palan_sum=0;
	  while(n>0){
		  palan_r=n%10;
		  palan_sum=palan_sum*10+palan_r;
		  n=n/10;
	  }
	  String checker2=(palan_temp==palan_sum)?"The given number is palandrome number. ":"The given number not is palandrome number .";	
	  out.println(checker2);
 }
  else if("cylco".equals(val)){
	  int l=n%10;
	  int f=0;
	  int i=0;
	  while(n>0){
		  f=n%10;
		  n=n/10;
		  i++;
	  }
	  String checker3=(f==l)?"The given number is cylco number. ":"The given number not is cyclo number .";	
	  out.println(checker3);
 }

  else if("prime".equals(val)){
	 for(int i=2;i<=n;i++){
		 boolean isprime=true;
		 for(int j=2;j<=Math.sqrt(i);j++){
			 isprime=false;
			 break;
		 }
		 if(isprime){
			 out.println(i+" is prime.<br>");
		 }
		 else{
			 out.println(i+" is not prime.<br>");
		 }
	 }
  }
  else if("cylco".equals(val)){
	  int l=n%10;
	  int f=0;
	  int i=0;
	  while(n>0){
		  f=n%10;
		  n=n/10;
		  i++;
	  }
	  String checker3=(f==l)?"The given number is cylco number. ":"The given number not is cyclo number .";	
	  out.println(checker3);
 }

  else if("even".equals(val)){
	for(int i=1;i<=n;i++){
		if(i%2==0){
			out.println(i+" is even number.<br>");
		}
		else{
			out.println(i+" is odd number. <br>");
		}
	}
  }

  else if("table".equals(val)){
	for(int i=1;i<=10;i++){
		int t=n;
		out.println(t+"X"+i+"="+(t*i)+"<br>");
	}
  }

  else if("ntables".equals(val)){
	  int t=n;
  for(int j=1;j<=t;j++){	  
	for(int i=1;i<=10;i++){
		out.println(j+"X"+i+"="+(j*i)+"<br>");
	}
	out.println("<hr>");
  }
  }
 %> 
</div>
<%

}catch(Exception e){
	out.println("error check again:");
}
  }
  
%>
</body>
</html>
