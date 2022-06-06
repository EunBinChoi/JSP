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
		// application: 서블릿에 정보 저장 객체
		String serverInfo = application.getServerInfo();
		String mimeType = application.getMimeType("18_session1.html");
		// .jsp 파일은 mime type이 null
		// mime type: client한테 보여지는 문서의 종류 확인 
		// (.jsp는 client한테 보여지는 문서 종류 X)
		String realPath = application.getRealPath("/");
		
		application.log("log-2022-02-08");
		// eclipse에서는 tomcat log가 기본적으로 출력 X
		// application.log() 함수를 이용하면 tomcat log 출력
		// 서버 실행 위치/logs
		
		out.println(serverInfo + "<br/>");
		out.println(mimeType + "<br/>");
		out.println(realPath + "<br/>");
	%>
</body>
</html>