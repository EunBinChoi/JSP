<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ex02.*, java.util.*"%>

<jsp:useBean id="regList" class="ex02.RegisterMgr" />
<!-- Bean ���� -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	Vector<RegisterBean> list = regList.getRegisterList();
	// DB ���� ��� ArrayList�� ���� (RegisterMgr Ŭ����)

	for (int i = 0; i < list.size(); i++) {
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