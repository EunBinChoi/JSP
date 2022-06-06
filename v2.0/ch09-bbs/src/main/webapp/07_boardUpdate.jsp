<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.bbs.mgr.*"%>
<%@ page import="me.bbs.servlet.*"%>
<%@ page import="me.jdbc.connectionPool.*"%>
<%@ page import="me.java.beans.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bMgr" class="me.bbs.mgr.BoardMgr" />
<% 
      request.setCharacterEncoding("UTF-8");

	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean"); 
	  // 세션에 저장되어있는 게시물을 가지고 옴 (bean이라는 키 값을 통해)
	  
	  // bean에 저장되어있는 값 반환
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/script07.js" defer></script>
</head>
<body>
<jsp:include page="header.jsp"/> 
<div align="center"><br/><br/>
<table width="600px" cellpadding="3">
  <tr>
   <td bgcolor="#FFFFE8"  height="21" align="center">수정하기</td>
  </tr>
</table>
<!-- 서블릿 BoardUpdateServlet 매핑으로 설정된 boardUpdate 호출 -->
<form name="updateFrm" method="post" action="./BoardUpdateServlet">
<table width="600px" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input name="name" value="<%=name%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>제 목</td>
     <td>
	  <input name="subject" size="50" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td>내 용</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>비밀 번호</td> 
     <td><input type="password" name="pass" size="15" maxlength="15">
      수정 시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onclick="javascript:check()">
      <input type="reset" value="원래대로"> 
      <input type="button" value="뒤로" onclick="javascript:history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
<jsp:include page="footer.jsp"/> 
</body>
</html>