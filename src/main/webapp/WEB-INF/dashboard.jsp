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
<title>Dashboard</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<body>
	<div class="container">
		<nav class="navbar navbar-dark navbar-expand-lg bg-primary mb-5">
			<div class="container-fluid">
				<a class="navbar-brand" href="">irisartstudio</a>
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
		<h1 class="mb-3">Welcome, <c:out value="${ user.getFirstName() }"></c:out>!</h1>
		<div class="container">
			<h3>Gallery</h3>
			<table class="table" id="tbl">
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
							<td><img src="<c:out value="${galleryPiece.getImageUrl()}"></c:out>" /></td>
							<td><c:out value="${galleryPiece.getTitle()}"></c:out></td>
							<td><c:out value="${galleryPiece.getSize()}"></c:out></td>
							<td><c:out value="${galleryPiece.getMedia()}"></c:out></td>
							<td><c:out value="${galleryPiece.getCreatedOn()}"></c:out></td>
							<td><a class="btn btn-primary" href="/gallery/edit/<c:out value="${galleryPiece.getId()}"></c:out>">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a class="btn btn-primary mt-5" href="/gallery/new">Add to My Gallery</a>
		</div>
	</div>
</body>
</html>