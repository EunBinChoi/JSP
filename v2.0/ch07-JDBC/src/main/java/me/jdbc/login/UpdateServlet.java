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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public boolean updateMember(String id, String attribute, String revisedDate) {
    	return new RegisterDBCP().update("register", id, attribute, revisedDate);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("idKey");

		if(updateMember(id, "pwd", request.getParameter("newpwd")) &&
			updateMember(id, "name", request.getParameter("name")) &&
			updateMember(id, "email", request.getParameter("email")) &&
			updateMember(id, "phone", request.getParameter("phone"))) {
			response.sendRedirect("./02_index.jsp");
		}
	}

}
