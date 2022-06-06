package me.servlet.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// DB
	private static HashMap<String, Member> hashMap = new HashMap<>();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// primary key: 1, 2, 3
    	// primary key를 통해 각 Member 객체 접근 가능
    	hashMap.put("1", new Member("a", "a", "a", "a@naver.com", "010-0000-0000"));
    	hashMap.put("2", new Member("b", "b", "b", "b@naver.com", "010-0000-0000"));
    	hashMap.put("3", new Member("c", "c", "c", "c@naver.com", "010-0000-0000"));
    }
    
    // (String id, String pwd): 사용자가 로그인 시도시 입력한 값
    public boolean isMember(String id, String pwd) {
    	Iterator<String> iterator = hashMap.keySet().iterator();
    	while(iterator.hasNext()) {
    		String hashMapKey = iterator.next(); // "1", "2", "3"
    		Member hashMepValue = hashMap.get(hashMapKey); 
    		
    		String memberId = hashMepValue.getId();
    		String memberPwd = hashMepValue.getPwd();
    		if(memberId.equals(id) && memberPwd.equals(pwd)) return true;	
    	}
    	return false;
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String inputId = request.getParameter("id");
		String inputPwd = request.getParameter("pwd");
		boolean isMem = isMember(inputId, inputPwd);
		//PrintWriter out = response.getWriter();
		//out.println(isMem);
		
		HttpSession session = request.getSession();
		if(isMem) { // 회원일 경우
			session.setAttribute("idKey", inputId);
			session.setAttribute("loginTries", "member");
			//session.setMaxInactiveInterval(5); // 5 seconds
			response.sendRedirect("./06_index.jsp"); // main page로 이동
		}
		else { // 회원이 아닐 경우
			session.setAttribute("loginTries", "non-member");
			response.sendRedirect("./05_login.jsp"); // 로그인 시도 페이지로 다시 이동
		}
	}

}
