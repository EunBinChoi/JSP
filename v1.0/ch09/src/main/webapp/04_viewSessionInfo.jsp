<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Enumeration en = session.getAttributeNames();
	// Collection �����ӿ�ũ�� ��������� ���� ������� �������̽�
	
	while(en.hasMoreElements()){ // ������ �ݺ��� ��� Ȯ��
		String name = (String)en.nextElement();
		// ��� �ϳ��� ���� (idKey, pwdKey)
		
		String value = (String)session.getAttribute(name);
		// �־��� �̸��� ���� ���ǿ� �Ҵ�� �� ����
		// (admin, 1234)
		
		out.println(name + "<br/>");
		out.println(value + "<br/>");
	}
%>
</body>
</html>