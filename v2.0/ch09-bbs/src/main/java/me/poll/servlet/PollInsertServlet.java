package me.poll.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.java.beans.PollItemBean;
import me.java.beans.PollListBean;
import me.poll.mgr.PollMgr;

/**
 * Servlet implementation class PollInsertServlet
 */
@WebServlet("/PollInsertServlet")
public class PollInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PollInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PollMgr pMgr = new PollMgr();
		PollListBean plBean = new PollListBean();
		if (request.getParameter("question") != null) {
			plBean.setQuestion(request.getParameter("question"));
		}
		if (request.getParameter("type") != null) {
			plBean.setType(Integer.parseInt(request.getParameter("type")));
		}

		String sdate = request.getParameter("sdateY") + "-" 
					+ request.getParameter("sdateM") + "-"
					+ request.getParameter("sdateD");
		String edate = request.getParameter("edateY") + "-" 
					+ request.getParameter("edateM") + "-"
					+ request.getParameter("edateD");
		plBean.setSdate(sdate);
		plBean.setEdate(edate);
		
		
		PollItemBean piBean = new PollItemBean();
		Enumeration<String> attributeNames = request.getParameterNames();
		int cnt = 0;
		while(attributeNames.hasMoreElements()) {
			String key = attributeNames.nextElement();
			String value = request.getParameter(key);
			
			out.println(key + " : " + value + "<br/>");
			System.out.println(key + " : " + value);
			if(key.equals("item"+(cnt+1))) {
				if(value != null) {
					if(!value.equals("")) {
						cnt ++;
					}
				}
			}
		}
		System.out.println(cnt);
		String[] items = new String[cnt];
		
		for(int i = 0; i < cnt; i++) {
			if (request.getParameter("item"+(i+1)) != null) {
				items[i] = request.getParameter("item"+(i+1));
			}
		}
		piBean.setItem(items);
		
		
		boolean flag = pMgr.insertPoll(plBean, piBean);
		String msg = "\"Survey Insert Fail.\"";
		String url = "./11_pollInsert.jsp";
		
		if (flag) {
			msg = "\"Survey Insert Success!\"";
			url = "./09_pollList.jsp";
		}
		
		out.println("<script>" + "alert(" + msg  + ")" + "</script>");
		out.println("<script>" + "location.href=\"" + url + "\"" +"</script>");
	}

}
