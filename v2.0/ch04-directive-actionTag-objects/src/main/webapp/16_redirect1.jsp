<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// 서버 단에서 쿠키를 만들어서 클라이언트에 저장 (서버 -- response --> 클라이언트)
		response.addCookie(new Cookie("id", id));
		response.addCookie(new Cookie("pwd", pwd));
		response.sendRedirect("17_redirect1-1.jsp");
	%>
</body>
</html>