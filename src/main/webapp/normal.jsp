<%@page import="com.akash.entities.User"%>
<%

	User user =(User) session.getAttribute("current-user");

	if(user == null){
		
		session.setAttribute("messege", "Login First");
		response.sendRedirect("login.jsp");
		return;
		
	}else{
		
		if(user.getUserType().equals("admin")){
			session.setAttribute("messege", "!! Access Denied !!");
			response.sendRedirect("login.jsp");
			return;
			
		}
		
	}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal User Page</title>
<!-- Common Bootsrap Components -->
<%@include file="bsComponents/common_js_css.jsp"%>
</head>
<body>

	<!-- Navbar  Components -->
	<%@include file="bsComponents/navbar.jsp"%>

	<h3>Normal User Page</h3>
	
</body>
</html>