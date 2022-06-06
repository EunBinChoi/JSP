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
		request.setCharacterEncoding("UTF-8"); 
		// 한국어 깨짐을 해결하기 위함
		String season = request.getParameter("season");
		String fruit = request.getParameter("fruit");
		String id = (String)session.getAttribute("idKey"); 
		// 클라이언트가 입력한 id, null (max activate 시간이 지나면)
		String sessionId = session.getId();
		out.println("session id : " + sessionId + "<br/>");
		
		if(id != null) { // session이 유효함
			out.println("<h2>Survey Result</h2>");
			out.println("id : " + id + "<br/>");
			out.println("season : " + season + "<br/>");
			out.println("fruit : " + fruit + "<br/>");
		}
		else { // session 연결 시간이 지남
			out.println("<h2>Session is not valid.</h2>");
			// session.setMaxInactiveInterval(5)
			// session.getAttribute("idKey") ==> null
			session.invalidate();
			// session 객체에 저장된 모든 key 값을 해제
		}
	%>
</body>
</html>