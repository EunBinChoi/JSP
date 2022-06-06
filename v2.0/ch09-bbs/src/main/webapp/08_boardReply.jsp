<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.bbs.mgr.*"%>
<%@ page import="me.bbs.servlet.*"%>
<%@ page import="me.jdbc.connectionPool.*"%>
<%@ page import="me.java.beans.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bMgr" class="me.bbs.mgr.BoardMgr" />
<jsp:useBean id="bean" class="me.java.beans.BoardBean" scope="session"/>
    
<%
      request.setCharacterEncoding("UTF-8");

	  String nowPage = request.getParameter("nowPage");
	  String subject = bean.getSubject();
	  String content = bean.getContent(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/script08.js" defer></script>
</head>
<body>
<jsp:include page="header.jsp"/> 
<div align="center">
<br><br>
 <table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#FFFFE8" height="21" align="center">답변하기</td>
  </tr>
</table>

<!-- 서블릿 BoardReplyServlet의 매핑으로 설정된 BoardReplyServlet 호출 -->
<form name="replyFrm" method="post" action="./BoardReplyServlet" onsubmit="javascript:return checkReplyFrm()">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input name="name" size="30" maxlength="20"></td>
    </tr>
    <tr>
     <td>제 목</td>
     <td>
     <!-- 답변하고자 하는 게시물의 제목을 보여줌 -->
	  <input name="subject" size="50" value="답변 : <%=subject%>" maxlength="50"></td> 
    </tr>
	<tr>
     <td>내 용</td>
     <td>
     
     <!-- 답변하고자 하는 게시물의 답변을 보여줌 -->
	  <textarea name="content" rows="12" cols="50">
      	<%=content %>
      	========답변 글을 쓰세요.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td>비밀 번호</td> 
     <td>
	  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
     <td colspan="2">
	  <input type="submit" value="답변등록">
      <input type="reset" value="다시쓰기">
      <input type="button" value="뒤로" onclick="javascript:history.back()"></td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
</form> 
</div>
<jsp:include page="footer.jsp"/> 
</body>
</html>