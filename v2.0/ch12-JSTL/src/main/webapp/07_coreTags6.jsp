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
<h2>Core Tags6</h2>

<!-- 예외처리 기능, var 속성은 예외 객체를 참조하는 변수 값 -->
<c:catch var="ex">
<%
		int[] arr = {1, 2, 3};
        int sum = arr[0] + arr[1] + arr[2] + arr[3];
%>
</c:catch>
${ex}
<!-- 예외 내용 출력 (발생되지 않으면 예외 없음) -->
</body>
</html>