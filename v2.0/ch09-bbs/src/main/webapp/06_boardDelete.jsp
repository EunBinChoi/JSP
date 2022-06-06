<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.bbs.mgr.*"%>
<%@ page import="me.bbs.servlet.*"%>
<%@ page import="me.jdbc.connectionPool.*"%>
<%@ page import="me.java.beans.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bMgr" class="me.bbs.mgr.BoardMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/script06.js" defer></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass"); // 07_delete.jsp에서 전달한 값을 받음
		BoardBean bean = (BoardBean) session.getAttribute("bean"); 
		// 05_read.jsp에서 세션에 저장한 게시물 가지고 옴
		String dbPass = bean.getPass(); // 세션에 저장한 게시물의 pass 값 반환
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num); // 게시번호 (num)을 통해서 게시물 삭제
			String url = "02_boardList.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
			out.println("<script>alert(\"입력하신 비밀번호가 아닙니다!\"); history.back()</script>");
		}
	}
		
%>
		
<jsp:include page="header.jsp"/> 
<div align="center">
		<br/><br/>
		<table width="800px" cellpadding="3">
			<tr>
				<td bgcolor=#dddddd height="21" align="center">
					사용자의 비밀번호를 입력해주세요.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="06_boardDelete.jsp">
			<table width="800px" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td align="center">
									<input type="password" name="pass" size="17" maxlength="15">
								</td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"/></td>
							</tr>
							<tr>
								<td align="center">
									<input type="button" value="삭제완료" onclick="javascript:check()"> 
									<input type="reset" value="다시쓰기">
									<input type="button" value="뒤로" onclick="javascript:history.go(-1)">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<jsp:include page="footer.jsp"/> 
</body>
</html>