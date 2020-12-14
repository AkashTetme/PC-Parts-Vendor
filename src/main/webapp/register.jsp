<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<!-- Common Bootsrap Components -->
<%@include file="bsComponents/common_js_css.jsp" %>

</head>
<body>

<!-- Navbar  Components -->
<%@include file="bsComponents/navbar.jsp" %>

<div class="container-fluid">

<div class="row mt-5">

<div class="col-md-4 offset-md-4">

<div class="card text-white bg-dark mb-3">

<div class="card-body px-8 ">

<img src="IMAGES/profile.png" class="text-center" style="height: 100px">

<form >

<h3 class="text-center my-3">Sign-up here</h3>

  <div class="form-group">
    <label for="name">User name</label>
    <input type="text" class="form-control" id="name" placeholder="Enter Here">
  </div>
  
  <div class="form-group">
    <label for="email">User Email</label>
    <input type="email" class="form-control" id="email" placeholder="Enter Here">
  </div>

	<div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" placeholder="Enter Here">
  </div>
  
  <div class="form-group">
    <label for="phone">Phone</label>
    <input type="number" class="form-control" id="phone" placeholder="Enter Here">
  </div>
  
  <div class="form-group">
    <label for="address">Address</label>
    <textarea style="height: 200px" class="form-control" id="address" placeholder="Enter Address Here"></textarea>
  </div>
  
  <div class="container text-center">
  	
  	<button class="btn btn-success">Register</button>
  	<button class="btn btn-warning">Reset</button>
  
  </div>
  
</form>

</div>

</div>

</div>

</div>

</div>

</body>
</html>