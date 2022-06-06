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
	  if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))){
		 num = Integer.parseInt(request.getParameter("num"));
	  }
	
	  PollListBean plBean = pMgr.getList(num);
	  List<String> list = pMgr.getItem(num);
	  
	  String question = plBean.getQuestion();
	  int type = plBean.getType();
	  int active = plBean.getActive();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey</title>
<link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="./PollFormServlet">
<table style='width:"300"'>
	<tr>
		<td colspan="2">Q : <%=question%></td>
	</tr>
	<tr>
		<td colspan="2">
			<%
				for(int i = 0; i < list.size(); i++){
					String itemList = list.get(i);
					if(type == 1){
						out.println("<input type='checkbox' name='itemnum' value='"+i+"'>");
					}
					else{
						out.println("<input type='radio' name='itemnum' value='"+i+"'>");
					}
					out.println(itemList + "<br>");
				}//for end
			%>
		</td>
	</tr>
	<tr>
		<td>
			<% 
			if(active == 1) { out.println("<input type='submit' value='투표'>"); }
			else { out.println("투표"); }
			%>
			
		</td>
		<td>
		
		<script>
		 	function openWindowAtCenter(url, width, height) {
	            const top = (screen.availHeight - height) / 2;
	            const left = (screen.availWidth - width) / 2;
	            const spec = "width=" + width + ", height=" + height + ", top=" + top + ", left=" + left;
	            return window.open(url, "_blank", spec); 
		 	}
		</script>
		<input type="button" value="결과" 
		onclick="javascript:openWindowAtCenter('12_pollView.jsp?num=<%=num%>', 500, 800)">
		</td>
	</tr>
</table>
<input type="hidden" name="num" value="<%=num%>">
</form>
<jsp:include page="footer.jsp"/> 
</body>
</html>