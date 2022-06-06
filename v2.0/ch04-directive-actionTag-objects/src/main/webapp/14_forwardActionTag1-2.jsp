<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>14_forwardActionTag1-2.jsp</h1>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String param = request.getParameter("param");
	%>
	<%= id %>
	<%= pwd %>
	<%= param %>
</body>
</html>