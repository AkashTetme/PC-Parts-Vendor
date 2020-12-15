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

	<div class="container custom-bg-card">
	
		<!-- First Row  -->
		<div class="row mt-3 ">
		
		<!-- First Column  -->
		<div class="col-md-4">
		
			<div class="card text-white bg-dark mt-3">
			
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
				
				<div class="card text-white bg-dark mt-3 " data-toggle="modal" data-target="#add-category-modal">
			
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
				
				<div class="card text-white bg-dark mt-3 " data-toggle="modal" data-target="#add-product-modal">
			
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


<!-- Add category model  -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg-navbar text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
		<form action="">
		
			<div class="form-group">
			
			<input 
				type="text" 
				class="form-control"
				name="catTitle"
				placeholder="Category title"
				required="required"
				/>
			
			</div>
			
			<div class="form-group">
			
			<textarea
				style="height: 200px"
				class="form-control" 
				placeholder="Category description"
				name="catDescription"
				required="required"
				></textarea>
			
			</div>
			
			<div class="container">
			
				<button class="btn btn-success">Add Category</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			
			</div>
		
		</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">AkashT</button>
      </div>
    </div>
  </div>
</div>

<!-- end Add category model -->

<!-- Add product model  -->

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg " role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg-navbar text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
		<form action="">
		
			<div class="form-group">
			
			<input 
				type="text" 
				class="form-control"
				name="prodName"
				placeholder="Product name"
				required="required"
				/>
			
			</div>
			
			<div class="form-group">
			
			<textarea
				style="height: 200px"
				class="form-control" 
				placeholder="Product description"
				name="prodDescription"
				required="required"
				></textarea>
			
			</div>
			
			<div class="form-group">
			
			<input 
				type="number" 
				class="form-control"
				name="prodPrice"
				placeholder="Product Price"
				required="required"
				/>
			
			</div>
			
			<div class="form-group">
			
			<input 
				type="number" 
				class="form-control"
				name="prodDesc"
				placeholder="Product Descount"
				required="required"
				/>
			
			</div>
			
			<div class="form-group">
			
			<input 
				type="number" 
				class="form-control"
				name="prodQuant"
				placeholder="Product Quantity"
				required="required"
				/>
			
			</div>
			
			<div class="form-group">
			
			<input 
				type="image" 
				class="form-control"
				name="prodPic"
				placeholder="Product Pic"
				required="required"
				/>
			
			</div>
			
			
			<div class="container">
			
				<button class="btn btn-success">Add Product</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			
			</div>
		
		</form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">AkashT</button>
      </div>
    </div>
  </div>
</div>

<!-- end Add product model -->

</body>
</html>