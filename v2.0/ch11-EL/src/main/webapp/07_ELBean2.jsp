<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="me.java.beans.ELBean"/>
<jsp:setProperty name="bean" property="*"/>
<!-- setId(value) -->
<!-- setPwd(value) -->
<!-- setMsg(value) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:getProperty name="bean" property="id"/>
<jsp:getProperty name="bean" property="pwd"/>
<jsp:getProperty name="bean" property="msg"/>


</body>
</html>