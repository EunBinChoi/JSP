<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	List<String> list = new ArrayList<>();
	list.add("JSP");
	list.add("Servlet");
	
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- EL 문법을 통해 list에 저장된 값 출력 -->
${ pageScope.list[0] }
${ list[0] }
${ pageScope.list[1] }
${ list[1] }
</body>
</html>