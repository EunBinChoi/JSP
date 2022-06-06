<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.jdbc.connectionPool.*" %>
<%@ page import="me.java.beans.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	
		request.setCharacterEncoding("UTF-8");
		List<BoardBean> boardBeanList = BoardDBCP.selectAll("board");
		int totalRecord = boardBeanList.size();
		int totalPage = 0; // 전체 페이지 수 (계산 예정)
		int totalBlock = 0; // 전체 블럭 수 (계산 예정)
		
		int numPerPage = 10; // 페이지당 레코드 수
		int pagePerBlock = 15; // 블럭당 페이지 수 (하이퍼링크 수)
		
		int nowPage = 1;
		int nowBlock = 1;
		
		// 하이퍼링크로 전달 (query string)
		if (request.getParameter("nowPage") != null) { 
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		
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
		int start = totalRecord - (nowPage-1) * numPerPage; 
		int end = start - (numPerPage-1);
		
		//int listSize = 0; // 현재 읽어온 게시물 번호
		
		// 게시물 번호 출력
		for(int i = 0; i < numPerPage; i++) {
			// 출력하려고 하는 게시물 번호가 0보다 작거나 같으면 출력 X
			if(start - i <= 0) break; 
			out.println("<p>" + (start - i) + "</p>");
		}
		
		
		// 하단의 페이지 번호 (하이퍼링크) 출력
		// 1 2 3 4 ....  15 (첫번째 블럭)
		// 16 ....20.... 30 (두번째 블럭)
		// 31 .........  45 (세번째 블럭)
		int pageStart = (nowBlock-1) * pagePerBlock + 1; // 1, 16
		int pageEnd   = pageStart + pagePerBlock - 1; // 15, 30
		if(pageEnd >= totalPage) pageEnd = totalPage; // 추가
		
		if(totalPage != 0) {
			
			//          1 2 3 ... 15 ... next (첫번째 블럭)
			// prev.... 16........30 (두번째 블럭)
			// nowBlock 1보다 클 때 (수정)
			if(nowBlock > 1) {
				out.println("<a href=\"./01_pageing.jsp?nowPage=" + (pageStart - 1) + "\">" + "prev..." + "</a>");
			}
			
			for(int i = pageStart; i <= pageEnd; i++) {
				out.println("<a href=\"./01_pageing.jsp?nowPage=" + i + "\">" + "[" + i + "]" +"</a>");
				// query string으로 now page에 대한 정보 넘기기	
			}
			
			// totalBlock이 nowBlock보다 클 때 (뒤에 블럭이 남아있을 때)
			if(totalBlock > nowBlock) {
				out.println("<a href=\"./01_pageing.jsp?nowPage=" + (pageEnd + 1) + "\">" + "...next" + "</a>");
			}
		}
		
	%>
</body>
</html>