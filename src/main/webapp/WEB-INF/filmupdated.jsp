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
	<c:choose>
			<c:when test="${! empty updatedfilm}">
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
					<td>${updatedfilmid}</td>
					<td>${updatedfilm.title}</td>
					<td>${updatedfilm.desc}</td>
					<td>${updatedfilm.releaseYear}</td>
					<td>${updatedfilm.langId}</td>
					<td>${updatedfilm.rentDur}</td>
					<td>${updatedfilm.rate}</td>
					<td>${updatedfilm.length}</td>
					<td>${updatedfilm.repCost}</td>
					<td>${updatedfilm.rating}</td>
					<td>${updatedfilm.features}</td>
				</tr>
			</table>
			</c:when>
			<c:otherwise>
				<p>Film not Entered</p>
			</c:otherwise>
	</c:choose>
<a href="index.html">Home</a>
</body>
</html>