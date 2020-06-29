<%@page import="java.sql.*"%>
<%@page import="com.inventory_management.helper.ConnectionProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>This is the login page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-color: floralwhite;
        }
        .login-bar{
            background-color: white;
            position: absolute;
            height: 80%;
            width: 50%;
            border: 2px solid white;
            border-radius: 12px;
            box-shadow: 30px 30px 30px black;
            margin-left: 25%;
        }
        .image-bar{
            position: absolute;
            height: 100%;
            width: 50%;
        }
        .log-bar{
            position: absolute;
            height: 100%;
            width: 50%;
            margin-left: 50%;
        }
        #signin_image{
            margin-top: 10%;
            height: 70%;
            width: 80%;
        }

        .login-tab{
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
<div class="login-bar">
    <div class="image-bar">
        <img id="signin_image" src="images/signin-image.jpg" alt="">
        <br>
        <a href="sign_up.jsp">Create an account</a>
    </div>
    <form action="" method="post">
    <div class="log-bar">
            <div class="login-tab">
            <h1>Login</h1>
            <i class="fa fa-user" aria-hidden="true"></i>
            <input type="email" name="user_name" id="" placeholder="Username (Email ID) *" required>
            <br>
            <i class="fa fa-key" aria-hidden="true"></i>
            <input type="password" name="password" id="" placeholder="Password *" required>
            <button type="submit">Log in</button><button type="reset">Reset</button>
            </div>
    </div>
    </form>
</div>

</center>

<%
String email=request.getParameter("user_name");
String pass=request.getParameter("password");
if(email!=null && pass!=null){
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select * from login_table where email=? and password=?");
	pst.setString(1, email);
	pst.setString(2, pass);
	ResultSet rs=pst.executeQuery();
	
	if(rs.next())
	{
		String a1="Admin@admin";
		if(email.equals(a1)){
			HttpSession s=request.getSession();
			s.setAttribute("email", email);
			response.sendRedirect("admin_dashboard.jsp");
		}
		else{
			String[] arr=new String[1000];
			int[] quan=new int[1000];
			HttpSession s=request.getSession();
			s.setAttribute("email", email);
			s.setAttribute("arr", arr);
			s.setAttribute("quan", quan);
			response.sendRedirect("customer_dashboard.jsp");
		}
	}
	else
	{
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
 		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
 		out.println("<script>");
 		out.println("$(document).ready(function() {");
 		out.println("swal ('Password mismatch' , 'Password or email did not match' , 'error');");
 		out.println("});");
 		out.println("</script>");
		
	}
}
else{
	;
}
%>

</body>
</html>