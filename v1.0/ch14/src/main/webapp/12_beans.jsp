<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="bean" class="ex01.ELBean"/>
<jsp:setProperty name="bean" property="*"/>
<%-- setSiteName(request.getAttribute("siteName")) ȣ�� --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
JSP�� action tag�� �̿�
<jsp:getProperty name="bean" 
property="siteName"/><br/>
///////////////////////// <br/><br/>

EL ���� �̿� 
${bean.siteName} <br/>
${bean.siteName} <br/>
<!-- useBean �׼� �±׸� ���ؼ� ��ü ����
=> pageContext ����ҿ� �����
=> EL ȣ���� �� pageContext ���� ����
 -->
</body>
</html>