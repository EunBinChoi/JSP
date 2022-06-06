<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	  String[] str1 = {"sally","philps","tina","poli"};
	  String   str2 = "JAVA, JSP; Spring, Python";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Core Tags3</h2>
<c:set var="arr" value="<%=str1%>"/>
<c:forEach var="element" items="${arr}" begin="0" step="1" end="<%=str1.length%>">
	${element}<br/>
</c:forEach>

<hr align="left" width="220"/>
<c:set var="s" value="<%=str2%>"/>
<c:forTokens var="st" items="${s}" delims=", ;"> 
	<b>${st}&nbsp;</b>
</c:forTokens>
</body>
</html>