<%@page import="java.sql.*"%>
<%@page import="com.inventory_management.helper.ConnectionProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>This is the sign up page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-color: floralwhite;

        }
        .sign-up-bar{
            background-color: white;
            position: absolute;
            height: 80%;
            width: 50%;
            border: 2px solid white;
            border-radius: 12px;
            box-shadow: 30px 30px 30px black;
            margin-left: 25%;
        }
        .sign-up-tab{
            position: absolute;
            height: 100%;
            width: 50%;
        }
        .image-bar{
            position: absolute;
            height: 100%;
            width: 50%;
            margin-left: 50%;
        }
        #signup_image{
            margin-top: 10%;
            height: 70%;
            width: 80%;
        }

        .sign-tab{
            height: 50%;
            width: 100%;
            position: absolute;
            margin-top: 20%;
        }

        input{
            padding: 1%;
            margin: 5%;
            height: 5%;
            width: 80%;
            background-color: transparent;
            border: none;
            border-bottom: 2px solid red;
            color: black;
            transition: width 1s;

        }
        input:hover{
            border-bottom: 3px solid greenyellow;
            transition: width 1s;
        }
        input:focus{
            outline: none;
        }

        button{
            margin: 5%;
            padding: 2%;
            height: 13%;
            width: 25%;
            background-color: red;
            border: none;
            border-radius: 12px;
            font-weight: bold;
            color: white;
            font-family: cursive;
            font-size: auto;
            
        }
        button:hover{
            border:thick;
            width: 29%;
            height: 17%;
            color: black;
            
        }
        button:focus{
            outline: none;
        }
		
		
    </style>
</head>
<body>
<center>
<div class="sign-up-bar">
    <form action="" method="post">
    <div class="sign-up-tab">
        <div class="sign-tab">
            <h1>Sign Up</h1>
            <i class="fa fa-user" aria-hidden="true"></i>
            <input type="text" name="fullname" placeholder="Enter full name *" required>
            <br>
            <i class="fa fa-envelope" aria-hidden="true"></i>
            <input type="email" name="email" placeholder="Enter email id *" required>
            <br>
            <i class="fa fa-key" aria-hidden="true"></i>
            <input type="password" name="password" placeholder="Enter password *" required>
            <br>
            <i class="fa fa-phone-square" aria-hidden="true"></i>
            <input type="phone" name="phonenumber" placeholder="Enter phone number *" required>
            <button id="btn" type="submit" name="b10" >Sign up</button><button type="reset">Reset</button>
        </div>
    </div>
    </form>
    <div class="image-bar">
        <img src="images/signup-image.jpg" alt="" id="signup_image">
        <br>
        <a href="login.jsp">I already have an account</a>
    </div>
    
</div>
</center>
<%
if(request.getParameter("b10")!=null){
String fullname=request.getParameter("fullname");
String email=request.getParameter("email");
String password=request.getParameter("password");
String phonenumber=request.getParameter("phonenumber");
if (email!="" && password!="" && fullname!="" && phonenumber!=""){
	try{
	 Connection con=ConnectionProvider.getConnection();
	 PreparedStatement psmt1=con.prepareStatement("insert into login_table values(?,?,?,?)");
	 con.setAutoCommit(false);
	 psmt1.setString(1, email);
     psmt1.setString(2, password);
     psmt1.setString(3, phonenumber);
     psmt1.setString(4, fullname);
     int i1=psmt1.executeUpdate();

     if(i1>0)
     {      
    	 con.commit();
     	 	//out.write("<script>alert('Data has succesfully recorded. kindly Login again!');</script>");
    	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
 		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
 		out.println("<script>");
 		out.println("$(document).ready(function() {");
 		out.println("swal ('Data recorded' , 'Login now' , 'success');");
 		out.println("});");
 		out.println("</script>");
       	    
     }
     else{
    	 con.rollback();
    	 out.write("<script>alert('Don't enter duplicate email or phone number.');</script>");
     }
	}catch(Exception e){
		//out.write("Don't enter duplicate email or phone number.");
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
 		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
 		out.println("<script>");
 		out.println("$(document).ready(function() {");
 		out.println("swal ('Duplicate not accepted' , 'Duplicate email or phone number found' , 'error');");
 		out.println("});");
 		out.println("</script>");
       	
	}
}    
}
%>

</body>
</html>