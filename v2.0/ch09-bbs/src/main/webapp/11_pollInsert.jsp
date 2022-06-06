<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<b>New Survey</b>
		<hr width="800px" />
		<br/><br/><br/><br/>
		<form method="post" action="./PollInsertServlet">
			<table border="1" width="600px">
				<tr>
					<td><b>Question</b></td>
					<td colspan="2">
					<input name="question" size="30"></td>
				</tr>
				
				<tr>
					<td rowspan="8"><b>Answer</b></td>
					<%
						for (int i = 1; i <= 4; i++) {
							
							if(i != 1){
								out.println("<tr>");
							}
							out.println("<td>" + "<label for=\"item\">" + (i * 2 - 1) + "</label>&nbsp;&nbsp;"
									+ ": <input id=\"item\"  name=\"item" + (i * 2 - 1) + "\"></td>");
							out.println("<td>" + "<label for=\"item\">" + (i * 2) + "</label>&nbsp;&nbsp;"
									+ ": <input id=\"item\"  name=\"item" + (i * 2) + "\"></td>");
							
							out.println("</tr>");
							
						}//for end
					%>
				<tr>
					<td>Start</td>
					<td colspan="2">
						<select name="sdateY">
							<option value="2021">2021
							<option value="2022">2022
							<option value="2022">2023
							<option value="2022">2024
							<option value="2022">2025
						</select>
						
						<select name="sdateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
						</select>
						<select name="sdateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
						</select></td>
				</tr>
				<tr>
					<td>End</td>
					<td colspan=2>
						<select name="edateY">
							<option value="2021">2021
							<option value="2022">2022
							<option value="2022">2023
							<option value="2022">2024
							<option value="2022">2025
						</select> 
						<select name="edateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
						</select>
						<select name="edateD">
						
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
						</select></td>
				</tr>
				<tr>
					<td>Allow Multiple Selection</td>
					<td colspan=2>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3>
						<input type="submit" value="작성하기"> 
						<input type="reset" value="다시쓰기"> 
						<input type="button" value="리스트" onclick="javascript:location.href='09_pollList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/> 
</body>
</html>