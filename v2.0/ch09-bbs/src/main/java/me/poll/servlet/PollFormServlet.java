package me.poll.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.poll.mgr.PollMgr;

/**
 * Servlet implementation class PollUpdateForm
 */
@WebServlet("/PollFormServlet")
public class PollFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PollFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String[] itemnum = request.getParameterValues("itemnum");
		PollMgr pMgr = new PollMgr();
		boolean flag = pMgr.updatePoll(num, itemnum);
		
		String msg = "투표가 등록되지 않습니다.";
		if (flag) {
			msg = "투표가 정상적으로 등록되었습니다.";
		}
		out.println("<script>" + "alert(" + msg  + ")" + "</script>");
		out.println("<script>" + "location.href=\"09_pollList.jsp?num=" + num + "\"" +"</script>");
	}

}
