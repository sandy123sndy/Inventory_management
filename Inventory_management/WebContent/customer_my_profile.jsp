<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="com.inventory_management.helper.ConnectionProvider"%>
 	
<% String email=(String)session.getAttribute("email");
if(email==null){
	response.sendRedirect("login.jsp");
}
else{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select * from login_table where email=?");
	pst.setString(1, email);
	ResultSet rs=pst.executeQuery();
	while(rs.next()){

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>This is the customer my profile page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body{
            background-color: white;
            margin: 0;
            padding: 0;
        }
        .left-part{
            height: 100%;
            width: 20%;
            position: absolute;
            background-color: rgb(97, 8, 8);
        }
        .right-part{
            height: 100%;
            width: 80%;
            position: absolute;
            margin-left: 20%;
            
        }
        .logo-1{
            height: auto;
            max-width: 100%;
            color: white;
            position: absolute;
            margin-left: 25%;
            padding: 2%;
            margin-top: 30%;
            border: 2px solid black;
            border-radius: 12px;
            background-color: black;
            font-family: sans-serif;
            border-right: 4px solid blue;
            border-left: 4px solid blue;
            border-bottom: 3px solid greenyellow;
            border-top: 4px solid greenyellow;
        }
        .logo-2{
            height: auto;
            max-width: 100%;
            margin-left: 40%;
            color: white;
            position: absolute;
            padding:  2%;
            margin-top: 30%;
            border: 2px solid rgba(29, 29, 82, 0.808);
            border-radius: 12px;
            background-color: black;
            font-family: sans-serif;
            border-left: 4px solid blue;
            border-right: 4px solid blue;
            border-bottom: 4px solid greenyellow;
            border-top: 3px solid greenyellow;
        }
        .option-1{
            height: 20%;
            width: 90%;
            margin-top: 80%;
            padding: 5%;
            text-align: left;
            color: white;
            font-size: 15px;
            font-family: sans-serif;
            background-color: rgba(0, 0, 0, 0.3);
        }
        .option-1:hover{
            font-weight: bold;
            background-color: rgba(110, 107, 107, 0.4);
        }
        .option-2{
            height: 20%;
            width: 90%;
            margin-top: 0%;
            padding: 5%;
            text-align: left;
            color: white;
            font-size: 15px;
            font-family: sans-serif;
            background-color: rgba(0, 0, 0, 0.3);
        }
        .option-2:hover{
            font-weight: bold;
            background-color: rgba(110, 107, 107, 0.4);
        }
        .option-3{
            height: 20%;
            width: 90%;
            margin-top: 0%;
            padding: 5%;
            text-align: left;
            color: white;
            font-size: 15px;
            font-family: sans-serif;
            background-color: rgba(0, 0, 0, 0.3);
        }
        .option-3:hover{
            font-weight: bold;
            background-color: rgba(110, 107, 107, 0.4);
        }

        .topnav {
        background-color: floralwhite;
        overflow: hidden;
        
        }

        /* Style the links inside the navigation bar */
        .topnav input{
            float: left;
            color: black;
            background-color: rgb(41, 228, 41);
            padding: 14px 16px;
            text-decoration: solid;
            font-size: 14px;
        }
        .topnav input:hover{
            background-color: rgb(41, 228, 41);
            color: white;
        }
        .topnav input:focus{
            outline-width: 0;
        }
        .topnav a {
        float: right;
        display: block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: solid;
        font-size: 17px;
        }

        /* Change the color of links on hover */
        .topnav a:hover {
        background-color: rgba(0, 0, 0, 0.7);
        color: white;
        }

        /* Add an active class to highlight the current page */
        .topnav a.active {
        background-color: rgb(24, 192, 75);
        color: white;
        }
        .topnav #Name{
            float: left;
        }

        /* Hide the link that should open and close the topnav on small screens */
        .topnav .icon {
        display: none;
        }

        .show-name{
            height: 10%;
            width: 100%;
            font-family: sans-serif;
            text-align: center;
        }
        
        .copyright{
            height: auto;
            width: 70%;
            position: absolute;
            margin-top: 2%;
            margin-left: 16%;
            text-align: center;
            font-family: sans-serif;
            border-radius: 12px;
            background-color: antiquewhite;
        }
        .text{
            height: auto;
            width: 100%;
            text-align: center;
            font-family: sans-serif;
        }
        .profile{
            height: 68%;
            width: 100%;
        }
        .profile-elements{
            height: auto;
            width: 50%;
            margin-left: 24%;
            background-color: floralwhite;
            border-radius: 12px;
            box-shadow: 25px 25px 25px black;
        }
        
        .profile-elements input{
            padding: 1%;
            margin: 5%;
            height: 5%;
            width: 100%;
            background-color: transparent;
            border: none;
            border-bottom: 2px solid red;
            color: black;
            transition: width 1s;

        }
        .profile-elements input:hover{
            border-bottom: 3px solid greenyellow;
            transition: width 1s;
        }
        .profile-elements input:focus{
            outline: none;
        }
        .profile-elements button{
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
        .profile-elements button:hover{
            border:thick;
            width: 29%;
            height: 17%;
            color: black;
            
        }
        .profile-elements button:focus{
            outline: none;
        }

        
    </style>
</head>
<body>
    <div class="left-part">
        <center>
        <div class="logo-1">Inventory</div> 
        <br><br>
        <div class="logo-2">Management</div>
        <a href="customer_dashboard.jsp">
        <div class="option-1">
            <i class="fa fa-home" aria-hidden="true"></i>
            Dashboard
        </div>
        </a>
        <a href="find_something.jsp">
            <div class="option-2">
                <i class="fa fa-archive" aria-hidden="true"></i>
                Find something
            </div>
        </a>
        <a href="my_cart.jsp">
            <div class="option-3">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                My cart
            </div>
        </a>
        </center>
    </div>
    <div class="right-part">
        <div class="topnav" id="myTopnav">
            
            <a href="customer_change_password.jsp">Change Password</a>
            <a href="customer_my_profile.jsp">My Profile</a>
            <form  method="get" action="Logout1">
            <input type="submit" id="Name" value="Logout">
            </form>
            <a href="customer_my_profile.jsp" id="Name"><%=email %></a>
            </div>
            <div class="text"><h2>This is your profile</h2></div>

            <div class="profile">
                <div class="profile-elements">
                    <br>
                    <!--<label for="">Name: </label><input type="text" name="" id="" readonly>
                    <br>
                    <label for="">Email ID: </label><input type="email" name="" id="">
                    <br>
                    <label for="">Phone number: </label><input type="number" name="" id=""> -->
                    <center>
                    <table>
                        <tr><td><i class="fa fa-user" aria-hidden="true"></i></td><td><label for="">Name: </label></td><td><%= rs.getString("Full_name")%></td></tr>
                        <tr><td><i class="fa fa-envelope" aria-hidden="true"></i></td><td><label for="">Email id: </label></td><td><%= rs.getString("email")%></td></tr>
                        <tr><td><i class="fa fa-phone-square" aria-hidden="true"></i></td><td><label for="">Phone number: </label></td><td><%= rs.getString("phone_number")%></td></tr>
                    </table>
                    <a href="customer_edit_profile.jsp"><button>Edit</button></a>
                </center>
                </div>
                
            </div>
            
          <div class="copyright">
            <h4>copyright: Sandip Kumar Basak</h4>
          </div>
    </div>
     <%
	}
}
  %>
    
</body>
</html>