<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		// 7번 페이지에서 사용자가 입력한 값
	%>
	<h2>Header</h2>
	<%= name %>
</body>
</html>