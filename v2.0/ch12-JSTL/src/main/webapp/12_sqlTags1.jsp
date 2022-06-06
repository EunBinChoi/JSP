<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!--  SQL 태그 사용하기 위해  반드시 필요한 자원의 url과 prefix을 taglib에 지정 -->

<sql:setDataSource
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" 
	user="scott" password="tiger" 
	var="db"
	scope="application" 
/>
<!--  연결할 DB 서버의 url, driver, user, password 정보를 application 저장소에 db 변수명으로 저장 --> 

<!--  연결 정보는 application 저장소에 db 변수명으로 저장
가장 범위가 큰 application (웹 어플리케이션이 실행되는 동안 유지)에 저장했기 때문에 
다른 jsp 파일에서는 db 연결 설정 없어도 사용 가능 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<h2>SQL Tags1</h2>
	   <!-- 태그 안에 있는 쿼리문 실행하고 결과 lists 변수에 저장 -->
	   <sql:query var="lists" dataSource="${db}">
        select id, pass from member
       </sql:query>

	<!-- lists의 행 개수만큼 반복하면서 레코드 정보 출력 -->
    <c:forEach var="member" items="${lists.rows}">
        ${member}<br/>
    </c:forEach>
</body>
</html>