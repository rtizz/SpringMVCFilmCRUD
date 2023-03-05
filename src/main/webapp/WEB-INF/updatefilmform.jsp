<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>Update The Desired Fields</h2>
		<a href="index.html">Home</a><br>
		<br>
		Film ID cannot be modified
	<form action="filmUpdated.do" method="POST">
		FilmId: <input type="text" name="filmId" value="${update.filmId}" /><br>
		Title:
		<input type="text" name="title" value="${update.title}"/> 
		<br>
		<label for="description">Description:</label><br>
		<textarea id="description" name="desc" rows="4" cols="50">${update.desc}</textarea>
		<br>
		Release Year:
		<input type="text" name="releaseYear" value="${update.releaseYear}" /> 
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
		<input type="text" name="rentDur" value="${update.rentDur}"/> 
		<br>
		Rental Rate: <input type="text" name="rate" value="${update.rate}"/> <br> 
		Film Length:
		<input type="text" name="length" value="${update.length}" /> <br> 
		Replacement Cost: <input
			type="text" name="repCost" value="${update.repCost}"/> <br> 
			
			<label>Rating:</label> 
			<select name="rating" >
			<option value="${update.rating}"/>
			<option value="PG">PG</option>
			<option value="G">G</option>
			<option value="NC17">NC17</option>
			<option value="PG13">PG13</option>
			<option value="R">R</option>
		</select> <br>
		
			 <label>Special Features:</label> <br>
		 <input type="checkbox" name="features" value="${update.features}">
		 <label for="Trailers">Trailers</label><br>
		 <input type="checkbox" name="features" value="${update.features}">
		 <label for="Commentaries">Commentaries</label><br>
		 <input type="checkbox" name="features" value="${update.features}">
		 <label for="Deleted Scenes">Deleted Scenes</label><br>
		 <input type="checkbox" name="features" value="${update.features}">
		 <label for="Behind the Scenes">Behind the Scenes</label><br>
		<input type="submit" value="Submit Film" />
	</form>

</body>
</html>