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
		/*
			=============================================
			05_login.jsp -> 06_index.jsp
			무조건 로그인해야만 index.jsp 볼 수 있는 페이지
			=============================================
			
			예외 처리
			1) ID/PWD가 틀리고 다시 05_login.jsp --> alert
			2) LOGOUT 했을 때 다시 05_login.jsp --> alert
			3) 직접 사용자가 URL을 변경해서 LOGIN 되지 않은 상태로 06_index.jsp로 들어가려고 할 때 접근 X
			4) 직접 사용자가 URL을 변경해서 LOGIN 된 상태에서 05_login.jsp로 들어가려고 할 때 접근 X

			loginTries -> member, non-member, logout
		*/
		
		Enumeration<String> attributeNames = session.getAttributeNames(); // attribute names 값만 모여있음
		//out.println(attributeNames.toString());
		while(attributeNames.hasMoreElements()) {
			String key = attributeNames.nextElement().toString();
			String value = session.getAttribute(key).toString();
			out.println(key + ":" + value);
			
			if(key.equals("loginTries")) {
				if(value != null) {
					if(value.equals("member")) {
						response.sendRedirect("./06_index.jsp"); // 4)
					}
					else if(value.equals("non-member")) {
						out.println("<script>alert('ID/PW INCORRECT!')</script>"); // 1)
					}
					else if(value.equals("logout")) {
						out.println("<script>alert('LOGOUT!')</script>"); // 2)

						// 더이상 접속했던 사용자의 데이터를 저장할 필요가 없기 때문에 모든 attribute 삭제
						session.removeAttribute("loginTries");	
						session.removeAttribute("idKey");
						// session.invalidate()
					}
				}
			}
		}
	%>
	<h1>Login</h1>
	<form method="post" action="./LoginServlet">
	id : <input type="text" name="id"><br/>
	pwd : <input type="password" name="pwd"><br/>
	<input type="submit" value="login">
	</form>
</body>
</html>