<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

	request.setCharacterEncoding("UTF-8");
	// 사용자의 요청에 전달된 데이터에 대한 인코딩을 지정
	// 한글 처리
	
	/*
		input 태그에 파일 수를 입력한 뒤 [확인] 버튼을 누르면 현재 페이지가 전송
		[확인] 버튼을 눌러 전송하는 폼은 다시 현재 페이지로 전송하게 되는데
		이때 name="inputFileCount"에 입력된 파일 개수 추출
	*/
	
	String user = "";
	String title = "";
	String inputFileCount = "0";
	int inputFileCountInt = 0;
	

	// ok를 눌렀을 때	
	if(request.getParameter("user") != null) { 
		user =  request.getParameter("user");
		session.setAttribute("user", request.getParameter("user")); // 이후 재사용하기 위함
	}
	else if(session.getAttribute("user") != null) {
		user = (String)session.getAttribute("user");
	}
	
	if(request.getParameter("title") != null) {
		title =  request.getParameter("title");
		session.setAttribute("title", request.getParameter("title")); // 이후 재사용하기 위함 
	}
	else if(session.getAttribute("title") != null) {
		title = (String)session.getAttribute("title");
	}
	
	if(request.getParameter("inputFileCount") != null){
		inputFileCount =  request.getParameter("inputFileCount");
		session.setAttribute("inputFileCount", request.getParameter("inputFileCount")); // 이후 재사용하기 위함 
	}
	else if(session.getAttribute("inputFileCount") != null) {
		inputFileCount = (String)session.getAttribute("inputFileCount"); 
	}
	///////////////////////////////////////////////////////////////////
	
	try {
		inputFileCountInt = Integer.parseInt(inputFileCount);
	} 
	catch(NumberFormatException e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Select Page</title>
<script src="./js/js03.js"></script>
</head>
<body>

<!-- 폼들끼리는 중첩 불가능 -->
<!-- 단순히 사용자의 입력을 받기 위한 필드를 갖고 있는 폼 -->
<form name="generalForm" method="post">
	<!-- generalForm의 0번 인덱스 user -->
    <label for="user">user: </label>
    <input id="user" name="user" value="<%=user%>"><br/>
   
    <label for="title">title: </label>
    <!-- generalForm의 1번 인덱스 title -->
    <input id="title" name="title" value="<%=title%>"><br/>

	<label for="inputFileCount">num of file: </label>
	<input id="inputFileCount" name="inputFileCount">
	<!-- 아무런 값 입력 (파일 개수 입력)이 없다면 메시지 띄워서 파일 개수 입력함 -->
	<input type="button" value="OK" onclick="addFile(this.form, 2)">
</form>


<!-- 파일 업로드를 위한 파일 정보 받는 폼 -->
<!-- 파일 업로드를 위해 사용되는 폼의 enctype이 multipart/form-data로 지정되어 있어서
request 객체를 통해서 폼 데이터를 처리할 수 없기 때문에 동적으로 파일선택 창을 생성하기 위해서는 폼을 따로 만들어야 함 -->
<form name="fileUploadForm" method="post" enctype="multipart/form-data">
	
	<%	for(int i=0; i < inputFileCountInt; i++){%>
		<input type="File" size="50" name="selectFile<%=i%>"><br/>	 	
	<%	}%>
	<input type="submit" value="Upload" onclick="elementCheck(this.form)">
	<!-- 버튼이 눌리면 이벤트 발생 -->
	<!-- 모든 폼 요소들의 필드값에 누락된 부분이 없는지 (파일 선택이 누락된 부분이 없는지) -->
</form>
</body>
</html>