<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id 
	= (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div align="center"><br/><br/>
		<%if (id != null) {%>
		<b><%=id%></b>�� ȯ�� �մϴ�.
			<a href="03_logout.jsp">�α׾ƿ�</a>
			<%} else {%>
		<form name="loginFrm" method="post" action="02_loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>�α���</h4></td>
				</tr>
				<tr>
					<td>�� �� ��</td>
					<td><input name="id"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="�α���" onclick="loginCheck()">&nbsp;
							<input type="button" value="ȸ������" onClick="javascript:location.href='04_member.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%}%>
	</div>
</body>
</html>