<%@ page 
	info="Copyright by Sally"
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		지시자 (Directive)
		: jsp 페이지가 실행될 때 필요한 정보를 jsp 컨테이너 (catalina)에게 알리는 역할
		: 태그 안에 @로 시작
		: page, include ..
		
		1) page <%@page... %>
			- info: 페이지를 설명해주는 역할
			- language: 스크립팅 언어 (기본값: "java")
			- contentType: MIME (Multi-Purpose Internet Mail Extension) 타입 
			    (기본값: "text/html")
				(text/html, text/plain, text/xml ...)
				+ 헤더 포함 (클라이언트한테 응답할 때 보여주는 형식 지정)
			== meta charset (contentType charset > meta charset)
			vs pageEncoding: jsp 페이지에서 사용되는 문자 인코딩 지정
			
			- import: 클래스/패키지 이름
			- session: 세션 유지 여부 (기본값: "true")
			- errorPage: jsp 페이지에서 오류가 발생시 error handling 페이지 지정
			- isErrorPage: 해당 페이지가 error handling 페이지인지 여부 지정 (기본값: "false")
		
		2) include
			- 여러 jsp 페이지에서 공통적으로 포함 내용이 있으면 별도 파일 저장하고 include
			- include file="header.jsp"
			- ==== body ====
			- include file="footer.jsp"
			
			cf.
			[ include directive vs include action tag ]
			include directive: 소스코드 자체 포함
			include action tag: 소스코드 실행 결과만 포함 (정적 텍스트로)
	
	 -->
</body>
</html>