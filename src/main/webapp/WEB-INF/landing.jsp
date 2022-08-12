<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>irisartstudio</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container p-5 mt-5 bg-light rounded-3">
	<div class="row">
	<div class="col-md-4 text-center d-flex align-items-center">
		<div class="container">
		<h1>irisartstudio</h1>
		<a href="/gallery" class="btn btn-outline-dark mb-3 mb-md-0">Enter the Gallery</a>
		</div>
	</div>
	<div class="col-md-7">
	<div class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="8000">
				<img src="/imgs/start-photo.jpg" class="d-block w-100" alt="" />
			</div>
			<c:forEach var="galleryPiece" items="${galleryPieces}">
				<div class="carousel-item" data-bs-interval="8000">
					<img src="<c:out value="${galleryPiece.getImageUrl() }"></c:out>" class="d-block w-100" alt="" />
				</div>
			</c:forEach>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	</div>
	<div class="col-md-1"></div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>