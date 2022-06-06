<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Formatting Tags3</h2>

<!-- 시간 및 날짜 정보를 가지고 있는 Date 객체 선언 -->
<c:set var="dayTime" value="<%=new Date()%>"/>

<!-- 날짜 정보를 full 스타일로 출력 -->
<fmt:formatDate value="${dayTime}" type="date" dateStyle="full"/><br/>

<!-- 시간 정보를 기본 스타일로 출력 -->
<fmt:formatDate value="${dayTime}" type="time"/><p/>

<!-- 타임존 설정 -->
<fmt:timeZone value="Europe/London">
<!-- 지정된 타임존의 지역 현재 시간 날짜 출력 -->
Europe/London : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" timeStyle="full"/><br/>
</fmt:timeZone>

<fmt:setTimeZone value="America/New_York"/>
America/New_York : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" timeStyle="full"/><br/>
</body>
</html>