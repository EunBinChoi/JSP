<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sally's Page</title>
</head>
<body>
	<jsp:include page="header.jsp"/> 
	<% 	
		Enumeration<String> attributeNames = session.getAttributeNames();
		//out.println(attributeNames.toString());
		boolean isIdKey = false;
		boolean isLoginTries = false;
		while(attributeNames.hasMoreElements()) {
			String key = attributeNames.nextElement().toString();
			String value = session.getAttribute(key).toString();
			out.println(key + " : " + value + "<br/>");
			
			if(key.equals("idKey")) { isIdKey = true; }
			if(key.equals("loginTries")) { isLoginTries = true; }
		}
		
		// session 객체에 idKey, loginTries 속성이 없음 (로그인을 하지 않음)
		if(!isIdKey && !isLoginTries) {
			session.setAttribute("loginTries", "invalid-access");
			response.sendRedirect("./01_login.jsp"); // 3)
		}
		if(isIdKey && session.getAttribute("idKey") == null) {
			session.setAttribute("loginTries", "invalid-access");
			response.sendRedirect("./01_login.jsp"); // 3)
		}
		if(isLoginTries && session.getAttribute("loginTries") == null) {
			response.sendRedirect("./01_login.jsp"); // 3)
		}
	%>
	
	<h2>Main Page</h2>
	<a href="./04_update.jsp">revise member's info</a><br/>
	<a href="./03_delete.jsp">delete member</a><br/>
	<a href="#" id="logout">logout</a>
	<script>
		const logout = document.getElementById('logout');
		logout.addEventListener("click", () => {
			const answer = confirm("YOU WANT TO LOGOUT?");
			if(answer) {
				logout.href = "./LogoutServlet";
			}
		});
	</script>
	<jsp:include page="footer.jsp"/> 
</body>
</html>