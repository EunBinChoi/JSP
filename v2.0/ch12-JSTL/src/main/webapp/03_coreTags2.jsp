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
<h2>Core Tags2</h2>

<!-- if문 태그를 이용해서 요청된 id 값이 null인치 체크 -->

<!-- request.getParameter("id") -->
<c:if test="${!empty param[\"id\"] and param[\"id\"] != ''}">
	${param.id}
</c:if>
<c:if test="${param.id == ''}">
	Guest
</c:if>

<!-- request.getAttribute("id") -->
<c:if test="${!empty requestScope.id and requestScope.id != ''}">
	${requestScope.id}
</c:if>
<c:if test="${requestScope.id == ''}">
	Guest
</c:if>

<%
	// jsp
	if(request.getParameter("id") != null && !(request.getParameter("id").equals(""))) {
		out.println(request.getParameter("id"));
	}
	else {
		out.println("Guest");
	}

%>

<!-- 다중선택을 체크하기 위한 choose 태그 -->
<c:choose>
	<c:when test="${param.color=='yellow'}">
		<c:set var="c" value="노란색"/>
	</c:when>
	<c:when test="${param.color=='blue'}">
		<c:set var="c" value="파란색"/>
	</c:when>
	<c:when test="${param.color=='orange'}">
		<c:set var="c" value="오렌지색"/>
	</c:when>
	<c:when test="${param.color=='pink'}">
		<c:set var="c" value="핑크색"/>
	</c:when>
	<c:otherwise>
		<c:set var="c" value="블랙"/>
	</c:otherwise>
</c:choose>
님이 좋아하는 색상은 <font color="${param.color}">${c}</font> 입니다.
</body>
</html>