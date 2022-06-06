<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="me.poll.mgr.*"%>
<%@ page import="me.poll.servlet.*"%>
<%@ page import="me.jdbc.connectionPool.*"%>
<%@ page import="me.java.beans.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="pMgr" class="me.poll.mgr.PollMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = 0;
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	int sum = pMgr.sumCount(num);
	List<PollItemBean> list = pMgr.getView(num);
	PollListBean plBean = pMgr.getList(num);
	String question = plBean.getQuestion();
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center" style="height:100vh; display:flex; 
flex-direction: column; justify-content: center;">
	<div>
		<table border="1">
			<tr>
				<td colspan="4"><b>Q : <%=question%></b></td>
			</tr>
			<tr>
				<td colspan="3"><b>Total Voting : <%=sum%></b></td>
				<td width="40">count</td>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
					PollItemBean piBean = list.get(i);
					String[] item = piBean.getItem();//아이템 
					int rgb = r.nextInt(255 * 255 * 255);
					String rgbt = Integer.toHexString(rgb);
					String hRGB = "#" + rgbt;
					int count = piBean.getCnt(); // 투표수
					int ratio = ((Double)(Math.ceil((double) count / sum * 100))).intValue();
			%>
			<tr>
				<td width="20" align="center"><%=i+1%></td>
				<td width="120"><%=item[0]%></td>
				<td>
					<table width="<%=ratio%>" height="15">
						<tr>
							<td bgcolor="<%=hRGB%>"></td>
						</tr>
					</table>
				</td>
				<td width="40"><%=count%></td>
			</tr>
			<%} //for%>
		</table>
		</div>
		<div style="margin-top: 20px"><a href="javascript:window.close()">닫기</a></div>
	</div>
</body>
</html>