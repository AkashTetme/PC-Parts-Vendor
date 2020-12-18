<%@page import="java.util.List"%>
<%@page import="com.akash.hibFact.factoryProvider"%>
<%@page import="com.akash.DAO.categoryDao"%>
<%@page import="com.akash.entities.Catagory"%>
<%@page import="com.akash.entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");

if (user == null) {

	session.setAttribute("messege", "Login First to Check out");
	response.sendRedirect("login.jsp");
	return;

}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>checkout Page</title>

<%@include file="bsComponents/common_js_css.jsp" %>

</head>
<body>

<%@include file="bsComponents/navbar.jsp" %>

<div class="container">

<div class="row mt-5">

<div class="col-md-6">

<!-- card -->

<div class="card">

<div class="card-body bg-dark">

<h2 class="text-center">Your Selected Items</h2>

<div class="cart-body text-white">


</div>

</div>

</div>

</div>

<div class="col-md-6">

<!-- form -->
<div class="card">

<div class="card-body bg-dark">

<h2 class="text-center">Your Details For Order</h2>

<div class="form-group text-white">
    <label for="exampleInputEmail1 ">Email address</label>
    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
 </div>
 
 <div class="form-group text-white">
    <label for="exampleInputName">Your Name</label>
    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
 </div>
 
 <div class="form-group text-white">
    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Address" rows="3"></textarea>
 </div>
 
 <div class="form-group text-white">
    <label for="exampleInputNumber">Contact Number</label>
    <input value="<%= user.getUserPhone() %>" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Number">
 </div>
  
 <div class="container text-center">
 
 <button class="btn btn-success">Order Now</button>
 
 </div>

</div>

<button class="btn btn-primary">Continue Shopping</button>

</div>

</div>

</div>

</div>


<!-- Common modals Components -->
<%@include file="bsComponents/common_modal.jsp"%>

</body>
</html>