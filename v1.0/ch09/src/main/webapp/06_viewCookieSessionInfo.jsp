<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Enumeration en = session.getAttributeNames();
	// Collection �����ӿ�ũ�� ��������� ���� ������� �������̽�
	
	while(en.hasMoreElements()){ // ������ �ݺ��� ��� Ȯ��
		String name = (String)en.nextElement();
		// ��� �ϳ��� ���� (idKey, pwdKey)
		
		String value = (String)session.getAttribute(name);
		// �־��� �̸��� ���� ���ǿ� �Ҵ�� �� ����
		// (admin, 1234)
		
		String id = session.getId();
		
		out.println(name + "<br/>");
		out.println(value + "<br/>");
		out.println(id + "<br/>");
	}
%>
////////////////////////////////////////<br/>
<%
	Cookie[] cookies = request.getCookies();
	// Ŭ���̾�Ʈ ���������� ��� ��Ű ��ȯ
	
	if(cookies != null){
		for(int i = 0; i < cookies.length; i ++){
			//if(cookies[i].getName().equals("myCookie")){
			out.println(cookies[i].getName() + "<br/>");
			// JSESSIONID
			// ���� ������ �� �ֵ��� �߱��ϴ� Ű
			
			out.println(cookies[i].getValue() + "<br/>");
			// ���� ���̵�� ����
			
			// => ���� ���� ������ ���ؼ�
			// ��Ĺ���� JSESSIONID ��Ű�� Ŭ���̾�Ʈ �߱����ְ�
			// �� ���� ���� ���� ����
			// => ���� ����� Ŭ���̾�Ʈ���� �� �� ����
			
			//}
		}
	}
%>
</body>
</html>