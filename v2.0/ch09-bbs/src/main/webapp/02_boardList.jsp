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

		////////////////////////// 초기화 부분 //////////////////////////////////
		int totalRecord = 0;
		int totalPage = 0; // 전체 페이지 수 (계산 예정)
		int totalBlock = 0; // 전체 블럭 수 (계산 예정)
		
		int numPerPage = 10; // 페이지당 레코드 수
		int pagePerBlock = 15; // 블럭당 페이지 수 (하이퍼링크 수)
		
		int nowPage = 1;
		int nowBlock = 1;
		
		/*
			게시물을 가져오는 쿼리문인 select문의 마지막에 num between ? and ?를 통해 
			한 페이지에 필요한 만큼 게시물만 가져올 수 있음
		  	하나의 페이지에 가지고 올 게시물의 개수를 저장하기 위해 start, end 변수 사용
		*/
		  
		int start = 0; // 디비의 select 시작번호
		int end = 10; // 시작번호로부터 가져올 select 갯수
		  
		int listSize = 0; // 현재 읽어온 게시물의 수
		
		/////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////
		
		///////////// 현재 페이지 파라미터 반환 //////////////////////////////
		// 하이퍼링크로 전달 (query string)
		if (request.getParameter("nowPage") != null) { 
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
	
				 
		///////////// 검색 기능 /////////////////////////////////////////
		// 검색하기 위해서 검색에 사용했던 keyWord를 요청 파라미터로 반환
		String keyWord = "", keyField = "";
		List<BoardBean> boardList = null; 
		if (request.getParameter("keyWord") != null) {
			keyWord = request.getParameter("keyWord");
			keyField = request.getParameter("keyField");
		}
		
		// 검색한 후에 [처음으로]를 클릭하면
		// 모든 리스트를 확인하기 위해서 keyWord, keyField 값을 공백으로 처리
		// (form에 hidden 타입으로 reload = true 요청!)
		if (request.getParameter("reload") != null){
			if(request.getParameter("reload").equals("true")) {
				keyWord = "";
				keyField = "";
			}
		}
		
		// DB에서 start ~ end까지 게시물 가지고 옴
		start = (nowPage * numPerPage) - numPerPage + 1; // 10
		end = start + numPerPage - 1; // 10 + 10
	 
		// 전체 게시물 저장
		totalRecord = bMgr.getTotalCount(keyField, keyWord);
		////////////////////////////////////////////////////////////////
		
		/* 
			전체 페이지 수 == 전체 레코드 수 / 한 페이지당 게시물 수
			전체 레코드 수가 한 페이지당 게시물 수에 나누어떨어지지 않음을 대비해서 올림 연산
			
			totalRecord == 122
			numPerPage == 10
			12.2 => 13개의 페이지를 가짐 
		*/
		totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
		
		// 전체 블럭 수 계산
		// 전체 페이지 수 / 블럭당 페이지 수
		totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
		// 1 2 3 4 .... 15 (첫번째 블럭)
		// 16 ......... 30 (두번째 블럭)
		// 31 ......... 45 (세번째 블럭)
		// totalPage = 45, pagePerBlock = 15
		// totalBlock = 3
				
		// 현재 블럭 계산
		// 현재 페이지 번호 / 블럭당 페이지 수
		nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);
		// 1 2 3 4 ....  15 (첫번째 블럭)
		// 16 ....20.... 30 (두번째 블럭)
		// 31 .........  45 (세번째 블럭)
		// nowPage = 20, pagePerBlock = 15
		// nowBlock = ceil(20/15 === 1.33333333) = 2
		
		
		/*
			totalRecord == 120
			start: 120,  110,  100,  90,  80 ...
			end:   111,  101,   91,  81,  71 ...
		
		*/

		
		
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
<script src="./js/script02.js" defer></script>

