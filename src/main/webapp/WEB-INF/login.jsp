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
<title>Login</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- for your local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
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
		<div class="row">
			<div class="col">
				<h2>Login</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group">
						<form:label for="userName" path="userName" class="form-label">Username:</form:label>
						<form:input path="userName" class="form-control" />
						<form:errors path="userName" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:input path="password" type="password" class="form-control" />
						<form:errors path="password" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-primary mt-3" value="Submit" />
				</form:form>
			</div>
			<div class="col">
				<h2>New User? Register Here!</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">
					<div class="form-group">
						<form:label for="userName" path="userName" class="form-label">User Name:</form:label>
						<form:input path="userName" class="form-control"/>
						<form:errors path="userName" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="firstName" path="firstName" class="form-label">First Name:</form:label>
						<form:input path="firstName" class="form-control"/>
						<form:errors path="firstName" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="lastName" path="lastName" class="form-label">Last Name:</form:label>
						<form:input path="lastName" class="form-control"/>
						<form:errors path="lastName" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="email" path="email" class="form-label">Email:</form:label>
						<form:input path="email" class="form-control" />
						<form:errors path="email" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="password" path="password" class="form-label">Password:</form:label>
						<form:input type="password" path="password" class="form-control" />
						<form:errors path="password" class="text-danger"/>
					</div>
					<div class="form-group">
						<form:label for="confirm" path="confirm" class="form-label">Confirm Password:</form:label>
						<form:input type="password" path="confirm" class="form-control" />
						<form:errors path="confirm" class="text-danger"/>
					</div>
					<input type="submit" class="btn btn-primary mt-3" value="Submit" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>