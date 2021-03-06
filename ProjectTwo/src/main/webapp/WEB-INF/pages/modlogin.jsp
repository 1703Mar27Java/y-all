<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://blackrockdigital.github.io/startbootstrap-3-col-portfolio/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://blackrockdigital.github.io/startbootstrap-3-col-portfolio/css/3-col-portfolio.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/imageboard.css" />">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

</head>
<body>
	<div id="nav">
		<ul>
			<li><a href="catalog">Catalog</a></li>
			<c:if test="${!moderator.exists()}">
				<li style="float: right"><a href="/ProjectTwo/board/modLogin">Admin
						Login</a></li>
			</c:if>
		</ul>
	</div>

	<div class="postForm">
		<form method="POST" action="modLogin">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Login" /></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>