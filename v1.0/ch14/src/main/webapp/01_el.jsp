<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isELIgnored="true" %>
<%-- EL ������ ���õǾ �ؽ�Ʈ�� ó�� --%>
<%
	request.setAttribute("msg", "This is EL");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL Test</title>
</head>
<body>
${msg}
</body>
</html>