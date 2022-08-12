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
<title>irisartstudio edit gallery</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg mb-5 border-bottom">
			<div class="container-fluid">
				<a class="h1" href="/landing">irisartstudio</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" href="/gallery">Gallery</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">Shop</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">Blog</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/about">About/Contact</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="/logout">Logout</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
	<div class="row d-flex justify-content-center">
	<div class="col-xs-12 col-md-6 bg-light px-5 py-3">
		<h1 class="mb-3">Edit Gallery Piece</h1>
		<form:form class= "d-inline" action="/gallery/edit/${ galleryPiece.id }" method="post" modelAttribute="galleryPiece" enctype="multipart/form-data">
			<input type="hidden" name="_method" value="put" />
			<form:input type="hidden" path="imageUrl" value="${galleryPiece.imageUrl }" />
			<div class="form-group">
				<form:label for="title" path="title" class="form-label">Title:</form:label>
				<form:input path="title" class="form-control"/>
				<form:errors path="title" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label for="size" path="size" class="form-label">Size:</form:label>
				<form:input path="size" class="form-control" />
				<form:errors path="size" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label for="media" path="media" class="form-label">Media:</form:label>
				<form:input path="media" class="form-control" />
				<form:errors path="media" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label for="createdOn" path="createdOn" class="form-label">Date:</form:label>
				<form:input type="date" path="createdOn" class="form-control" />
				<form:errors path="createdOn" class="text-danger"/>
			</div>
			<div class="form-group">
				<form:label for="image" path="imageUrl" class="form-label">Image:</form:label>
				<input type="file" name="file" class="form-control" accept=".jpg, .jpeg, .png" />
				<form:errors path="imageUrl" class="text-danger" />
			</div>
			<input type="submit" class="btn btn-outline-dark mt-3 mb-3 d-inline" value="Update" />
		</form:form>
		<form:form class="d-inline" action="/gallery/delete/${ galleryPiece.id }" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" class="btn btn-outline-danger m-3" value="Delete">
		</form:form>
	</div>
	</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>