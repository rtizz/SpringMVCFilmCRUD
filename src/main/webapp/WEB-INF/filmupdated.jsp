<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update film</title>
</head>
<body>
<a href="index.html">Home</a><br>
	<c:choose>
			<c:when test="${! empty film}">
			<table>
				<thead>
					<tr>
						<td> ID</td>
						<td> TITLE</td>
						<td> DESCRIPTION</td>
						<td> YEAR</td>
						<td> LANGUAGE ID</td>
						<td> RENTAL DURATION</td>
						<td> RENTAL PRICE</td>
						<td> LENGTH</td>
						<td> REPLACEMENT COST</td>
						<td> RATING</td>
						<td> SPECIAL FEATURES</td>
					</tr>
				</thead>
				<tr>
					<td>${film.filmId}</td>
					<td>${film.title}</td>
					<td>${film.desc}</td>
					<td>${film.releaseYear}</td>
					<td>${film.langId}</td>
					<td>${film.rentDur}</td>
					<td>${film.rate}</td>
					<td>${film.length}</td>
					<td>${film.repCost}</td>
					<td>${film.rating}</td>
					<td>${film.features}</td>
				</tr>
			</table>
			</c:when>
			<c:otherwise>
				<p>Film not Entered</p>
			</c:otherwise>
	</c:choose>

</body>
</html>