<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@page import="java.util.*, java.io.*, java.net.*" %>
<%
	String saveFolder = request.getRealPath("files");
	// ���ε��� ���� ���� ��� ��ȯ
	
	String encType = "EUC-KR"; // ���ε��� ���� ���ڵ� Ÿ��
	int maxSize = 5 * 1024 * 1024; // 5mb
	// ���ε��� ���� �ִ� ũ��
	/*
		mb
		(1000)^2 => �ݵ�ü (������)
		(1024)^2 => SW (������)
	
	*/
	
	try{
		MultipartRequest multi = null;
		multi = new MultipartRequest
				(request, saveFolder, maxSize, encType, 
						new DefaultFileRenamePolicy());
		
		// user, title
		Enumeration params = multi.getParameterNames();
		
		while(params.hasMoreElements()){
			String name = (String)params.nextElement();
			// �Ķ���� �̸� ��ȯ
			String value = multi.getParameter(name);
			// �Ķ���� �̸��� ���� �� ��ȯ
			
			out.println(name + ":" + value + "<br/>");
		}
		
		// file
		Enumeration files = multi.getFileNames();
		// input type="file" ���� �Ӽ����� 
		// ������ �� ��� �̸� ��ȯ
		
		while(files.hasMoreElements()){
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);
			filename = URLEncoder.encode(filename);
			// ���� �̸��� �ѱ����� ���
			
			String original = multi.getOriginalFileName(name);
			// ���� ���� �̸� ���
			String type = multi.getContentType(name);
			File f = multi.getFile(name);
			
			out.println("�Ķ���� �̸�: " + name + "<br/>");
			out.println("���� ���� �̸�: " + original + "<br/>");
			out.println("����� ���� �̸�: " + filename + "<br/>");
			out.println("���� Ÿ��: " + type + "<br/>");
			
			if(f != null){
				out.println("ũ��: " + f.length() + "bytes");
			}
		}
		
	}catch(IOException e){ 
		// MultipartRequest �����ڴ� IOException ����!
		// (���ε��� ������ ���� �ִ� ũ�⺸�� ũ�ų� 
				// �������� ���� �� ��������� ���)
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
	

%>