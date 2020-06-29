<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,org.apache.commons.lang3.*"%>
<%@page import="com.inventory_management.helper.ConnectionProvider"%>
 
 <% String email=(String)session.getAttribute("email");
if(email==null){
	response.sendRedirect("login.jsp");
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>This is add to cart page</title>
</head>
<body>

<%
String id=request.getParameter("no5");
String[] arr=(String[])session.getAttribute("arr");
int[] quan=(int[])session.getAttribute("quan");
%>
<form action="" method="post">
<center><input type="number" name="no" placeholder="Enter qunatity">
<button type="submit" name="b10">Add to cart</button></center>
</form>
<% 
if(request.getParameter("b10")!=null){
	

String no=request.getParameter("no");
String no1=null;
try{
Connection con=ConnectionProvider.getConnection();
PreparedStatement psmt1=con.prepareStatement("select item_quantity from items where item_no=?");
psmt1.setString(1, id);
ResultSet rs=psmt1.executeQuery();

while(rs.next()){
	no1=(String)rs.getString("item_quantity");
}
int no3=Integer.valueOf(no);
int no4=Integer.valueOf(no1);


if(no4<no3 || no4==0 || no3<=0){
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() {");
		out.println("swal ('Enter correct quantity' , 'more than quantity,negative or zero not accepted' , 'error');");
		out.println("});");
		out.println("</script>");

}
else{
	
	int i=0;
	while(arr[i]!=null){
		i=i+1;
	}
	arr[i]=id;
	session.setAttribute("arr", arr);
	int j=0;
	while(quan[j]!=0){
		j=j+1;
	}
	quan[j]=no3;
	session.setAttribute("quan", quan);
	
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function() {");
		out.println("swal ('Item added to cart' , 'Please check' , 'success');");
		out.println("});");
		out.println("</script>");
}

}catch(Exception e){
	e.getLocalizedMessage();
}
}
%>
<br><br>
<center><a href="my_cart.jsp"><button>Check your cart</button></a></center>

</body>
</html>