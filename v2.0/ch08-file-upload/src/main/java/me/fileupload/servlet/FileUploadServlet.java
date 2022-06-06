package me.fileupload.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileViewServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.removeAttribute("uploadText");
		session.removeAttribute("uploadImage");
		
		
		PrintWriter out = response.getWriter();
		String jspWorkSpace 
		= "D:\\GoottAcademy-2\\jsp-workspace\\ch08-file-upload\\src\\main\\webapp";
		String saveFolder 
		= "upload";
		
		String encType = "UTF-8";
		int maxSize = 5 * 1024 * 1024; // 5mb (업로드할 파일 최대 크기)
		
		
		// window: \
		// unix: /
		try {
			MultipartRequest multi 
			= new MultipartRequest(request, 
					jspWorkSpace + System.getProperty("file.separator") + saveFolder, maxSize, encType,
					new DefaultFileRenamePolicy()); // a.txt, a1.txt, a2.txt
			// jspWorkSpace + System.getProperty("file.separator") + saveFolder 저장
					
			// type="file"이 아닌 input 요소의 값만 가지고 옴
			Enumeration<?> params = multi.getParameterNames(); 
			while(params.hasMoreElements()) {
				String name = (String)params.nextElement();
				String value = multi.getParameter(name);

				System.out.println(name + " : " + value);
				out.println(name + " : " + value + "<br/>");
			}
			
			//////////////////////////////////////////////////////////////////
			////////////////// 입력된 파일의 개수가 하나일 경우 /////////////////////
			/////////////////////////////////////////////////////////////////
			// type="file"인 input 요소 값 가지고 옴
			Enumeration<?> files =  multi.getFileNames();
			if(files.hasMoreElements()) {
				//fileCnt++;
				//out.println(fileCnt);
				
				String name = (String)files.nextElement();
				String filename = multi.getFilesystemName(name); 
				// 서버에 저장된 file 이름 반환
				// 만약에 중복된 이름이 서버에 저장이 되어있을 경우에는 DefaultFileRenamePolicy에 의해
				// 변경된 파일 이름 반환
				
				
				String original = multi.getOriginalFileName(name);
				// 실제 file 이름 반환
				// 만약에 중복된 이름이 서버에 저장이 되어있을 경우에는 DefaultFileRenamePolicy에 의해
				// 변경되기 전의 원래 파일 이름 반환
				
				String type = multi.getContentType(name);
				// 파일 타입 반환
				
				System.out.println(filename + " : " + original);
				
				
				//////////////////////////////////////////////////////////////////
				//out.println(filename);
				//out.println("<h2>" + name + " values </h2>");
				//out.println("filename : " + filename + "<br/>");
				//out.println("original filename : " + original + "<br/>");
				//out.println("type : " + type + "<br/>");
				//////////////////////////////////////////////////////////////////
				
				if(type.equals("text/plain")){
					// file 내용물 반환 (파일 내용물이 텍스트/이미지)
					 session.setAttribute("uploadText", 
							 "." + System.getProperty("file.separator") + saveFolder + 
							 System.getProperty("file.separator") + filename);
				}
				else if(type.equals("image/png") || type.equals("image/jpeg") || type.equals("image/gif")){
					// file 내용물 반환 (파일 내용물이 텍스트/이미지)
					 session.setAttribute("uploadImage", 					 
							 "." + System.getProperty("file.separator") + saveFolder + 
							 System.getProperty("file.separator")  + filename);

				}
				response.sendRedirect("./02_viewPage.jsp");
			} // if문의  끝
			
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
