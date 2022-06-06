<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
	// AJAX JQuery
	/*
		$.ajax({

		  type: 'post or get',
		  async: 'true or false',
		  url: '요청할 url',
		  data: {서버로 전송할 데이터},
		  dataType: '서버에서 전송받을 데이터 형식',
		  success: {
		      // 정상 요청, 응답 시 처리 작업
		  },
		  error : function(xhr,status,error) {
		      // 오류 발생 시 처리
		  },
		  complete: function(data,textStatus) {
		      // 작업 완료 후 처리
		  }
		});
		
		------------------------------------------------
		속성	        설명
		------------------------------------------------
		type	    통신 타입을 설정
		url	        요청할 url
		async	    비동기로 할 거냐 말 거냐
		data	    서버에 요청할 때 보낼 매개변수 설정
		dataType	응답 받을 데이터 타입 (XML,JSON,TEXT,HTML 등)
		success	    요청/응답에 성공했을 때 처리할 구문
		error	     요청/응답에 실패했을 때 처리할 구문
		complete	작업을 마친 후에 처리할 구문
		------------------------------------------------
	*/
	
	// 1. javascript
	// window.onload = () => {}
	
	// 2. jQuery
	// $().ready(() => {})
	$(() => {
		$.ajax({
			type: "GET",
			async: true,
			url: "data/xml.xml",
			dataType: "xml",
			success: (data) => {
				let htmlTag = "<table border='1' style='width:300px;'>";
				htmlTag += "<tr>";
				htmlTag += "<th>name</th>";
				htmlTag += "<th>age</th>";
				htmlTag += "</tr>";
				
				const persons = $(data).find('person');
				persons.each((i, person) => {		
					htmlTag += "<tr>";
					if($(person).find('name').text() != "" && 
							$(person).find('age').text() != "") {
						htmlTag += "<td>" + $(person).find('name').text() + "</td>";
						htmlTag += "<td>" + $(person).find('age').text() + "</td>";
					}
					else {
						htmlTag += "<td>" + $(person).attr('name') + "</td>";
						htmlTag += "<td>" + $(person).attr('age') + "</td>";
					}
					htmlTag += "</tr>";	
				});
				htmlTag += "</table>";
				$("#result").append(htmlTag);
			},
			error: () => {
				$("#result").append("[ERROR] can not read json.");
			},
			complete: () => {
				$("#result").append("[COMPLETE]");
			}		
		})	
	})
</script>
<div id="result"></div>
</body>
</html>