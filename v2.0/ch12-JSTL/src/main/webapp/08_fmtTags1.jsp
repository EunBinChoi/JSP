<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 포매팅 태그를 사용하기 위해서 반드시 필요한 자원의 url과 prefix를 taglib에 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Formatting Tags1</h2>

<!-- ko 국가코드, kr 언어코드 (국제 표준화 기구 (iso에서 정함)) -->
<fmt:setLocale value="ko_kr"/>
<fmt:requestEncoding value="UTF-8"/>
name : <%=request.getParameter("name")%><br/>
<form  method="post">
	name : <input name="name">
	<input type="submit">
</form>
</body>
</html>