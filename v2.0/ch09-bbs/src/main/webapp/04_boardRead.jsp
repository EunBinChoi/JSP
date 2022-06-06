<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.bbs.mgr.*" %>
<%@ page import="me.bbs.servlet.*" %>
<%@ page import="me.jdbc.connectionPool.*" %>
<%@ page import="me.java.beans.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bMgr" class="me.bbs.mgr.BoardMgr" />
<%
	  request.setCharacterEncoding("UTF-8");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  
	  
	  bMgr.upCount(num); // 조회수 증가
	  BoardBean bean = bMgr.getBoard(num); // 게시물 가져오기
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegDate();
	  String content = bean.getContent();
	  String filename = bean.getFileName();
	  int filesize = bean.getFileSize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean); // 세션에 읽어온 게시물을 'bean'이라는 키 값으로 객체 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/script04.js" defer></script>
</head>
<body>
<jsp:include page="header.jsp"/> 
<br/><br/>
<table align="center" width="800px" cellspacing="3">
 <tr>
  <td bgcolor="#D0D0D0" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
  <td bgcolor="#FFFFE8"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
  <td bgcolor="#FFFFE8"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 제 목 </td>
    <td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename != null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>&nbsp;&nbsp;(<%=filesize%>KBytes)<%} 
     	else{%> 등록된 파일이 없습니다.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>로부터 글을 남기셨습니다. / 조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="07_boardUpdate.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <a href="08_boardReply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
 <a href="06_boardDelete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
  </td>
 </tr>
</table>


<form name="downFrm" action="05_boardDownload.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="02_boardList.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord == null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
<jsp:include page="footer.jsp"/> 
</body>
</html>