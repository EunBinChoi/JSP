<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = "Sally";
	%>
	<!-- 액션 태그는 나홀로 태그 -->
	<jsp:include page="09_includeActionTagHeader.jsp"/> 
	<%--<%@ include file="09_includeActionTagHeader.jsp" %>--%>
	
	<%-- 
		include action tag (include하려고 하는 파일이 .jsp)
		: 브라우저에 출력할 결과 데이터만 가지고 오기 때문에 변수 이름 중복되어도 상관 X
		: 7 --- (name, adminEmail) ---> 8 
				
				--- (name, adminEmail) --> 9 --> Servlet --> 실행 결과
				--- (name, adminEmail) --> 10 --> Servlet --> 실행 결과
						
		
		include directive (include하려고 하는 파일이 .html)
		: 코드 자체를 다 가지고 오기 때문에 변수 이름 중복되면 오류 발생 (Duplicate Variable)
	 	: 7 --- (name, adminEmail) ---> 8 
				
				--- (name, adminEmail) --> 9 
				--- (name, adminEmail) --> 10 
	 --%>
	
	<hr/>
	<h2>Body</h2>
	<hr/>
	<jsp:include page="10_includeActionTagFooter.jsp"/>
</body>
</html>