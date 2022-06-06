package me.jdbc.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.jdbc.connectionPool.RegisterDBCP;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public boolean deleteMember(String id) {
    	return new RegisterDBCP().deleteOne("register", id);
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("idKey");
		
		String agreement = request.getParameter("agree");
		if(agreement != null) {
			if(agreement.equals("yes") && deleteMember(id)) {
				session.setAttribute("loginTries", "del-member");
				response.sendRedirect("./01_login.jsp");
			}
		}
		
		else {
			response.sendRedirect("./01_login.jsp");
		}
	
	}

	

}
