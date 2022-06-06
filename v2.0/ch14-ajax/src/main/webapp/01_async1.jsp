<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>01_async1.jsp page</h1>
	<hr/>
	<script>
		/*
			XMLHttpRequest 객체를 통해 비동기적 처리
			(**) 비동기처리: 전체 페이지를 로드하지 않고 일부 단위를 받아 페이지를 동적으로 변경
		
		*/
		const xhr = new XMLHttpRequest();
		
		/* 
			xhr.open(전송방식 (get, post), 경로, 비동기유무);	
		 	- 경로: url mapping 값 / jsp 경로
		    - 비동기유무: true (비동기, 비순차적인 실행), 
		    			(*) 비순차적인 실행하는 방법
		    			: callback 함수 등록만하고 실제 이벤트가 발생했을 때 callback 실행
		    			
		    		   false (동기, 순차적인 실행)
		*/
		xhr.open("GET", 'data/includeJSP.jsp', false);
		xhr.send(); // async=false니까 응답이 올 때까지 기다림
		
		/* 
		   true: 이벤트 발생했을 경우에 실행할 콜백 함수 (이벤트 리스너) 저장해서
			     send()의 응답을 받아줌
		   false: send()가 응답 받기 전까지 기다리고 있음
		*/
		
		// document.body.innerHTML: <h1> ~ <script>만 포함
		document.body.innerHTML += xhr.responseText;
		
		// document.getElementById("includeJSP").innerHTML += xhr.responseText;
		// <div id="includeJSP"></div>를 모름 (순차적인 실행)
	</script>
	<div id="includeJSP"></div>
	<hr/>
	<h1>01_async1.jsp page</h1>
</body>
</html>