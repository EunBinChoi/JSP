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
		String name = null;
		String age = null;
		
		// cookie
		/*
		Cookie[] cookies = request.getCookies();
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("name")) {
				name = cookies[i].getValue();
			}
			if(cookies[i].getName().equals("age")) {
				age = cookies[i].getValue();
			}
		}
		*/
		
		// session
		if(session.getAttribute("name") != null) {
			name = (String)session.getAttribute("name");
		}
		if(session.getAttribute("age") != null) {
			age = (String)session.getAttribute("age");
		}
		
		/*
		// query string
		if(request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		if(request.getParameter("age") != null) {
			age = request.getParameter("age");
		}
		*/
		
	%>
	<h2>Your Info.</h2>
	<p>Hello! <b><%=name%>.</b></p>
	<p>Your age is <b><%=age%>!</b></p>
</body>
</html>