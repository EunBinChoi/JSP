<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sally's Page</title>
<script src="./js/js05.js" defer></script>
</head>
<body>
<%
	Enumeration<String> attributeNames = session.getAttributeNames();
	while(attributeNames.hasMoreElements()) {
		String key = attributeNames.nextElement().toString();
		String value = session.getAttribute(key).toString();
		out.println(key + " : " + value + "<br/>");
		
		if(key.equals("signupTries")) {
			if(value != null) {
				if(value.equals("duplicate")) {
					out.println("<script>alert('ID IS ALREADY USED')</script>");
				}
				else {
					session.removeAttribute("signupTries");
				}
			}
		}
	}

%>
<jsp:include page="header.jsp"/> 
<h2>SIGN UP</h2>
    <form name="signup" method="post" action="./SignupServlet" onsubmit="return isSignUpValidForm('signup')">
        
        <label for="id">ID: </label><input type="text" id="id" name="id"><br />
        <label for="pwd">PASSWORD: </label><input type="password" id="pwd" name="pwd"><br />
        <label for="repwd">REWRITE PASSWORD: </label><input type="password" id="repwd" name="repwd"><br />
        <label for="name">NAME: </label><input type="text" id="name" name="name"><br />
        <label for="email">EMAIL: </label><input type="email" id="email" name="email"><br />
        <label for="phone">PHONE: </label><input type="tel" id="phone" name="phone"><br />

        
        <input type="submit" value="Signup">
        <input type="reset" value="Reset">
    </form>
    <jsp:include page="footer.jsp"/> 
</body>
</html>