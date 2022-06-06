<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		정적 페이지: 정적 콘텐츠 담고 있는 페이지 (자기소개, 회사소개 ...)
		동적 페이지: 동적 콘텐츠 담고 있는 페이지 
		(DB 연동, 시간에 따라 바뀌는 부분 등 대부분의 페이지)
		
		client request (www.naver.com/index.html)
		server response process
		Web Server (Apache) > WAS (Web Application Server) (Apache Tomcat) > DB 연동
		
		JSP (Java Server Page)
		: HTML 코드 안에 JAVA 코드가 들어가 있는 형태 (페이지 표현 용이)
		: front-end / designer vs back-end 분업화 향상
		
		Servlet
		: JAVA 코드 안에 HTML 코드가 들어가 있는 형태 (내부 처리 용이)
		: front-end / designer vs back-end 분업화 힘듦
	 -->
	 
	 
	<h2>Static Part! 2022-02-07</h2>
	
	<%-- JSP 주석 --%>
	<!-- html 주석 -->
	
	<!-- 스크립트릿 (자바 코드 (해석해야하는 부분, 브라우저에 출력 X)) -->
	<% 
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = sdf.format(date);
	%>	

	<!-- 표현식 (자바 코드의 해석 결과 브라우저에 출력되는 부분) -->
	<h2>Dynamic Part! <%= dateStr %></h2>	
	
	<%-- <%= dateStr1 %> --%> 
	<!-- 오류 발생 X 
		// dateStr1
	-->
	
	<!-- <%= dateStr1 %> -->
	<!-- 오류 발생 O 
		dataStr1 
	-->
	
	<!-- 
		Client ↔ Web Server ↔ WAS ↔ 적절한 결과 반환 (동적인 부분 제외, 정적으로 변환) 
		Client가 볼 때에는 정적 부분 / 동적 부분 결과 동일하게 보임 (**)
		
		01_overview.jsp (JSP) -> 01_overview.java (Servlet) -> 01_overview.class (byte code) -> compile -> run
	 -->
</body>
</html>