<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thread</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://blackrockdigital.github.io/startbootstrap-3-col-portfolio/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://blackrockdigital.github.io/startbootstrap-3-col-portfolio/css/3-col-portfolio.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/imageboard.css" />">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<style>
form {
	float: none;
	margin-left: 30px;
}
</style>
</head>
<body>
	<c:if test="${moderator.exists()}">
		<ul>
			<li>${moderator.getUsername()}
			<li>
			<li><a href="modFlags">Flags</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>
	</c:if>
	<form method="POST" action="/ProjectTwo/board/post" enctype="multipart/form-data">
		<input name="parent" type="hidden" value="${threadId}" />
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Subject:</td>
				<td><input type="text" name="subject" /></td>
			</tr>
			<tr>
				<td>Comment:</td>
				<td><textarea id="comment" name="comment" rows="3" cols="20"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Post" /></td>
			</tr>
		</table>
	</form>
	<a href="/ProjectTwo/board/catalog">Return to Catalog</a>

	<c:forEach var="row" items="${listPosts}">
		<table id="${row.getId()}" border="1px solid black">
			<tr>
				<td rowspan="3"><c:if test="${row.getImage() != null}">
						<a target="_blank" href="/ProjectTwo/board/img/${row.getId()}">
							<img src="/ProjectTwo/board/thmb/${row.getId()}" />
						</a>
					</c:if></td>
				<td><c:out value="${row.getName()}" />
					<c:if test="${row.getName() == null}">Anonymous</c:if></td>
				<td><c:out value="${row.getSubject()}" /></td>
				<td><c:out value="${row.getTimeFormatted()}" /></td>
				<td class="postRow" data-post="${row.getId()}">No. <c:out
						value="${row.getId()}" /></td>
				<td>
					<form method="POST" action="flagPost">
						<input name="postId" type="hidden" value="${row.getId()}" /> <input
							type="submit" value="Flag" />
					</form>
				</td>
			</tr>
			<tr>
				<td id="postComment" rowspan="2" colspan="5"><c:out
						value="${row.getComment()}" /></td>
			</tr>
			<tr></tr>
		</table>
	</c:forEach>
</body>
<script>
	$(document).ready(function() {
		$(".postRow").click(function() {
			var post = $(this).data('post');
			var sel = $(this).closest('tr').next('tr').find('td').text();
			var txt = $("#comment");
			if (sel) {
				sel = ">" + sel;
			}
			if (txt.val()) {
				txt.val(txt.val() + "\n")
			}
			txt.val(txt.val() + ">>" + post + "\n" + sel);
		});
	});
</script>
</html>