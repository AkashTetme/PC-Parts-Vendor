<%@page import="com.akash.entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("messege", "Login First");
	response.sendRedirect("login.jsp");
	return;

} else {

	if (user.getUserType().equals("NORMAL")) {
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
<title>Admin Page</title>
<!-- Common Bootsrap Components -->
<%@include file="bsComponents/common_js_css.jsp"%>
</head>
<body>

	<!-- Navbar  Components -->
	<%@include file="bsComponents/navbar.jsp"%>

	<div class="container">
	
		<!-- First Row  -->
		<div class="row mt-3">
		
		<!-- First Column  -->
		<div class="col-md-4">
		
			<div class="card  text-white bg-dark mt-3">
			
			<div class="card-body text-center">
			
			<div class="container">
			
			<img style="max-width: 125px" class="img-fluid rounded-cirle" alt="users_icon" src="IMAGES/team.png">
			
			</div>
			
			<h1 class="text-info">256</h1>
			
			<h1 class="text-uppercase text-muted">Users</h1> 
			
			</div>
			
			</div>
		
		</div>
		
		<!-- Second Column  -->
		<div class="col-md-4">
		
		<div class="card  text-white bg-dark mt-3">
			
			<div class="card-body text-center">
			
			<div class="container">
			
			<img style="max-width: 125px" class="img-fluid rounded-cirle" alt="categories_icon" src="IMAGES/standings.png">
			
			</div>
			
			<h1 class="text-info">256</h1>
			
			<h1 class="text-uppercase text-muted">Categories</h1> 
			
			</div>
			
			</div>
		
		</div>
		
		<!-- Third Column  -->
		<div class="col-md-4">
		
			<div class="card text-white bg-dark mt-3 ">
			
			<div class="card-body text-center">
			
			<div class="container">
			
			<img style="max-width: 125px" class="img-fluid rounded-cirle" alt="products_icon" src="IMAGES/shipping.png">
			
			</div>
			
			<h1 class="text-info">256</h1>
			
			<h1 class="text-uppercase text-muted">Products</h1> 
			
			</div>
			
			</div>
		
		</div>
		
		</div>
		
		<!-- Second Row  -->
		<div class="row mt-3">
		
			<!-- First Column  -->
			<div class="col-md-4">
				
				<div class="card text-white bg-dark mt-3 ">
			
					<div class="card-body text-center">
			
					<div class="container">
			
					<img style="max-width: 125px" class="img-fluid rounded-cirle" alt="products_icon" src="IMAGES/list.png">
			
					</div>
			
					<p class="text-primary">Click to add new Category</p>
			
					<h1 class="text-uppercase text-muted">Add Category</h1> 
			
					</div>
			
				</div>
			
			</div>
			
			<!-- Second Column  -->
			<div class="col-md-4">
				
				<div class="card text-white bg-dark mt-3 ">
			
					<div class="card-body text-center">
			
					<div class="container">
			
					<img style="max-width: 125px" class="img-fluid rounded-cirle" alt="products_icon" src="IMAGES/button.png">
			
					</div>
			
					<p class="text-primary">Click to add new Product</p>
			
					<h1 class="text-uppercase text-muted">Add Product</h1> 
			
					</div>
			
				</div>
			
			</div>
		
		</div>
	
	</div>

</body>
</html>