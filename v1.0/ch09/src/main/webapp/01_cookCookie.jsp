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
	
	Cookie cookie = new Cookie("myCookie", "1234");
	// myCookie: ��Ű �̸�
	// 1234: ��Ű ��
	
	cookie.setMaxAge(60); // 1��
	cookie.setValue("2345"); // ��Ű �� ����
	
	response.addCookie(cookie);
	// Ŭ���̾�Ʈ���� �������� �� ��Ű�� ������
	
%>
��Ű ���� Ȯ�� <a href="02_tasteCookie.jsp">Ŭ��</a>
</body>
</html>