<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../components/header.jsp" %>
<link href="css/register-confirmation.css" rel="stylesheet" />
<link>
</head>
<body>
	<div class="root">
      <%@ include file="../components/navbar.jsp" %>

	  <main>
        <section id="registration-confirmation" class="mt-5">
		  <div class="container d-flex justify-content-center">
		    <div class="confirmation d-flex flex-column text-center">
		      <i class="fa-solid fa-check text-success"></i>
		      <h2 class="fw-semibold">Confirmation Email</h2>
		      <p class="text-secondary">
		        Your email has already been confirmed. You can now continue with your
		        works!!
		      </p>
		      <div class="wrapper">
		      	<a href="login">
		          <button class="btn btn-primary mt-3" >CONTINUE</button>
		        </a>
		      </div>
		    </div>
		  </div>
		</section>
      </main>

      <%@ include file="../components/footer.jsp" %>
   	</div>
</body>
</html>