<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/script03.js" defer></script>
</head>
<body>
<jsp:include page="header.jsp"/> 
<div align="center">
<br/><br/>
<table width="800px" cellpadding="3">
	<tr>
		<td bgcolor="#D0D0D0" height="25" align="center">글쓰기</td>
	</tr>
</table>
<br/>

<form name="postFrm" method="post" action="./BoardPostServlet" onsubmit="javascript:return checkPostFrm()" enctype="multipart/form-data">
<table width="800px" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">성 명</td>
				<td width="90%">
				<input name="name" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀 번호</td>
				<td><input type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			<tr>
			 <tr>
     			<td>파일찾기</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>내용타입</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="등록">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onclick="javascript:location.href='02_boardList.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<!-- 
	게시물을 등록한 사용자의 IP 주소 반환
	IP 주소가 0:0:0:0:0:0:1일 때 RUN CONFIG (argument) 추가 -Djava.net.preferIPv4Stack=true
	IPV6는 IPV4보다 향상된 인터넷 프토토콜 버전 (주소 길이 32bit -> 128bit)
 -->
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
<jsp:include page="footer.jsp"/> 
</body>
</html>