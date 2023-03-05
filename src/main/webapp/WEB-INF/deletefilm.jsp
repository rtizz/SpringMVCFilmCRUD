<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Deletion</title>
</head>
<body>
	<div>
	<c:choose>
			<c:when test="${truedeleted = true}">
		<c:choose>
			<c:when test="${! empty filmtodelete}">
			<h2>The following film was successfully deleted</h2>
				<table>
					<tr>
						<td>${filmtodelete.filmId}</td>
						<td>${filmtodelete.title}</td>
						<td>${filmtodelete.desc}</td>
						<td>${filmtodelete.releaseYear}</td>
						<td>${filmtodelete.rating}</td>
						<td>${filmtodelete.category}</td>
					</tr>
				</table>
			<a href="index.html">Home</a>
				</c:when>
			<c:otherwise>
				${notdeleted}
				<a href="index.html">Home</a>
			</c:otherwise>
		</c:choose>
		</c:when>
		<c:otherwise>
			${falsedeleted}<br>
			${haschildren}
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>