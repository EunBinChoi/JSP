package me.json.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;


/**
 * Servlet implementation class JSONServlet
 */
@WebServlet("/JSONServlet")
public class JSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JSONServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String isMember = request.getParameter("isMember");
		
		/*Map<String, String> map = new HashMap<>() {{
			put("name", name);
			put("age", age);
			put("isMember", isMember);
		}};*/
		
		Map<String, String> map = Map.of(
			"name", name,
			"age", age,
			"isMember", isMember
		);
		JSONObject requestObj = new JSONObject(map);
		
		HttpSession session = request.getSession();
		session.setAttribute("requestObj", requestObj);
		
		response.sendRedirect("02_jsonOutput.jsp");
	}

}
