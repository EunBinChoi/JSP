<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Formatting Tags4</h2>

<!-- 파일명.properties 이런 형식으로 프로퍼티 파일을 키=값 형태로 출력
{0}와 같이 동적인 값이 필요할 때 0번째 위치 변수 선언하는 방식 -->

<!-- 프로퍼티 파일 지정 -->
<fmt:setBundle var="note" basename="me.jstl.properties.note"/>
<fmt:message bundle="${note}" key="id"/>&nbsp;
<fmt:message bundle="${note}" key="pwd"/>&nbsp;

<!-- 
https://leeyongjin.tistory.com/entry/%EC%9D%B4%ED%81%B4%EB%A6%BD%EC%8A%A4-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8-properties-editor-%EC%88%98%EB%8F%99%EC%84%A4%EC%B9%98
https://blog.daum.net/oneprimary/7
https://gakari.tistory.com/entry/JSPServlet-%E2%80%93-JSTL-fmtsetBundle%EA%B3%BC-fmtbundle-fmtmessage-%EC%BB%A4%EC%8A%A4%ED%85%80-%EC%95%A1%EC%85%98-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0 -->
<!-- 지정된 프로퍼티 파일의 msg값에 요청받은 값을 {0} 위치에 채움 -->
<fmt:message bundle="${note}" key="msg">
	<fmt:param value="${param.msg}"/>
</fmt:message>
<br/><br/>
<a href="./11_fmtTags4.jsp">param 없는 요청</a><br/>
<a href="./11_fmtTags4.jsp?msg=하이">param 있는 요청</a><br/>
</body>
</html>