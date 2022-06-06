<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sally's Page</title>
</head>
<body>
	<jsp:include page="header.jsp"/> 
	<h2>Notice for deleting your info</h2>
	<p>Please read the introduction for membership cancellation.</p>
	<form method="get" action="./DeleteServlet">
		<label for="agree">check if you want to really delete your info.</label>
		<input type="checkbox" id="agree" name="agree" value="yes">
		<input type="submit" value="Agree">
	</form>
	<jsp:include page="footer.jsp"/> 
</body>
</html>