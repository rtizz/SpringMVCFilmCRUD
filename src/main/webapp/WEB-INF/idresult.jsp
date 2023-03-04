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
				<ul>
					<li>${filmdetails.filmId}</li>
					<li>${filmdetails.title}</li>
					<li>${filmdetails.desc}</li>
					<li>${filmdetails.releaseYear}</li>
					<li>${filmdetails.rating}</li>
				</ul>
			</c:when>
			<c:otherwise>
				<p>No Film found</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>