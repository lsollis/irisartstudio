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
<title>About the Artist</title>
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
						<a class="nav-link active" href="/login">Login</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container d-flex justify-content-center">
		<div class="container bg-light mb-5 p-5 col-md-10">
			<div class="row">
				<h1 class="mb-3">About the Artist</h1>
			</div>
			<div class="row">
				<div class="col-3">
					<img src="imgs/profile-photo-iris.jpeg" alt="profile photo iris" class="img-fluid" />
				</div>
				<div class="col">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada bibendum arcu vitae elementum curabitur. Sem integer vitae justo eget. Nisi est sit amet facilisis. Ultrices gravida dictum fusce ut placerat orci nulla pellentesque dignissim. Arcu dui vivamus arcu felis. Magna eget est lorem ipsum dolor sit. Nisi est sit amet facilisis. Adipiscing enim eu turpis egestas. Pretium vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae. Adipiscing at in tellus integer feugiat. Aliquet risus feugiat in ante.</p>
					<div class="container d-inline">
						<a href="https://www.instagram.com/iriskmc/"><img src="imgs/instagram.png" /></a>
					</div>
					<div class="container d-inline">
						<a href="https://www.facebook.com/iriskmc" ><img src="imgs/facebook.png" /></a>
					</div>
				</div>
			</div>
			
		</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>