<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- arr, radius 전역 변수 선언 & 초기화
	
		if(arr != null) min(arr); max(arr);
		if(radius != 0) getCircleArea(radius);
	-->
	<%! 
		public String getDate() {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(date);	
		}
	
		public int min(int[] arr) {
			int min = Integer.MAX_VALUE;
			for(int i = 0; i < arr.length; i++) {
				if(min > arr[i]) min = arr[i];
			}
			return min;
		}
		
		public int max(int[] arr) {
			int max = Integer.MIN_VALUE;
			for(int i = 0; i < arr.length; i++) {
				if(max < arr[i]) max = arr[i];
			}
			return max;
		}
		
		public double getCircleArea(double r) {
			return Math.PI * r * r;
		}
		
		int[] arr = null; double radius = 0; 
	%>
	
	<%
		// "1,2,3,4,5": string
		// "1", "2", "3", "4", "5": string[]
		// 1, 2, 3, 4, 5: int[]

	
		if(request.getParameter("arr") != null) {
			String requestArr = request.getParameter("arr");
			String[] reqeustArrSplit = requestArr.split(",");
			arr = new int[reqeustArrSplit.length];
			
			for(int i = 0; i < arr.length; i++) {
				arr[i] = Integer.parseInt(reqeustArrSplit[i]);
			}
		}
		
		
		// "12.34": string
		// 12.34: double
		if(request.getParameter("radius") != null) {
			String requestRadius = request.getParameter("radius");
			radius = Double.parseDouble(requestRadius);
		}
	%>
	
	<!-- response  -->
	<h2>response</h2>
		today: <%= getDate() %>
		<br/>
		
		<% if (arr != null) { %>
			min(): <%= min(arr) %>
			<br/>
			max(): <%= max(arr) %>
			<br/>
		<% } %>
		
		<% if (radius != 0) { %>
			circle area(): <%= getCircleArea(radius) %>
		<% } %>
	
</body>
</html>