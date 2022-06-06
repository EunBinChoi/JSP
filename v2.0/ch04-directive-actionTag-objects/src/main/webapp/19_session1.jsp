<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		session.setAttribute("idKey", id);
		// 사용자가 입력한 id를 value로 가지고 있는 session 객체 연결 설정
		
		session.setMaxInactiveInterval(5); // 5분
		// session 객체의 연결 시간 지정 (5분, 기본값 : 30분)
		// 5분 경과 후에 자동 연결 종료
		
	%>
	
	<!-- 무조건 로그인해야만 설문조사를 할 수 있음! -->
	<!-- 아직 DB랑 연동하지 않기 때문에 19.jsp 페이지는 로그인 성공 이후 페이지! -->
	<h1>Survey</h1>
	<form method="post" action="20_session1-1.jsp">
    1.Your Favorite Season ?<br/>
	<input type="radio" name="season" value="spring">spring
	<input type="radio" name="season" value="summer">summer
	<input type="radio" name="season" value="autumn">autumn
	<input type="radio" name="season" value="winter">winter<p/>

	2.Your Favorite Fruit ?<br/>
	<input type="radio" name="fruit" value="watermelon">watermelon
	<input type="radio" name="fruit" value="melon">melon
	<input type="radio" name="fruit" value="apple">apple
	<input type="radio" name="fruit" value="orange">orange<p/>
	<input type="submit" value="result">
	</form>

</body>
</html>