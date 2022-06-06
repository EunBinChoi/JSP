<%@ page 
	info="Copyright by Sally"
	language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// page: 해당 페이지에 대한 정보 저장하는 객체 (this 키워드 이용)
		String pageInfo = this.getServletInfo();
		out.println(pageInfo);
	%>
</body>
</html>