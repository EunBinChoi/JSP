<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Core Tags5</h2>
<!-- response.sendRedirect() 메소드와 같은 기능
forward 액션태그처럼 요청 정보는 가져가지 않고 단순히 페이지 전환 -->
<c:redirect url="http://www.oracle.com"/>
</body>
</html>