<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.poll.mgr.*"%>
<%@ page import="me.poll.servlet.*"%>
<%@ page import="me.jdbc.connectionPool.*"%>
<%@ page import="me.java.beans.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="pMgr" class="me.poll.mgr.PollMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/> 
<div align="center">
		<br/>
		<h2>Survey</h2>
		<hr width="800px"/>
		
		<b>Selected Topic</b>
		<!--폴 리스트 폼 자리-->
		<jsp:include page="10_pollForm.jsp" />
		<hr width="800px"/>
		<b>Survey List</b>
		<!--폴 리스트 테이블 자리-->
		<table>
			<tr>
				<td> 
					<table width="600px">
						<tr>
							<td align="center"><b>Num.</b></td>
							<td><b>Subject</b></td>
							<td><b>Start~End Date</b></td>
						</tr>
						<%
							  List<PollListBean> list = pMgr.getAllList();
							  int count = list.size();
							  for (int i = 0; i < list.size(); i++) {
								PollListBean plBean = list.get(i);
								int num = plBean.getNum();
								String question = plBean.getQuestion();
								String sdate = plBean.getSdate();
								String edate = plBean.getEdate();
								out.println("	<tr><td align='center'>" + count + "</td>");
								out.println("<td><a href='09_pollList.jsp?num=" + num + "'>"
										+ question + "</a></td>");
								out.println("<td>" + sdate +" ~ "+ edate + "</td></tr>");
								count = count - 1;
							}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="./11_pollInsert.jsp">+ Create New Survey</a></td>
			</tr>
		</table>
	</div>
<jsp:include page="footer.jsp"/> 
</body>
</html>