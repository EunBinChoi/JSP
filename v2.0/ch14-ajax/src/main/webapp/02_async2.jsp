<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>02_async2.jsp page</h1>
	<hr/>
	<script>
		/*
			XMLHttpRequest 객체를 통해 비동기적 처리
			(**) 비동기처리: 전체 페이지를 로드하지 않고 일부 단위를 받아 페이지를 동적으로 변경
		
		*/
		const xhr = new XMLHttpRequest();
		
		/*
			readyState: 데이터 전송 결과
			- 0: 객체 생성, open 안함
			- 1: open()함, send() 안함
			- 2: send()함, 데이터 받지 않음
			- 3: send()함, 데이터의 일부 받음
			- 4: 성공
			
			status: 오류 관련
			- 200: 정상 (오류 없음)
			- 4xx: 클라이언트 측 오류
			- 5xx: 서버 측 오류
		
		*/
		xhr.open("GET", 'data/includeJSP.jsp', true);	
		xhr.onreadystatechange = () => {
			// onreadystatechange 이벤트 발생할 때 실행할 콜백 함수 등록
			if(xhr.readyState == 4 && xhr.status == 200) {
				// document.body.innerHTML: <h1> ~ <script> ~ <h1>
				// document.body.innerHTML += xhr.responseText;
				document.getElementById("includeJSP").innerHTML += xhr.responseText;
			}
		}
		xhr.send();
	</script>
	<div id="includeJSP"></div>
	<hr/>
	<h1>02_async2.jsp page</h1>
</body>
</html>