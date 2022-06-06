package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletExample
 */

/* Servlet
 * : SUN사 개발
 * : 동적 페이지 생성을 위해 만듦 (자바 기반)
 * 
 * 단점이 존재! (자바 기반이기 때문에 분업화 힘듦) => JSP (SUN사 개발)
 * 
 * (1) HttpServlet
 * : 서블릿을 만들 때 무조건 상속해야하는 필수 클래스
 * 
 * 	ServletExample <-- HttpServlet <-- GenericServlet
 * 
 * - 메소드
 * - init(): 서블릿 객체 생성
 * - destroy(): 서블릿 객체 메모리 해제
 * - service(HttpServletRequest request, HttpServletResponse response): 서블릿 요청이 들어오면 호출되는 메소드
 * - doGet(request, response): method="get" 호출되는 메소드
 * - doPost(request, response): method="post" 호출되는 메소드
 * 
 * (2) HttpServletRequest: getParameter(), getCookies()....
 * (3) HttpServletResponse: addCookies(), setContentType(), sendRedirect()....
 * (4) HttpSession: getId(), setMaxInactiveInterval(), invalidate() ....
 * */


// localhost:8000/ch05-servlet/ServletExample
@WebServlet("/ServletExample")
// URL 매핑
// WHY? 클래스 이름 노출되고 싶지 않거나 (보안상), 클래스 이름이 너무 길 때 가상의 이름을 만들어서 매핑
public class ServletExample extends HttpServlet {
	// 객체 직렬화 아이디 (지정하는 것을 권유하지만, 우리는 JVM에서 지정한 디폴트 값 사용할 것임!)
	// 객체               -------serialize----> 파일, 메모리, DB 서버 (+ serial ID)
	// 객체 (+ serial ID) <-----deserialize---- 파일, 메모리, DB 서버
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletExample() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	System.out.println("init()");
    }
    
    @Override
    public void destroy() {
    	System.out.println("destroy()");
    }
    
    ///////////////////////////////////////////////////////////
    
    // method에 상관없이 공통된 작업을 수행하는 메소드
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("service()");
    	
    	if(request.getMethod().equals("GET")) {
    		doGet(request, response);
    	}
    	else if(request.getMethod().equals("POST")) {
    		doPost(request, response);
    	}
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html; charset=UTF-8"); // 1
		request.setCharacterEncoding("UTF-8"); // 2
		
		String msg = request.getParameter("msg");
		//PrintWriter out = response.getWriter();
		
			
		// Q1. response 페이지를 html 파일로 만들기
		// Q2. response 페이지에 전달받은 msg에 한국어가 들어갈 경우에 오류 해결하기
		// Q3. init(), destroy() 언제 호출되는지 확인해보기
		// init(): 메모리 로드
		// destroy(): 메모리 해제 (gc) / 코드 수정
		
		// Q4. 
		// msg: "name:Sally, age:30"
		String[] msgSplit = msg.split(", ");
		// ["name:Sally", "age:30"]
		String name = msgSplit[0].split(":")[1]; // Sally
		String age  = msgSplit[1].split(":")[1]; // 30
		
		// cookie
		//response.addCookie(new Cookie("name", name));
		//response.addCookie(new Cookie("age", age));
		//response.sendRedirect("./02_get-response.jsp");
		
		// session (page session="true" (기본값))
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("age", age);
		response.sendRedirect("./02_get-response.jsp");
		
		// query string (header에 데이터가 노출된 상태로 전달)
		//response.sendRedirect("./02_get-response.jsp?name="+name+"&age="+age);
	
//////////////////////////////////////////////////////////////////////
		// 02_get-response.jsp로 옮김
//		out.println("<html>");
//		out.println("<body>");
//		out.println("<h1>Get Servlet Call</h1>");
//		out.println("<p>" + msg + "</p>");
////		System.out.println(msg);
//		out.println("</body>");
//		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		response.setContentType("text/html; charset=UTF-8"); // 1
		request.setCharacterEncoding("UTF-8"); // 2
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		// cookie
//		response.addCookie(new Cookie("id", id));
//		response.addCookie(new Cookie("pwd", pwd));
//		response.addCookie(new Cookie("email", email));
//		response.sendRedirect("./04_post-response.jsp");
		
		// session (page session="true" (기본값))
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		session.setAttribute("email", email);
		response.sendRedirect("./04_get-response.jsp");
		
		// query string
		//response.sendRedirect("./04_post-response.jsp?id="+id+"&pwd="+pwd+"&email="+email);
	}

}