</head>
<body>
	<jsp:include page="header.jsp"/> 
	<div align="center">
		<br />
		<h2>Board</h2>
		<br />
		<table align="center" width="800px">
			<tr>
				<td>Total : <%=totalRecord%> Articles (<font color="red"><%=nowPage%>/<%=totalPage%>
						Pages</font>)
				</td>
			</tr>
		</table>
		<table align="center" width="800px" cellpadding="3">
			<tr>
				<td align="center" colspan="2">
					<%
				 // 전체 게시물의 리스트 반환
				  boardList = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = boardList.size(); // 브라우저 화면에 보여질 게시물 번호
				  if (boardList.isEmpty()) {
				  	  out.println("등록된 게시물이 없습니다.");
				  } 
				  else {
			%>
					<table width="100%" border="1" cellpadding="2" cellspacing="0">
						<tr align="center" bgcolor="#D0D0D0" height="120%">
							<td width="50px">번 호</td>
							<td>제 목</td>
							<td width="80px">이 름</td>
							<td width="180px">날 짜</td>
							<td width="50px">조회수</td>
						</tr>
						<%
						 // 페이지별 뿌려줄 게시물의 시작번호부터 페이지당 레코드 수만큼 반복문 수행
						  for (int i = 0;i < numPerPage; i++) {
							if (i == listSize) break;
							// 페이지별 뿌려줄 게시물의 시작번호가 브라우저에 보여질 전체 게시물 사이즈와 같으면 반복문 빠져나옴
							BoardBean bean = boardList.get(i);
							int num = bean.getNum();
							String name = bean.getName();
							String subject = bean.getSubject();
							String regdate = bean.getRegDate();
							int depth = bean.getDepth();
							int count = bean.getCount();
							// 게시물이 저장되어있는 BoardBean에서 빈즈의 getter 메소드로 반환
					%>
						<!-- 게시물 번호 출력 -->
						<tr>
							<td align="center"><%=totalRecord-((nowPage-1)*numPerPage)-i%>
							</td>
							<!-- 페이지별 및 블럭 처리를 위해서 전체 게시물 수, 페이지 당 게시물 수,
								현재 페이지 계산, 페이지별 게시물의 시작번호 계산, 전체 페이지 수, 
								블럭 당 표시될 페이지 수, 현재 블럭 계산, 전체 블럭 계산을 위한
								선언 및 계산식
						
								=> 페이징 처리와 블럭 설정에서 사용되어짐
					 		-->
							<td>
						<%
							  // 게시물에 답변 글이 존재 (depth > 0)
							  if(depth > 0){
								// 답변 글임을 표시하기 위해서
								// 현재 게시물보다 뒤쪽에 출력
								for(int j = 0; j < depth; j++){
									out.println("&nbsp;&nbsp;");
								}
							  }
						%> <a href="javascript:read('<%=num%>')"><%=subject%></a>
							</td>
							<td align="center"><%=name%></td>
							<td align="center"><%=regdate%></td>
							<td align="center"><%=count%></td>
						</tr>
						<%}//for%>
					</table> <%
 			}//if
 		%>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br />
				<br /></td>
			</tr>
			<tr>
				<td>
					<!-- 페이징 및 블럭 처리 Start--> 
					<!-- 페이징과 블럭에 관련되어 prev..[1] ..[2]..[10]..next 등을 보여주기 위한 코드
					이전 블럭은 현재 블럭 값이 1 이상이 되어야하면 나타나며 페이지 링크를 16개씩 출력하도록 설정
					만약 반복문을 돌다가 총 페이지 링크 개수와 현재 뿌려줄 페이지 번호가 같아지면 반복문 종료
			
					그리고 [다음 16개]가 출력되기 위해서는 현재 블럭을 기준으로 
					현재 블럭 값이 총 블럭 개수보다 작야아만 다음 블럭 출력  --> <%
   				  int pageStart = (nowBlock-1) * pagePerBlock + 1 ; // 하단 페이지 시작번호
				  int pageEnd   = pageStart + pagePerBlock - 1; // 15, 30
				  if(pageEnd >= totalPage) pageEnd = totalPage; // 추가
				  /*out.println("pageStart : " + pageStart + "<br/>");
				  out.println("pageEnd : " + pageEnd + "<br/>");
				  out.println("nowPage : " + nowPage + "<br/>");
				  out.println("nowBlock : " + nowBlock + "<br/>");*/
   				  
   				  if(totalPage != 0) {
   					
   					  // 1 2 3 ... 15 ... next (첫번째 블럭)
   					  // prev.... 16........30 (두번째 블럭)
   					  // nowBlock 1보다 클 때 (수정)
   					  
   					  out.println("<div margin: \"auto\"; width: \"100%\">");
   					  if(nowBlock > 1) {
   						  out.println("<a href=\"./02_boardList.jsp?nowPage=" + (pageStart - 1) + 
   								  "&keyField=" + keyField  + "&keyWord=" + keyWord + "\">" + "prev..." + "</a>");
   					  }
   					
   					  
   					  for(int i = pageStart; i <= pageEnd; i++) {
   						  out.println("<a href=\"./02_boardList.jsp?nowPage=" + i + 
   								"&keyField=" + keyField + "&keyWord=" + keyWord +"\">" + "[" + i + "]" +"</a>");
   						  // query string으로 now page에 대한 정보 넘기기	
   					  }
   					 
   					
   					  // totalBlock이 nowBlock보다 클 때 (뒤에 블럭이 남아있을 때)
   					  if(totalBlock > nowBlock) {
   						  out.println("<a href=\"./02_boardList.jsp?nowPage=" + (pageEnd + 1) +
   								"&keyField=" + keyField + "&keyWord=" + keyWord + "\">" + "...next" + "</a>");
   					  }
   					  out.println("</div>");
   				    }
   			  %> <!-- 페이징 및 블럭 처리 End-->
				</td>
				<td width="20%" align="right">
				<a href="03_boardPost.jsp">[글쓰기]</a> <a
					href="javascript:list()">[처음으로]</a></td>
			</tr>
		</table>
		<hr width="800px" />
		<form name="searchFrm" method="get" action="02_boardList.jsp">
			<table width="800px" cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom">
					<select name="keyField" size="1">
							<option value="name">이 름</option>
							<option value="subject">제 목</option>
							<option value="content">내 용</option>
					</select> 
					<input size="16" name="keyWord"> 
					<input type="button" value="찾기" onclick="javascript:checkSearchFrm()"> 
					<input type="hidden" name="nowPage" value="1"></td>
				</tr>
			</table>
		</form>
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> <input
				type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	</div>
	<jsp:include page="footer.jsp"/> 
</body>
</html>

