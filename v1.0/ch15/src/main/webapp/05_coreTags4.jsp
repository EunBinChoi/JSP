<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ���� ó�� ��� (var �Ӽ��� ���� ��ü ���� => ���� �޽��� ���) -->
<c:catch var="ex">
<%
	int arr[] = {1, 2, 3};
	int element = arr[3];
%>
</c:catch>
${ex}
<!-- ���� ���� ��� (�߻����� ������ ��� ����) -->
</body>
</html>