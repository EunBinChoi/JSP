<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="any" 
class="ex01.SimpleBean"/>
<jsp:setProperty name="any"
property="info" value="Java Beans"/>
<!-- setInfo("Java Beans") ȣ�� -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty name="any" property="info"/>
<!-- getInfo() ȣ�� -->
</body>
</html>