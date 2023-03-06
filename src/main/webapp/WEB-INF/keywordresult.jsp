<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Site</title>
</head>
<body>
	<div>
		<a href="index.html">Home</a><br>
		<c:choose>
			<c:when test="${! empty keyword}">
			<table >
				<thead>
					<tr>
						<td>ID</td>
						<td>TITLE</td>
						<td>DESCRIPTION</td>
						<td>YEAR</td>
						<td>RATING</td>
						<td>CATEGORY</td>
					</tr>
				</thead>
				<c:forEach var="k" items="${keyword}">
					<tr>
						<td>${k.filmId} </td>
						<td>${k.title}</td>
						<td>${k.desc}</td>
						<td>${k.releaseYear}</td>
						<td>${k.rating}</td>
						<td>${k.category}</td>
					</tr>
					<tr>
						<td colspan="6"><strong>Cast:</strong>${k.actor}</td>
					</tr>
					<tr>
						<td>
						<form action="filmDelete.do" method="POST">
							<button name="delete" type="submit" value="${k.filmId}">Delete Film</button>
						</form>
						</td>

						<td>
							<form action="updateFilmForm.do" method="GET">
							<button name="update" type="submit" value="${k.filmId}">Update Film</button>
						</form>
						</td>
					</tr>
				</c:forEach>
				</table>
				<br>
			</c:when>
			<c:otherwise>
				<p>No Film found</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>