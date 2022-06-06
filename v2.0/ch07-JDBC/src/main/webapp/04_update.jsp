<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.jdbc.connectionPool.*" %>
<%@ page import="me.java.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sally's Page</title>
<script src="./js/js04.js" defer></script>
</head>
<body>
<% 
	String id = (String)session.getAttribute("idKey");
	RegisterBean bean = new RegisterDBCP().selectOne("register", id);
	String pwd = bean.getPwd();
	System.out.println(bean);

%>
<jsp:include page="header.jsp"/> 
<h2>MODIFY</h2>
    <form name="update" method="post" action="./UpdateServlet" 
    	onsubmit="return isValidUpdateForm('update', '<%=pwd%>')">
        
        <label for="id">ID: </label><input type="text" id="id" name="id" value="<%=id%>" disabled><br />
        <label for="curpwd">CURRENT PASSWORD: </label><input type="password" id="curpwd" name="curpwd"><br />
        <label for="newpwd">NEW PASSWORD: </label><input type="password" id="newpwd" name="newpwd"><br />
        <label for="newrepwd">REWRITE NEW PASSWORD: </label><input type="password" id="newrepwd" name="newrepwd"><br />
        <label for="name">NAME: </label><input type="text" id="name" name="name"><br />
        <label for="email">EMAIL: </label><input type="email" id="email" name="email"><br />
        <label for="phone">PHONE: </label><input type="tel" id="phone" name="phone"><br />

        
        <input type="submit" value="Modify">
        <input type="reset" value="Reset">
    </form>
    <jsp:include page="footer.jsp"/> 
</body>
</html>