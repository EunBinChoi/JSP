<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	
		Enumeration<String> attributeNames = session.getAttributeNames();
		//out.println(attributeNames.toString());
		boolean isIdKey = false;
		boolean isLoginTries = false;
		while(attributeNames.hasMoreElements()) {
			String key = attributeNames.nextElement().toString();
			String value = session.getAttribute(key).toString();
			out.println(key + ":" + value);
			
			if(key.equals("idKey")) { isIdKey = true; }
			if(key.equals("loginTries")) { isLoginTries = true; }
		}
		
		// session 객체에 idKey, loginTries 속성이 없음 (로그인을 하지 않음)
		if(!isIdKey && !isLoginTries) {
			response.sendRedirect("./05_login.jsp"); // 3)
		}
	%>
	<h2>Main Page</h2>
	<a href="./LogoutServlet">logout</a>
</body>
</html>