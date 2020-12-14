<%

String messege = (String) session.getAttribute("messege");

if(messege != null){
	
%>

<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%= messege %></strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
	
	session.removeAttribute("messege");
	
}

%>