<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String str1[] = {"sally", "philps", "poli"};
	String str2 = "sally, philps; poli";
	// ��ũ��Ʈ�� ���� ���� => Core tag ���
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="arr" value="<%=str1%>" scope="page"/>
<c:forEach var="element" items="${arr}" 
begin="0" step="1" end="2">
	${element} <br/>
</c:forEach>

<hr/>
<!-- "sally, philps; poli" -->
<c:set var="str" value="<%=str2%>" scope="page"/>
<c:forTokens var="sttoken" items="${str}" delims=", ;">
	${sttoken} <br/>
</c:forTokens>


<hr/>
<!-- include action tag�� ���� ��� ���� -->
<c:import 
url="http://localhost:8000/ch15/03_coreTags2.jsp">
	<c:param name="id" value="admin"/>
	<c:param name="color" value="orange"/>
</c:import>

<hr/>
<c:url var="url" value="https://www.google.com/search">
	<c:param name="q" value="JSP"></c:param>
</c:url>
<a href="${url}">���ۿ��� JSP �˻�</a>

<hr/>
<c:redirect url="http://www.oracle.com"/>
<!-- response.sendRedirect()
���� �������� ���ð� �ǰ� ������ ��ȯ
(forward action tag (+ ����� request ���� O)
(redirect tag (+ ����� request ���� X) -->

</body>
</html>