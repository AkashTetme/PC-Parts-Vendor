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
	
	
	<div class="container">
	
	
		<!-- First Row  -->
	<div class="row mt-3 md-5">
		
		<div class="card bg-dark">
		  <h5 class="card-header text-white">Hello <%= user.getUserName() %></h5>
		  <div class="card-body">
		    <h5 class="card-title text-white">Hope you like our E-Commerce web-site.</h5>
		    <p class="card-text text-white">This project is built on using Java and Servlets for back-end And JSP, Bootstrap 4
		    including HTML, CSS, JS for front-end technologies.</p>
		    <br>
		    <p class="card-text text-info"> For Project Details, Click on below button</p>
		    <a href = "mailto: tetme.akasht@gmail.com" class="btn btn-primary">tetme.akasht@gmail.com</a>
		  </div>
		</div>

	</div>
	
	</div>
	
	
<!-- Common modals Components -->
<%@include file="bsComponents/common_modal.jsp"%>
	
</body>
</html>