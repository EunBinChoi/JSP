<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, java.util.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	
	Connection conn = null; // DB ���� ��ü
	Statement stmt = null; // sql�� �ۼ� ��ü
	ResultSet rs = null; // sql�� ���� ��� ��� ��ü
	
	String id, pwd, name, num1, num2, email, phone;
	int count = 0; // ���̺� ����� ���ڵ� (��) ���� ����
	
	try{
		Class.forName(driver); // JDBC ����̹� ��ü ����
		conn 
		= DriverManager.getConnection(url, user, password);
		// JDBC ����̹��� ���� DB ���� 
		
		stmt = conn.createStatement();
		// sql�� �ۼ� ��ü ����
		
		rs = stmt.executeQuery("select * from REGISTER");
		// ���ǹ� ����
		
		//out.println(rs);
		if(rs != null){
			
			//out.println(rs.next());
			while(rs.next()){ // ���� ���ڵ� ���� ��ȯ (true/false)
				//out.println("sss");
				
				id = rs.getString("id"); 
				// �÷��̸� ���� ������ ��ȯ
				pwd = rs.getString("pwd");
				name = rs.getString("name");
				num1 = rs.getString("num1");
				num2 = rs.getString("num2");
				email = rs.getString("email");
				phone = rs.getString("phone");
				
				out.println(id + "<br/>");
				out.println(pwd + "<br/>");
				out.println(name + "<br/>");
				out.println(num1 + "<br/>");
				out.println(num2 + "<br/>");
				out.println(email + "<br/>");
				out.println(phone + "<br/>");
				
				count ++;
			}
			out.println("���ڵ� �� : " + count + "<br/>");
		}
	}
	catch(ClassNotFoundException e){
		System.out.println("class not found");
	}
	catch(SQLException e){
		System.out.println("sql exception");
	}
	catch(Exception e){
		System.out.println("exception");
	}
	finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	

%>
</body>
</html>