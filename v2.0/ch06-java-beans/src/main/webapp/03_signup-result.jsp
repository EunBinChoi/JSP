<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.java.beans.MemberBeans" %>
    

<%-- <jsp:useBean id="member" class="me.java.beans.MemberBeans"/> --%>
<%-- <jsp:setProperty name="member" property="*"/> --%>
<!-- 
	setter의 value를 적지 않아도 
	input 태그의 name 값을 확인해서 setXXX (setName(), setId(), setPassword()...)
	
	만약 input 태그의 name 값과 자바빈즈 클래스의 setXXX의 이름이 다르면 호출 불가능!
	ex) input name="mail" != setEmail() 호출 불가
 -->

<%
	MemberBeans member = (MemberBeans)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- getProperty property="*" (X) -->
	<%-- 
	name: <jsp:getProperty name="member" property="name"/><br/>
	id: <jsp:getProperty name="member" property="id"/><br/>
	pwd: <jsp:getProperty name="member" property="password"/><br/>
	email: <jsp:getProperty name="member" property="email"/><br/>
	loc: <jsp:getProperty name="member" property="location"/><br/>
	--%>
	
	name: <%= member.getName() %><br/>
	id: <%= member.getId() %><br/>
	pwd: <%= member.getPassword() %><br/>
	email: <%= member.getEmail() %><br/>
	loc: <%= member.getLocation() %><br/>
</body>
</html>