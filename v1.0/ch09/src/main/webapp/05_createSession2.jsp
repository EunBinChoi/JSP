<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = "admin";
	String pwd = "1234";
	
	session.setAttribute("idKey", id);
	session.setAttribute("pwdKey", pwd);
%>
���� ���� �Ϸ�!
<a href="06_viewCookieSessionInfo.jsp">��Ű/���� ���� Ȯ��</a>
</body>
</html>