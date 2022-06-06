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
		String id = null;
		String pwd = null;
		String email = null;
		
		// cookie 
		/*
		Cookie[] cookies = request.getCookies();
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				id = cookies[i].getValue();
			}
			if(cookies[i].getName().equals("pwd")) {
				pwd = cookies[i].getValue();
			}
			if(cookies[i].getName().equals("email")) {
				email = cookies[i].getValue();
			}
		}
		*/
		// session
		if(session.getAttribute("id") != null) {
			id = (String)session.getAttribute("id");
		}
		if(session.getAttribute("pwd") != null) {
			pwd = (String)session.getAttribute("pwd");
		}
		if(session.getAttribute("email") != null) {
			email = (String)session.getAttribute("email");
		}
		/*
		// query string
		if(request.getParameter("id") != null) {
			id = request.getParameter("id");
		}
		if(request.getParameter("pwd") != null) {
			pwd = request.getParameter("pwd");
		}
		if(request.getParameter("email") != null) {
			email = request.getParameter("iemaild");
		}
		*/
	%>
	
	<h2>Your Info.</h2>
	<p>id: <b><%=id%></b></p>
	<p>pwd: <b><%=pwd%></b></p>
	<p>email: <b><%=email%></b></p>
</body>
</html>