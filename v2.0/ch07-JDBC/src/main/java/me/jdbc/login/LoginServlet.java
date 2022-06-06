package me.jdbc.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.java.beans.RegisterBean;
import me.jdbc.connectionPool.*; // selectOne(tblName, id)


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
 
    // (String id, String pwd): 사용자가 로그인 시도시 입력한 값
    public boolean isMember(String id, String pwd) {
    	if(id == null || pwd == null) return false;
    	
    	RegisterBean registerBean = new RegisterDBCP().selectOne("register", id);
    	if(registerBean == null) {
    		// 사용자 입력 ID가 등록되지 않은 회원
    		return false;
    	}
    	else {
    		if(registerBean.getPwd() == null) return false;
    		if(!registerBean.getPwd().equals(pwd)) {
    			// 사용자 입력 ID는 있는데 사용자 입력 PWD 틀림
    			return false;
    		}
    	}
    	return true;
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
			response.sendRedirect("./02_index.jsp"); // main page로 이동
		}
		else { // 회원이 아닐 경우
			session.setAttribute("loginTries", "non-member");
			response.sendRedirect("./01_login.jsp"); // 로그인 시도 페이지로 다시 이동
		}
	}

}
