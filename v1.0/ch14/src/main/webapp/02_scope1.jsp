<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("id", "admin");
	// session �����ֱ� (�⺻�� 30��)��ŭ ����
	application.setAttribute("name", "goott");
	// ������ ����Ǵ� ���� ����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int sum = 0;
	for(int i = 1; i <= 10; i ++){
		sum += i;
	}
	
	request.setAttribute("sum", sum);
%>
<jsp:forward page="03_scope2.jsp"/>
<!-- 3������ ������� �Ѿ (+ ��û ��ü ����) -->
</body>
</html>