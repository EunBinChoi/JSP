<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 7, 8�� ���������� 9������ �� ��
��Ű ���� ���ᰡ �� �� ���� (�ѹ� �� Ȯ��!) 
	1) 7 -> 9 (���� �α����ߴ� ���, ��Ű�� id ����, �ڵ� �α���)
	2) 7 -> 8 -> 9 (���Ӱ� �α��� �õ�)
-->
	<%
		String id 
		= (String)session.getAttribute("idKey");
	
		// �߰��� ������ ����
		if(id == null){ %>
			<script>
				alert("�α��� ����!");
				location.href = "11_sessionLogin.jsp";
			</script>
		<%  }
	
	%>

	<h2 align="center">Cookie �α���</h2>
	<table width="300" border="1" align="center">
		<tr>
			<td colspan="2" align="center"><b>Log On Page</b></td>
		</tr>
		<tr>
			<td align="center"><b><%=id%></b>���� �α��� �ϼ̽��ϴ�.</td>
			<td align="center"><a href="14_sessionLogout.jsp">�α׾ƿ�</a></td>
		</tr>
	</table>
</body>
</html>