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
<title>Edit Gallery Piece</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-dark navbar-expand-lg bg-primary mb-5">
			<div class="container-fluid">
				<a class="navbar-brand" href="">irisartstudio</a>
			</div>
			<div class="collapse navbar-collapse d-flex" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link active" href="">Gallery</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">Shop</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">Blog</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">About/Contact</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="">Login</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
		<h1 class="mb-3">Edit Gallery Piece</h1>
		<form:form action="/gallery/edit/${ galleryPiece.id }" method="post" modelAttribute="galleryPiece">
			<input type="hidden" name="_method" value="put" />
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
				<label for="img" class="form-label">Image:</label>
				<input type="file" name="img" class="form-control" accept=".jpg, .jpeg, .png" />
				<errors class="text-danger" />
			</div>
			<input type="submit" class="btn btn-primary mt-3" value="Submit" />
		</form:form>
		<form:form class="d-inline" action="/gallery/delete/${ galleryPiece.id }" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" class="btn btn-danger mt-3" value="Delete">
		</form:form>

	</div>
</body>
</html>