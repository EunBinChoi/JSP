<!-- 
	03_home.jsp에서는 포토 하단의 [DEL]을 클릭하면 포토포스트와 관련된 댓글이 함께 삭제됨
	삭제 기능은 PBlogDeleteServlet 서블릿에서 처리함
	여기까지가 첫번째 단계에서 구현할 흐름 
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, me.java.beans.*" %>
<!-- 포토포스트 및 댓글에 필요한 PBlogMgr과 PReplyMgr 객체 생성 -->
<jsp:useBean id="pmgr" class="me.sns.main.PBlogMgr"/>
<jsp:useBean id="rmgr" class="me.sns.reply.PReplyMgr"/>
<jsp:useBean id="hmgr" class="me.sns.heartReply.HeartReplyMgr"/>
<%
		request.setCharacterEncoding("UTF-8");

		// 세션에서 id를 가져옴
		String id = (String)session.getAttribute("idKey");

		// 세션에서 가져온 id값이 null이면 01_login.jsp로 이동
		if(id == null) response.sendRedirect("01_login.jsp");
		
		// id를 매개변수로 getPMember()를 호출하여 로그인 사용자의 정보를 가져옴
		PMemberBean mbean = pmgr.getPMember(id);
		
		// 로그인 사용자를 제외한 5명의 랜덤한 회원 리스트를 Vector 타입으로 가져옴
		Vector<PMemberBean> mvlist = pmgr.listPMember(id);
		
		// 로그인 사용자의 포토포스트 리스트를 Vector 타입으로 가져옴
		Vector<PBlogBean> pvlist = pmgr.listPBlog(id);
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>PhotoBlog</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/js03.js" defer></script>
</head>
<body>
<div data-role="page" align="center">
	<div data-role="header">
		<table>
			<tr>
				<td align="left" width="200">
					<h1 style="font-family: fantasy;" align="left">PhotoBlog</h1></td>
				<td>
					<a style="font-size: 40px;" href="javascript:goURL('03_home.jsp','')">H</a>
					<a style="font-size: 40px;" href="javascript:goURL('04_post.jsp','')">P</a>
				</td>
				<td>	
					<div class="box" style="background: #BDBDBD;">
					
						<!-- 로그인 id의 프로필 포토가 보이고 포토를 클릭하면 로그아웃 페이지로 이동 -->
						<img align="bottom" class="profile" src="./photo/<%=mbean.getProfile()%>" width="30" height="30" onclick="location='02_logout.jsp'">
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 로그인 사용자를 제외한 전체 회원 중에 5명을 랜덤하게 선택하여 프로필 포토와 이름 출력
	프로필 포토를 클릭하면 클릭한 사람의 포토블로그 페이지 05_guest.jsp로 이동 -->
	<div data-role="content">
	<table>
		<tr>
		<%
				for(int i = 0; i < mvlist.size(); i++){
					PMemberBean mvbean = mvlist.get(i);
		%>
			<td width="80">
				<div class="box1" style="background: #BDBDBD;">
				<!-- 포토필 포토를 클릭하면 클릭산 하용자의 포토 블로그로 이동함 -->
					<a href="javascript:goURL('05_guest.jsp','<%=mvbean.getId()%>')">
						<img class="profile1" src="./photo/<%=mvbean.getProfile()%>" width="30" height="30">
					</a>
				</div>
				<div>
					<h4><%=mvbean.getName()%></h4>
				</div>
			</td>
		<%}%>	
		</tr>
	</table>
	
	<!-- 로그인 사용자의 포토블로그를 보여주는 영역
	프로필 포토 및 id 그리고 포토포스트 및 메시지를 보여주고 만약 댓글이 있으면 댓글 리스트를 보여줌 -->
	<table>
		<%
				for(int i = 0; i < pvlist.size(); i++){
					PBlogBean pbean = pvlist.get(i);
					PMemberBean tmbean = pmgr.getPMember(pbean.getId());
		%>
		<tr>
			<td width="30">
				<div class="box" style="background: #BDBDBD;">
					<img class="profile" src="photo/<%=tmbean.getProfile()%>" width="30" height="30">
				</div>
			</td>
			<td width="250"><b><%=tmbean.getId()%></b></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3">
				<img src="photo/<%=pbean.getPhoto()%>" width="350" height="250">
			</td>
		</tr>
		<tr>
			<td colspan="3"><b><%=pbean.getMessage()%></b></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="javascript:heart('<%=pbean.getNum()%>')">
				<!-- 하트 모양의 아이콘이 클릭하면 포토포스트의 '좋아요' 카운트 증가 -->
				<% 
					// 해당 게시물의 좋아요를 누른 HeartReplyBean 리스트 반환
					Vector<HeartReplyBean> hrlist = hmgr.listHeartReply(pbean.getNum()); 
					int j = 0;
					for(j = 0; j < hrlist.size(); j ++) {
						if((hrlist.get(j).getNum() == pbean.getNum()) && 
								(hrlist.get(j).getId().equals(pbean.getId()))) {
							out.println("<img src=\"img/red-heart.png\" align=\"top\">");
							break;
						}
					}
					if(j == hrlist.size() || hrlist.size() == 0) {
						out.println("<img src=\"img/heart.png\" align=\"top\">");
					}
					
				%>
				</a> 
				좋아요 <%=pbean.getHcnt()%>개</td>
				
				<!-- [DEL]를 클릭하면 포토포스트 삭제 -->
				<td align="center">
				<a href="javascript:del('<%=pbean.getNum()%>')">DEL
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="3" width="200">
					<%
						// 매개변수는 포토포스트의 num 값으로 댓글 리스트를 Vector로 리턴
						Vector<PReplyBean> rvlist = rmgr.listPReply(pbean.getNum());
						for(int k = 0; k < rvlist.size(); k++){
							PReplyBean rbean = rvlist.get(k);
					%>
				
							<!-- 댓글을 입력자가 로그인한 사용자와 같은 id라면 댓글을 삭제할 수 있는 [x] 모양이 활성화됨 -->
							<b><%=rbean.getId()%></b> <%=rbean.getComments()%>&nbsp;
							<%if(id.equals(rbean.getId())){%>
								<a href="javascript:rDel('<%=rbean.getRnum()%>')">x</a>
							<%}%><br>			
				<%}%>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- 댓글을 입력하는 input 태그 -->
				<input id="comments<%=pbean.getNum()%>" placeholder="댓글달기..." size="50">
			</td>
			<td align="center">
				<a href="javascript:cmtPost('<%=pbean.getNum()%>', '<%=id%>')">게시</a>
			</td>
		</tr>
		<tr>
			<td colspan="3"><br></td>
		</tr>
		<%}%>
	</table>
	</div>
	
	<!-- frm, frm1의 폼은 자바스크립트 함수에서 사용을 하기 위해 선언된 폼이고
	화면에는 보이지 않는 hidden 타입으로 전부 선언함 -->
	<form method="post" name="frm">
		<input type="hidden" name="num">
		<input type="hidden" name="comments">
		<input type="hidden" name="rnum">
		<input type="hidden" name="id">
	</form>
	<form method="post" name="frm1" action="03_home.jsp">
		<input type="hidden" name="gid">
	</form>
	
	<!-- 하단 부분의 페이지 06_footer.jsp 페이지 지시자로 가져옴 -->
	<%@include file="footer.jsp" %>
</div>
</body>
</html>