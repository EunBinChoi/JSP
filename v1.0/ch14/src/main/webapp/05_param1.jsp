<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
id: ${param.id}<br/>
id: ${param["id"]}<br/>

pwd: ${param.pwd}<br/>
pwd: ${param["pwd"]}<br/>
<!-- ���ȣ ����� �Ӽ� �̸��� 
Ư�����ڰ� ���� ��쿡 �ַ� ��� -->
</body>
</html>