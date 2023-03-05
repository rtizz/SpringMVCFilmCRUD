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
		Language Id:
		<input type="text" name="langId" value="${filmtoupdate.langId}"/> 
		<br>
		Rental Duration:
		<input type="text" name="rentDur" value="${filmtoupdate.rentDur}"/> 
		<br>
		Rental Rate:
		<input type="text" name="rate" value="${filmtoupdate.rate}"/> 
		<br>
		Film Length:
		<input type="text" name="length" value="${filmtoupdate.length}"/> 
		<br>
		Replacement Cost:
		<input type="text" name="repCost" value="${filmtoupdate.repCost}"/> 
		<br>
		Rating:
		<input type="text" name="rating" value="${filmtoupdate.rating}"/> 
		<br>
		Special Features:
		<input type="text" name="features" value="${filmtoupdate.features}"/> 
		<br>
		<input type="submit" value="Submit Film" />
	</form>
</body>
</body>
</html>