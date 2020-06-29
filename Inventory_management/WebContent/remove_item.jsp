<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>This is the remove page</title>
</head>
<body>
<%
String[] arr=(String[])session.getAttribute("arr");
int[] quan=(int[])session.getAttribute("quan");
String id=request.getParameter("no10");
String elem = id;

for(int i = 0; i < arr.length; i++){
    if(arr[i].equals(elem)){
        // shifting elements
        for(int j = i; j < arr.length - 1; j++){
            arr[j] = arr[j+1];
        }
        for(int k = i; k < quan.length - 1; k++){
            quan[k] = quan[k+1];
        }
        break;
    }
}
session.setAttribute("arr", arr);
int p=0;int q=0;
while(arr[p]!=null){
	System.out.println(arr[p]);
	p=p+1;
}
while(quan[q]!=0){
	System.out.println(quan[q]);
	q=q+1;
}

session.setAttribute("quan", quan);
response.sendRedirect("my_cart.jsp");

%>
</body>
</html>