<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL�� Empty</h2>
name�� ��û ���� : <b>${empty param.name}</b><br/>
<!-- empty �����ڸ� ���� ��û�� name �Ӽ� �� ���� �Ǵ� 
param.name�� null�� ��� true ��ȯ
param.name�� null�� �ƴ� ��� (~~~?name=sally) false ��ȯ -->
<a href="09_empty.jsp?name=sally">name���� �ִ� ��û</a> || 
<a href="09_empty.jsp">name���� ���� ��û</a>
</body>
</html>