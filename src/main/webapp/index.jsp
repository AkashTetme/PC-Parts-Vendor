<%@page import="com.akash.hibFact.descWrapper"%>
<%@page import="com.akash.entities.Catagory"%>
<%@page import="com.akash.DAO.categoryDao"%>
<%@page import="com.akash.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.akash.DAO.productDao"%>
<%@page import="com.akash.hibFact.factoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PC PARTS HOME</title>

<!-- Common Bootsrap Components -->
<%@include file="bsComponents/common_js_css.jsp"%>

</head>
<body>

	<!-- Navbar  Components -->
	<%@include file="bsComponents/navbar.jsp"%>

	<div class="container-fluid">
	<div class="row mt-3 mx-2">
	
	<%
	
		String cat = request.getParameter("category");
	
		productDao pdao = new productDao(factoryProvider.getFactory());
		
		List<Product> plist = null;
		
		
		if(cat == null ||cat.trim().equals("all")){
			
			plist = pdao.getAllProducts();
		}else{
			
			int cId = Integer.parseInt(cat.trim());
			plist = pdao.getAllProductsById(cId);
			
		}
		
		categoryDao cdao = new categoryDao(factoryProvider.getFactory());
		List<Catagory> clist = cdao.getCategories();
	
	%>
	
		<!-- Show Categories -->
		<div class="col-md-2 ">
		
		<div class="list-group mt-4">
		<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
    	All Products
  		</a>
		
				
		<%
			for(Catagory c : clist)	{
				
		%>	
				
				<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryName() %></a>
				
		<%	
				
			}
		
		%>
		
		</div>
		
		</div>
		
		<!-- Show Products -->
		<div class="col-md-10">
		
		<div class="row mt-4"></div>
			
			<div class="col-md-12">
				
				<div class="card-columns">
				
					<%
						for(Product p : plist)	{
					%>
						
						<!-- product card -->
						<div class="card bg-dark text-white product-card">
						
						<div class="container text-center">
							<img class="card-img-top m-2" src="IMAGES/Products/<%= p.getProductPic() %>" 
						style="max-height: 200px; width: auto;" alt="..." >
						</div>
						
							<div class="card-body">
								
								<h5 class="card-title"><%= p.getProductName() %></h5>
								<p class="card-text">
									<%= descWrapper.descWrapp(p.getProductDesc()) %>
								</p>
								
							</div>
							
							<div class="card-footer text-center">
							
							<button class="btn btn-warning text-white" onclick="add_to_cart(<%= p.getProductId() %>, '<%= p.getProductName() %>', <%= p.getDiscPrice() %>)">Add to Cart</button>
							<button class="btn btn-success ">
							 &#8377 <%= p.getDiscPrice() %>/- 
							 <span class="text-dark discount-label">
							 <%= p.getProductPrice() %> ,<%= p.getProductDiscount() %>% off</span></button>
							
							</div>
						
						</div>
						
					<%
						}
					
					if(plist.size() ==0 ){
						out.println("<===3");
						
					}
					
					%>				
				
				</div>
				
			</div>

		</div>
	
	</div>
</div>
</body>
</html>