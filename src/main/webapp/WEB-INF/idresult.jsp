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
							<td>LANGUAGE ID</td>
							<td>RENTAL DURATION</td>
							<td>RENTAL RATE</td>
							<td>LENGTH</td>
							<td>REPLACEMENT COST</td>
							<td>RATING</td>
							<td>SPECIAL FEATURES</td>
							<td>CATEGORY</td>
						</tr>
					</thead>
					<tr>
						<td>${filmdetails.filmId}</td>
						<td>${filmdetails.title}</td>
						<td>${filmdetails.desc}</td>
						<td>${filmdetails.releaseYear}</td>
						<td>${filmdetails.langId}</td>
						<td>${filmdetails.rentDur}</td>
						<td>${filmdetails.rate}</td>
						<td>${filmdetails.length}</td>
						<td>${filmdetails.repCost}</td>
						<td>${filmdetails.rating}</td>
						<td>${filmdetails.features}</td>
						<td>${filmdetails.category}</td>
					</tr>
					<tr>
						<td>
							<p>
								<strong>Cast:</strong>
							</p> <c:forEach var="f" items="${filmdetails.actor}">
								<ul>
									<li>${f}</li>
								</ul>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td>
						<form action="filmDelete.do" method="POST">
							<button name="delete" type="submit" value="${filmdetails.filmId}">Delete Film</button>
						</form>
						</td>

						<td>
							<form action="updateFilmForm.do" method="POST">
							<button name="update" type="submit" value="${filmdetails.filmId}">Update Film</button>
						</form>
						<%-- <a href="updateFilmForm.do?id=${filmdetails.filmId}">Update Film</a> --%>
						</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<p>No Film found</p>
				<a href="index.html">Home</a>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>