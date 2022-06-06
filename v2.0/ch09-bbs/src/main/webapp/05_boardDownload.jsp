<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bMgr" class="me.bbs.mgr.BoardMgr" />

<%
	  bMgr.downLoad(request, response, out, pageContext);
%>