<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Core 태그를 사용하기 위해서는 반드시 필요한 자원의 url과 prefix를 taglib에 선언 --%>
<%
	 String str1 = "str1";	
	 String str2 = null; 
	 // 스크립트릿에서 문자열 str1과 str2 각각 선언	
%>
<html>
<head>
<title>JSTL</title>
</head>
<body>
<h2>Core Tags1</h2>
<br/>

<!-- c:set으로 선언된 변수들은 scope에 따라 저장소에 선언이 되기 때문에 getAttribute() 함수나 EL 문법으로 가지고 와야 함 -->
<c:set var="str3" value="str3" scope="page"/>
<c:set var="str4" value="str4" scope="session"/>

<h3>JSP 표현식으로 값 출력</h3>
<!-- jsp 페이지에 선언된 str1 출력, 만약 해당하는 값이 null이면 default값 출력 -->
str1: <c:out value="<%=str1%>" default="default"/><br/>
str2: <c:out value="<%=str2%>" default="default"/><br/>
<!-- 
	str3, str4는 각각 page scope, session scope 객체에 살고 있는 변수이기 때문에
	local 변수로 출력 불가능함
 -->
<%--str3: <c:out value="<%=str3%>" default="default"/><br/> --%>
<%--str4: <c:out value="<%=str4%>" default="default"/><br/> --%>
<br/>

<h3>EL 표현식으로 값 출력</h3>
str1: <c:out value="${str1}" default="default"/><br/>
str2: <c:out value="${str2}" default="default"/><br/>
str3: <c:out value="${str3}" default="default"/><br/>
str4: <c:out value="${str4}" default="default"/><br/>
<!-- EL문법 이용 -->

<br/>
<h3>session에 저장한 str4를 제거</h3>

<!-- session에 저장한 str4를 제거 -->
<c:remove var="str4"/>

<!-- EL문법으로 출력 (str4는 제거되서 보이지 않음 (빈 문자열 출력)) -->
${str3}의 ${str4} ...<p/>

<!-- String s에 page 저장소에서 str3 가져옴 -->
<% 
	// jsp
	String s3 = (String)pageContext.getAttribute("str3"); 
	String s4 = (String)session.getAttribute("str4"); // null
%>

<!-- el -->
${pageScope.str3}
${sessionScope.str4} <!-- 빈 문자열 출력 -->

<p style="color:red"><b><%=s3%></b></p>
<p style="color:red"><b><%=s4%></b></p>
</body>
</html>