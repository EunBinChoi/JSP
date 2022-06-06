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

<!-- �� ���ڿ�, null, 0 ==> false -->
<c:if test="${param.id != ''}">
	${param.id}
</c:if>
<c:if test="${param.id == ''}">
	Guest
</c:if>
<hr/>


<c:if test="${not(empty param.id)}">
	${param.id}
</c:if>


<c:if test="${empty param.id}">
	Guest
</c:if>
<hr/>

<c:choose>
	<c:when test="${param.color == 'yellow'}">
	������Դϴ�!
	</c:when>
	<c:when test="${param.color == 'blue'}">
	�Ķ����Դϴ�!
	</c:when>
	<c:when test="${param.color == 'orange'}">
	��Ȳ���Դϴ�!
	</c:when>
	<c:when test="${param.color == 'pink'}">
	��ũ���Դϴ�!
	</c:when>
	<c:otherwise>
	�������� �ʾҽ��ϴ�!
	</c:otherwise>
</c:choose>

</body>
</html>