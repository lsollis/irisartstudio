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
		<h1 class="mb-5">Welcome, <c:out value="${ user.getFirstName() }"></c:out>!</h1>
		<div class="container bg-light mb-5">
			<h3>Gallery</h3>
			<table class="table text-nowrap" id="tbl">
				<thead>
				<tr>
					<th scope="col">Thumbnail</th>
					<th scope="col">Title</th>
					<th scope="col">Size</th>
					<th scope="col">Media</th>
					<th scope="col">Date Created</th>
					<th scope="col">Actions</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="galleryPiece" items="${galleryPieces}">
						<tr>
							<td><img src="<c:out value="${galleryPiece.getImageUrl()}"></c:out>" class="img-fluid img-thumbnail" style="max-width: 200px" /></td>
							<td><c:out value="${galleryPiece.getTitle()}"></c:out></td>
							<td><c:out value="${galleryPiece.getSize()}"></c:out></td>
							<td><c:out value="${galleryPiece.getMedia()}"></c:out></td>
							<td><c:out value="${galleryPiece.getSimpleDate()}"></c:out></td>
							<td><a class="btn btn-outline-dark" href="/gallery/edit/<c:out value="${galleryPiece.getId()}"></c:out>">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a class="btn btn-outline-dark my-5" href="/gallery/new">Add to My Gallery</a>
		</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>