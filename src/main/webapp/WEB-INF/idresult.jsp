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
		<c:choose>
			<c:when test="${! empty filmdetails}">
				<table>
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
					<tr>
						<td>${filmdetails.filmId}</td>
						<td>${filmdetails.title}</td>
						<td>${filmdetails.desc}</td>
						<td>${filmdetails.releaseYear}</td>
						<td>${filmdetails.rating}</td>
						<td>${filmdetails.category}</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<p>No Film found</p>
			</c:otherwise>
		</c:choose>
		<p>
			<strong>Actors/Actresses</strong>
		</p>
		<c:forEach var="f" items="${filmdetails.actor}">
			<ul>
				<li>${f}</li>
			</ul>
		</c:forEach>
	</div>

	<table>
		<tr>
			<td>
				<form action="filmDelete.do" method="POST">
					<button name="delete" type="submit" value="${filmdetails.filmId}">Delete Film</button>
				</form>
			</td>
			<td>
				<form action="FilmUpdate.do" method="POST">
					<input type="submit" value="Update" />
				</form>
			</td>
		</tr>
	</table>
</body>
</html>