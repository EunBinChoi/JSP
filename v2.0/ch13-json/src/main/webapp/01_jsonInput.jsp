<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON Input</title>
</head>
<body>

<form method="post" action="./JSONServlet">
	<label for="name">name : </label>
	<input type="text" id="name" name="name"><br/>
	<label for="age">age : </label>
	<input type="number" id="age" name="age"><br/>
	
	<input type="radio" id="member" name="isMember" value="true" checked>
	<label for="member">true</label>	
	<input type="radio" id="non-member" name="isMember" value="false">
	<label for="non-member">false</label>
	
	<input type="submit" value="send">
</form>

</body>
</html>