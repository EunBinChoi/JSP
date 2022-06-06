<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page isELIgnored="true" %> --%>
<!-- EL 문법이 무시되고 텍스트로 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// EL 객체
		pageContext.setAttribute("msg1", "hello1");
		request.setAttribute("msg2", "hello2");
		session.setAttribute("msg3", "hello3");
		application.setAttribute("msg4", "hello4");
	%>
	<!-- jsp 표현식 (값이 없을 때는 null 출력) -->
	<%= pageContext.getAttribute("msg1") %> <br/>
	<%= request.getAttribute("msg2") %> <br/>
	<%= session.getAttribute("msg3") %> <br/>
	<%= application.getAttribute("msg4") %> <br/>
	<%= application.getAttribute("msg") %> <br/>
	<br/><br/>
	<!-- 
		EL 표현식 (값이 없을 때는 "" 출력) 
		\ (escape 문자) 하면 해당 EL 표현식을 그냥 텍스트로 출력
	-->
	\${pageScope.msg1} <br/>
	\${requestScope.msg2} <br/>
	\${sessionScope.msg3} <br/>
	\${applicationScope.msg4} <br/>
	\${applicationScope.msg} <br/>
</body>
</html>