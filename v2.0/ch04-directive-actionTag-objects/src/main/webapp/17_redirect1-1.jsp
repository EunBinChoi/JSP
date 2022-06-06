<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		// 지역변수 초기화를 하지 않고 사용하면 오류
		String id = null; 
		String pwd = null;
		
		// 클라이언트에게 저장된 쿠키 사용 (request.)
		Cookie[] cookies = request.getCookies(); 
		for(int i = 0; i < cookies.length; i ++) { 
			if(cookies[i].getName().equals("id")) {
				id = cookies[i].getValue();
			}
			if(cookies[i].getName().equals("pwd")) {
				pwd = cookies[i].getValue();
			}
		}
		
		// redirect하면 16번의 request != 17번의 request
		// String id = request.getParameter("id"); // null 
		// String pwd = request.getParameter("pwd"); // null
	%>
	<%= id %> 
	<%= pwd %> 
</body>
</html>