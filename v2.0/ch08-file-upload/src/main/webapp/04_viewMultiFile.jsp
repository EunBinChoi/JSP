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
			out.println("<img alt=\"image\" src=\"" + fileImage + "\" width=\"300px\">" + "<br/>");
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
		request.setCharacterEncoding("utf-8");
		
		int textFileCnt = 0;
		int imgFileCnt = 0;
	
		if(session.getAttribute("uploadTextCnt") != null) {
			textFileCnt = (Integer)session.getAttribute("uploadTextCnt");
		}
		if(session.getAttribute("uploadImagCnt") != null) {
			imgFileCnt = (Integer)session.getAttribute("uploadImagCnt");
		}
		
		out.println("<br/>");	
		// session 등록 객체 확인
		Enumeration<String> attributeNames = session.getAttributeNames();
		while(attributeNames.hasMoreElements()) {
			String key = attributeNames.nextElement();
			Object value =  session.getAttribute(key);
			out.println(key + " : " + value + "<br/>");	
		}
		
		// 파일 불러오기
		// 입력한 파일 순서가 안맞음 
		// 텍스트는 텍스트들끼리, 이미지는 이미지들끼리 출력
		while(textFileCnt != 0) {
			previewTextFile(request, response, "uploadText"+textFileCnt);
			textFileCnt--;
		}
		while(imgFileCnt != 0) {
			previewImgFile(request, response, "uploadImag"+imgFileCnt);
			imgFileCnt--;
		}
		
		//session.invalidate();
		%>
</body>
</html>