<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String str12 = "12";%>
	<h1>12_forwardActionTag1.jsp</h1>
	<jsp:forward page="13_forwardActionTag1-1.jsp">
		<jsp:param name="param" value="<%=str12%>"/>
	</jsp:forward>
</body>
</html>