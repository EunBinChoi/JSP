<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="regMgr" 
class="ex01.RegisterMgrPool"/>
<!-- loginRegister(id, pwd)
	: ���̺� ���̵�, �н����尡 �����ϴ��� üũ
	: true/false ��ȯ
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = "";
	String pwd = "";
	
	if(request.getParameter("id") != null){
		id = request.getParameter("id");
	}
	if(request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}
	if(regMgr.loginRegister(id, pwd)){
		session.setAttribute("idKey", id);
%>
	<script>
		alert("�α��� ����!");
		location.href = "13_sessionLoginOk.jsp";
	</script>
	
	<%
	}else{ %>
	<script>
		alert("�α��� ����!");
		location.href = "11_sessionLogin.jsp";
	</script>
	<% } %>
	
	
</body>
</html>