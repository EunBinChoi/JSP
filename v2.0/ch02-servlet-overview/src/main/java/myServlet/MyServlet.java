package myServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */

/*
 * init(): 메모리 로드
 * service(): request에 대한 연결 / 서비스 작성
 * destroy(): 메모리 해제
 * 
 * */

// localhost:8000/ch02/MyServlet
// url 매핑 (Servlet URL --> Server)
//@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) 
    	throws IOException, ServletException {
    	
    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	
    	out.println("<html>");
    	out.println("<head>");
    	out.println("<meta charset=\"UTF-8\">");
    	out.println("<title>Insert title here</title>");
    	out.println("<body>");
    	Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = sdf.format(date);
		out.println("<h2>");
		out.println(dateStr);
		out.println("</h2>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
    }
}
