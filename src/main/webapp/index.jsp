<%@page import="com.akash.hibFact.factoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PC PARTS HOME</title>

<!-- Common Bootsrap Components -->
<%@include file="bsComponents/common_js_css.jsp" %>

</head>
<body>

<!-- Navbar  Components -->
<%@include file="bsComponents/navbar.jsp" %>

<h1>creating sessionF object singleton</h1>

<% 

out.println(factoryProvider.getFactory());

%>

</body>
</html>