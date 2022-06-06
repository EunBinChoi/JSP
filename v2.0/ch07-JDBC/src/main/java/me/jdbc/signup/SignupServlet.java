package me.jdbc.signup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.java.beans.RegisterBean;
import me.jdbc.connectionPool.RegisterDBCP;


/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public boolean insertMember(RegisterBean registerBean) {
    	return new RegisterDBCP().insertOne("register", registerBean);
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RegisterBean registerBean = new RegisterBean();

		registerBean.setId(request.getParameter("id"));
		registerBean.setPwd(request.getParameter("pwd"));
		registerBean.setName(request.getParameter("name"));
		registerBean.setEmail(request.getParameter("email"));
		registerBean.setPhone(request.getParameter("phone"));
		
		
		if(insertMember(registerBean)) {
			HttpSession session = request.getSession();
			session.setAttribute("idKey", registerBean.getId());
			response.sendRedirect("./02_index.jsp");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("signupTries", "duplicate");
			response.sendRedirect("./05_signup.jsp");
		}
		
	}

}
