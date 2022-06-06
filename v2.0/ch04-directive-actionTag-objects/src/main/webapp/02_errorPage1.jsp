<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="false" errorPage="03_errorPage2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 해당 페이지에서 직접 error handling 하지 않고 에러 발생할 경우, 
		3번 페이지로 넘김 
		
		정확하게, url이 3번 페이지로 넘어가는 게 아니라 2번 페이지에 머물러 있음
		(errorPage에는 request 객체가 필요가 없기 때문에 request 유지시켜주기 위해)
		
		client --> 02_errorPage1 --- forward ---> 03_errorPage2
		url: localhost:8000/ch04/02_errorPage.jsp
	--%>
	<% 
		int one = 1;
		int zero = 0;
	%>
	<%= one/zero %>
</body>
</html>