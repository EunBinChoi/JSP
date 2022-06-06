package me.ajax.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.java.beans.Users;

/**
 * Servlet implementation class UsersRegisterServlet
 */
@WebServlet("/UsersRegisterServlet")
public class UsersRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    // ./UsersRegisterServlet?userName=?&userAge=?&userGender=?&userEmail=?
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		response.getWriter().write(
				register(userName, userAge, userGender, userEmail) + "");
		// register(): insert 정상적으로 되면 1, 오류 -1 반환
		// response.getWriter().write(): 현재 뷰 (index.jsp)에 씀
    }
	
    public int register(String userName, String userAge,
    					String userGender, String userEmail) {
    	Users user = new Users();
    	UsersMgr umgr = new UsersMgr();
    	try {	
	    	user.setUserName(userName);
	    	user.setUserAge(Integer.parseInt(userAge));
	    	user.setUserGender(userGender);
	    	user.setUserEmail(userEmail);
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return umgr.register(user); // 1 (정상적으로 등록), -1 (오류)
    }

}
