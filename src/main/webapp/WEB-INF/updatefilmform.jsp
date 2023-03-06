<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Film</title>
</head>
<body>
		<h2>Update The Desired Fields</h2>
		<a href="index.html">Home</a><br>
		<br>
		Film ID cannot be modified
	<form action="filmUpdated.do" name="updatefilm" action="#" onsubmit="required()" method="POST">
		FilmId: <input type="number" name="filmId" value="${update.filmId}" readonly /><br> 
		Title:
		<input type="text" name="title" value="${update.title}"/> 
		<br>
		<br>
		<label for="description">Description:</label><br>
		<textarea id="description" name="desc" rows="4" cols="50">${update.desc}</textarea>
		<br>
		<br>
		Release Year:
		<input type="number" name="releaseYear" value="${update.releaseYear}" min="1850" max="2025"/> 
		<br>
			<label>Language Id:</label> 
		<select name="langId">
			<option value=1>English</option>
			<option value=2>Italian</option>
			<option value=3>Japanese</option>
			<option value=4>Mandarin</option>
			<option value=5>French</option>
			<option value=6>German</option>
		</select> <br> 
		Rental Duration:
		<input type="number" name="rentDur" min="3" max="14"value="${update.rentDur}"/> 
		<br>
		Rental Rate: <input type="number" name="rate" placeholder="1.99" step="0.01" min="1" max="20" value="${update.rate}"/> <br> 
		Film Length:
		<input type="number" name="length" value="${update.length}" /> <br> 
		Replacement Cost: <input
			type="number" name="repCost" placeholder="9.99"step="0.01" min="0" max="100"value="${update.repCost}"/> <br> 
			
			<label>Rating:</label> 
			<select name="rating" >
			<option value="${update.rating}">${update.rating}</option>
			<option value="PG">PG</option>
			<option value="G">G</option>
			<option value="NC17">NC17</option>
			<option value="PG13">PG13</option>
			<option value="R">R</option>
			</select> <br>
		
		
			 <label>Special Features:</label> <br>
			<%--  <c:choose>
			 <c:when test="${empty update.features}">
			 <strong>Current: No Special Features</strong><br>
			 </c:when>
			 <c:otherwise>
			 <strong>Current: ${update.features}</strong>
			 </c:otherwise>
			 </c:choose>
			 <br> --%>
		 <input type="checkbox" name="features" value="Trailers">
		 <label for="Trailers">Trailers</label><br>
		 <input type="checkbox" name="features" value="Commentaries">
		 <label for="Commentaries">Commentaries</label><br>
		 <input type="checkbox" name="features" value="Deleted Scenes">
		 <label for="Deleted Scenes">Deleted Scenes</label><br>
		 <input type="checkbox" name="features" value="Behind the Scenes">
		 <label for="Behind the Scenes">Behind the Scenes</label><br>

		 
		<input type="submit" value="Submit Film" />
	</form>

</body>
</html>