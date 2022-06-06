<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	id: ${param.id} <br/>
	pwd: ${param.pwd} <br/>
	<br/>
	id: ${param["id"]} <br/>
	pwd: ${param["pwd"]} <br/>
	<br/>
	${paramValues.hobby[0]}
	${paramValues.hobby[1]}
	${paramValues.hobby[2]}
	${paramValues.hobby[3]}
	${paramValues.hobby[4]}
	${paramValues["hobby"][0]}
	${paramValues["hobby"][1]}
	${paramValues["hobby"][2]}
	${paramValues["hobby"][3]}
	${paramValues["hobby"][4]}
	
	<!-- for문으로 바꿔보기 -->
	<%

		String[] paramValues = request.getParameterValues("hobby");
		
		for(int i = 0; i < paramValues.length; i++) {
			out.println(paramValues[i]);
		}
		
		String length = request.getParameter("params");
		
	
	%>
</body>
</html>