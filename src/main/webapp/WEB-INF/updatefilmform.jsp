<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>Update The Desired Fields</h2>
		Film ID cannot be modified</p>
	<form action="updateFilmForm.do" method="POST">
		Title:
		<input type="text" name="title" value="${filmtoupdate.title}"/> 
		<br>
		<label for="description">Description:</label><br>
		<textarea id="description" name="desc" rows="4" cols="50">${filmtoupdate.desc}</textarea>
		<br>
		Release Year:
		<input type="text" name="releaseYear" value="${filmtoupdate.releaseYear}" /> 
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
		<input type="text" name="rentDur" value="${filmtoupdate.rentDur}"/> 
		<br>
		Rental Rate: <input type="text" name="rate" /> <br> Film Length:
		<input type="text" name="length" /> <br> Replacement Cost: <input
			type="text" name="repCost" /> <br> 
			<label>Rating:</label> 
			<select name="rating">
			<option value="PG">PG</option>
			<option value="G">G</option>
			<option value="NC17">NC17</option>
			<option value="PG13">PG13</option>
			<option value="R">R</option>
		</select> <br>
		Film Length:
		<input type="text" name="length" value="${filmtoupdate.length}"/> 
		<br>
		Replacement Cost:
		<input type="text" name="repCost" value="${filmtoupdate.repCost}"/> 
		<br>
		Rating:
		<input type="text" name="rating" value="${filmtoupdate.rating}"/> 
		<br>
			 <label>Special Features:</label> <br>
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
</body>
</html>