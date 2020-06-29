<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>This is the starting page</title>
    <style>
        body{
            background-image: url("images/b1.jpg");
            position: relative;
            height: 100%;
            width: 99%;
            background-repeat:no-repeat;
            background-size:100% 100vh;
        }
        .heading{
            height: 10%;
            width: 50%;
            margin: 10%;
        }
        .heading h1{
            color: white;
            font-weight: bolder;
            font-size: 55px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            text-shadow: 10px 8px 10px greenyellow;
        }
        #b{
            height: 40px;
            width: 10%;
            background-color: rgb(112, 180, 9);
            border: 2px solid greenyellow;
            border-radius: 12px;
            font-weight: bold;
            color: black;
            font-family: cursive;
            font-size: auto;
            transition: 1s;
        }
        #b:hover{
            height: 45px;
            width: 13%;
            transition: 1s;
        }
        #b:focus{
            outline: 2px solid yellowgreen;
            outline-style: double;
        }
        


    </style>
</head>
<body>
    <center>
    <div class="heading">
        <h1>Inventory Management System</h1>
    </div>
    
    <a href="login.jsp"><input type="button" value="Lets Go" id="b"></a>
    
</center>
</body>
</html>