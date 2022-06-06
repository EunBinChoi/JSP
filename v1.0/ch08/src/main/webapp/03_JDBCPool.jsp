<!-- Connection Pool
	: DB�� ����, ���� ������, ��� ���� ���� ����
	 (���� Tomcat <-> Oracle)
	 
	: DB ���� �ð� ª�� �ؼ� ����� ���� �ӵ� ������ ��
	: DB�� �ᱹ �ټ��� ����� ��û ��� ��ȯ (����)
	
	=> Connection Pool ! 
	DB ������ ������ ��ü �޸𸮿��� �������� ���� ��Ȱ��!
	

 -->


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, ex03.*, ex02.*" %>
<jsp:useBean id="regMgr" class="ex03.RegisterMgrPool"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	Vector<RegisterBean> list 
	= regMgr.getRegisterList();
	
	for(int i = 0; i < list.size(); i++){
		RegisterBean bean = list.get(i);
		
		out.println(bean.getId() + "<br/>");
		out.println(bean.getPwd() + "<br/>");
		out.println(bean.getName() + "<br/>");
		out.println(bean.getNum1() + "<br/>");
		out.println(bean.getNum2() + "<br/>");
		out.println(bean.getEmail() + "<br/>");
		out.println(bean.getPhone() + "<br/>");
	}
	out.println("���ڵ� �� : " + list.size());

%>

</body>
</html>