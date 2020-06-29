<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.time.*,java.time.format.DateTimeFormatter"%>
<%@page import="com.inventory_management.helper.ConnectionProvider"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>This is delete page</title>
</head>
<body>
<%
String id=request.getParameter("no");
try{
Connection con=ConnectionProvider.getConnection();
	PreparedStatement psmt2=con.prepareStatement("delete from items where item_no='"+id+"'");
	int i10=psmt2.executeUpdate();
	if(i10>0){
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	out.println("<script>");
	out.println("$(document).ready(function() {");
	out.println("swal ('Item deleted' , 'Check now' , 'success');");
	out.println("});");
	out.println("</script>");	
	}
}catch(Exception e){
	e.getLocalizedMessage();
}
response.sendRedirect("item_records.jsp");
%>

</body>
</html>