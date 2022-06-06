<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="03_param2.jsp">
	<label for="id">ID: </label> 
	<input type="text" id="id" name="id"> <br/>
	
	<label for="pwd">PWD: </label> 
	<input type="password" id="pwd" name="pwd"> <br/>
	
	<label for="hobby">HOBBY: </label>
	<label for="hobby1">독서</label>
	<input type="checkbox" id="hobby1" name="hobby" value="독서">
	<label for="hobby2">여행</label>
	<input type="checkbox" id="hobby2" name="hobby" value="여행"> 
	<label for="hobby3">게임</label>
	<input type="checkbox" id="hobby3" name="hobby" value="게임"> 
	<label for="hobby4">영화</label>
	<input type="checkbox" id="hobby4" name="hobby" value="영화"> 
	<label for="hobby5">운동</label>
	<input type="checkbox" id="hobby5" name="hobby" value="운동"><br/>
	<input type="hidden" name="params" value="5">
	<input type="submit" value="Submit">
</form>
</body>
</html>