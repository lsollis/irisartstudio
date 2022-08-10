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
		<div class="row">
		<div class="col">
		<div class="container">
			<h3>Gallery</h3>
			<ul class="list-group">
				<li class="list-group-item"><a href="">All</a></li>
				<li class="list-group-item"><a href="">Zentangle</a></li>
				<li class="list-group-item"><a href="">Rock Portraits</a></li>
				<li class="list-group-item"><a href="">Rugs/crafts</a></li>
				<li class="list-group-item"><a href="">Other</a></li>
			</ul>
		</div>
		</div>
		<div class="col-9">
			<c:forEach var="galleryPiece" items="${galleryPieces}">
				<div class="container text-center">
					<img src="" />
					<h4><c:out value="${galleryPiece.getTitle()}"></c:out></h4>
					<p><c:out value="${galleryPiece.getSize()}"></c:out></p>
					<p><c:out value="${galleryPiece.getMedia()}"></c:out></p>
					<p><c:out value="${galleryPiece.getCreatedOn()}"></c:out></p>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
</body>
</html>