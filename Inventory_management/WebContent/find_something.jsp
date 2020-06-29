<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*"%>
<%@page import="com.inventory_management.helper.ConnectionProvider"%>
 	
<% String email=(String)session.getAttribute("email");
if(email==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>This is the find something page</title>
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
        .entry{
            height: auto;
            width: 98%;
            text-align: center;
            padding: 1%;
        }
        .entry input{
            height: auto;
            width: 15%;
            margin: 1%;
            background-color: transparent;
            border: none;
            border-bottom: 2px solid red;
            color: black;
            transition: width 1s;

        }
        .entry input:hover{
            border-bottom: 3px solid greenyellow;
            transition: width 1s;
        }
        .entry input:focus{
            outline: none;
        }

        .entry button{
            height: auto;
            width: auto;
            background-color: red;
            border: none;
            border-radius: 12px;
            font-weight: bold;
            color: white;
            font-family: cursive;
            font-size: auto;
            
        }
        .entry button:hover{
            border:thick;
            width: auto;
            height: auto;
            color: black;
            
        }
        .entry button:focus{
            outline: none;
        }

        .result{
            height: 60%;
            width: 100%;
        }
        .result table{
            height: auto;
            width: 80%;
            margin-left: 10%;
            margin-top: 1%;
            border-radius: 12px;
            font-family: sans-serif;
            box-shadow: 25px 25px 25px black;
            background-color: floralwhite;
            color: black;
        }
        .result button{
            height: auto;
            width: auto;
            background-color: red;
            border: none;
            border-radius: 12px;
            font-weight: bold;
            color: white;
            font-family: cursive;
            font-size: auto;
            
        }
        .result button:hover{
            border:thick;
            width: auto;
            height: auto;
            color: black;
            
        }
        .result button:focus{
            outline: none;
        }
        .result table td{
        	width: 10%;
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
            <div class="text"><h2>Find something here</h2></div>
            <form action="" method="post">
            <div class="entry">
                <i class="fa fa-tags" aria-hidden="true"></i>
                <input type="text" name="product_name" id="" placeholder="Enter product name *" required>
                <button type="submit" name="b10">Search</button>
                <button type="reset">Reset</button>
            </div>
        </form>
            <div class="result">
				<table>
				<%
				if(request.getParameter("b10")!=null){
					String name=request.getParameter("product_name");
				
            try{
                Connection con1=ConnectionProvider.getConnection();
            	PreparedStatement pst=con1.prepareStatement("select * from items where item_name='"+name+"'");
            	ResultSet rs=pst.executeQuery(); 
            	boolean searchEmpty=true;
            %>
				<thead>
                    <tr>
                        <td>Item number</td>
                        <td>Item name</td>
                        <td>Item price</td>
                        <td>Item quantity</td>
                        <td>Action</td>
                    </tr>
                </thead>
            </table>
            <table>    
                <tbody>
                <% 
    					while(rs.next())
    					{
						%>
                
                <tr>
                                        
                    	<td><%=rs.getString("item_no")%></td>
                        <td><%=rs.getString("item_name")%></td>
                        <td><%=rs.getString("item_price")+" rs"%></td>
                        <td><%=rs.getString("item_quantity")%></td>
                        <td><a href='add_to_cart.jsp?no5=<%=rs.getString("item_no")%>'><button type="submit">Add to cart</button></a></td>
                    </tr>
                    <% 
                searchEmpty=false;
    				}
            	if(searchEmpty==true){
            		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
        	 		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
        	 		out.println("<script>");
        	 		out.println("$(document).ready(function() {");
        	 		out.println("swal ('Item not found' , 'You can search something else' , 'error');");
        	 		out.println("});");
        	 		out.println("</script>");

            	}
            	}catch(Exception e){
            		e.getLocalizedMessage();
            		}
				}
%>
                </tbody>
            </table>
                

            </div>
            
          <div class="copyright">
            <h4>copyright: Sandip Kumar Basak</h4>
          </div>
    </div>
</body>
</html>