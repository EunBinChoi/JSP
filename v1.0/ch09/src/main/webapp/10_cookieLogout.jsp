<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	Cookie[] cookies = request.getCookies();

	if(cookies != null){
		for(int i = 0; i < cookies.length; i ++){
			if(cookies[i].getName().equals("idKey")){
				cookies[i].setMaxAge(0);
				// ��Ű�� ���� �ֱ⸦ 0���� ���� (��Ű ����)
				response.addCookie(cookies[i]);
				// ���䰴ü���� ��Ű�� ���Ḧ �˷���
			}
		}
	}
%>
<script>
	alert("�α׾ƿ�!");
	location.href = "07_cookieLogin.jsp"; 
	// �α��� �õ� ������ �̵�
</script>

</body>
</html>