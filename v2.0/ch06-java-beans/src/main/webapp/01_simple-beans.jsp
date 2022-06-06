<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 클래스의 객체 생성 (빈 생성자 호출) -->
<jsp:useBean id="simple" class="me.java.beans.SimpleBeans"/>

<!-- 객체의 필드 set (setId(), setPwd() -->
<jsp:setProperty name="simple" property="id" value="a"/>
<jsp:setProperty name="simple" property="pwd" value="a1234"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:getProperty name="simple" property="id" /> <br/>
<jsp:getProperty name="simple" property="pwd" /> <br/>
</body>
</html>