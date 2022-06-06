<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="fileUploadForm" method="post" 
enctype="multipart/form-data" accept-charset="UTF-8" action="./FileUploadServlet">
	<label for="title">title: </label>
	<input type="text" id="title" name="title"> <br/>
	<label for="user">user: </label>
	<input type="text" id="user" name="user"> <br/>
	<label for="inputFile">file: </label>
	<input type="file" id="inputFile" name="inputFile"> <br/>
	<input type="submit" value="Upload">
</form>
</body>
</html>