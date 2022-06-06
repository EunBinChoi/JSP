<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*, java.io.*, java.net.*"%>

<%!
	
	public void previewTextFile(HttpServletRequest request, HttpServletResponse response, String attributeName) {
		String fileText = null;
		PrintWriter out = null;
		HttpSession session = null;
		
		while(fileText == null) {
			try {
				out = response.getWriter();
				session = request.getSession();
				fileText = (String)session.getAttribute(attributeName);
				fileText = request.getRealPath(fileText);
				
				if(fileText != null) {
					File f = new File(fileText);
					if(f.length() == 0) throw new Exception();
				}
				else {
					throw new Exception();
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				
				try {
					Thread.sleep(3000);
				} catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	
		// 서버에 올라간 데이터 타입이 어떤 것인지에 따라 읽음
		// 만약 text인 경우
		if(fileText != null) {
			out.println("<h3>" + fileText + "</h3>");
			Reader fis = null;
			BufferedReader bis = null;
			try {
				fis = new FileReader(fileText);
				bis = new BufferedReader(fis);
				String data;
				while((data = bis.readLine()) != null) {
					out.println(data + "<br/>");
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {	
				if(bis != null) try{bis.close();} catch(Exception e) {e.printStackTrace();}
				if(fis != null) try{fis.close();} catch(Exception e) {e.printStackTrace();}
			}
			//session.removeAttribute(attributeName);
		}
	}

	public void previewImgFile(HttpServletRequest request, HttpServletResponse response, String attributeName) {
		String fileImage = null;
		PrintWriter out = null;
		HttpSession session = null;
		
		while(fileImage == null) {
			try {
				out = response.getWriter();
				session = request.getSession();
				fileImage = (String)session.getAttribute(attributeName);
				
				if(fileImage != null) {
					File f = new File(fileImage);
					if(f.length() == 0) throw new Exception();
				}
				else {
					throw new Exception();
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				
				try {
					Thread.sleep(3000);
				} catch(Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	
		// 서버에 올라간 데이터 타입이 어떤 것인지에 따라 읽음
		// 만약 text인 경우
		if(fileImage != null) {
			out.println("<h3>" + fileImage + "</h3>");
			out.println("<img alt=\"image\" src=\"" + fileImage + "\" width=\"300px\"><br/>");
			out.println("<a href=\"" + fileImage + "\" width=\"300px\" download>download click</a>");
			//session.removeAttribute(attributeName);
		}
		
	}
 %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); // get
		
	
		if(session.getAttribute("uploadText") != null) {
			previewTextFile(request, response,  "uploadText");
		}
		if(session.getAttribute("uploadImage") != null) {
			previewImgFile(request, response,  "uploadImage");
		} 
		
	%>
</body>
</html>