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
<title>Create Gallery Piece</title>
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
		<h1 class="mb-3">Upload New Gallery Piece</h1>
		<form action="/gallery/create" method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title" class="form-label">Title:</label>
				<input name="title" class="form-control"/>
				<p class="text-danger">${ titleMessage }</p>
			</div>
			<div class="form-group">
				<label for="size" class="form-label">Size:</label>
				<input name="size" class="form-control" />
				<p class="text-danger">${ sizeMessage }</p>
			</div>
			<div class="form-group">
				<label for="media" class="form-label">Media:</label>
				<input name="media" class="form-control" />
				<p class="text-danger">${ mediaMessage }</p>
			</div>
			<div class="form-group">
				<label for="createdOn" class="form-label">Date:</label>
				<input type="date" pattern="yyyy-MM-dd" name="date" class="form-control" />
				<p class="text-danger">${ dateMessage }</p>
			</div>
			<div class="form-group">
				<label for="image" class="form-label">Image:</label>
				<input type="file" name="image" class="form-control-file" accept=".jpg, .jpeg, .png" />
				<p class="text-danger">${ fileMessage }</p>
			</div>
			<input type="submit" class="btn btn-primary mt-3" value="Submit" />
		</form>
	</div>
</body>
</html>