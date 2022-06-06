<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		JSP 문법
		1) 선언문 <%-- <%! %> -->: 전역 변수, 함수 (class 바로 밑에 정의)
		2) 스크립트릿 <%-- <% %> --%>: 지역 변수 (_jspService() 함수 내에 정의)
		3) 표현식 <%-- <%= %> --%>: 변수 사용, 함수 호출
		4) 주석 <%--  --%>
	-->
	
	<!-- 스크립트릿 -->
	<% 
		// 지역 변수
		String str1 = "hello"; // 지역 변수 (무조건 초기화 해줘야 함)
		str2 = str2 + " " + str1; 
		// str2는 전역 변수이기 때문에 선언보다 사용을 먼저 해도 오류 X
		
		// 지역 함수 (자바는 함수 안에 함수를 정의할 수 없음)
		// public String print1() {return "scriptlet";}
	%>
	
	<!-- 선언문 -->
	<%! 
		// 전역 변수
		String str2 = "world"; // 전역 변수 (초기화하지 않아도 0, false, null 초기화)
		
		// 전역 함수
		public String print2() {return "declaration";}
	%>
	
	<!-- 표현식 (; 생략 가능) -->	
	<%= str1 %>
	<br/>
	<%= str2 %>
	<br/>
	<%= print2() %>
	
</body>
</html>