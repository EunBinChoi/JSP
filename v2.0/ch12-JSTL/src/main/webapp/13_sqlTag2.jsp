<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>SQL Tags2</h2>

<!-- 12_sqlTag1.jsp에서 연결한 db 정보 재활용 (application 저장소) -->
<sql:update dataSource="${db}"> 
	update member set pass=? where id=?
	<sql:param value="${'123456'}"/> 
	<sql:param value="${'admin'}"/>
</sql:update>
업데이트를 하였습니다.<br/>
<a href="12_sqlTags1.jsp">SELECT</a>
</body>
</html>