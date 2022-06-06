<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	JSONObject requestObj = (JSONObject)session.getAttribute("requestObj");
%>
<h1>${ requestObj.get("name") }'s info</h1>
<ul>
	<li>name: ${ requestObj.get("name") }</li>
	<li>age: ${ requestObj.get("age") }</li>
	<li>isMember: ${ requestObj.get("isMember") }</li>
</ul>
</body>
</html>