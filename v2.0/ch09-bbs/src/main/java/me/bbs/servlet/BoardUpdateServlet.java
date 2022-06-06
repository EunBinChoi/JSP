package me.bbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.bbs.mgr.BoardMgr;
import me.java.beans.BoardBean;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/BoardUpdateServlet")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
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

		// 요청 객체 (request)에서 세션 객체 리턴
		HttpSession session = request.getSession();
		// 브라우저 출력을 위해 출력 객체를 응답 객체에서 리턴
		PrintWriter out = response.getWriter(); 
		
		BoardMgr bMgr = new BoardMgr();
		// 05_read.jsp에서 현재 읽은 게시물을 세션에 저장했던 게시물 반환
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		// 08_update.jsp에서 넘긴 값을 nowPage 문자열 변수로 받음
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		// 정수형 타입이므로 정수로 변환해서 빈즈 저장
		
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setIp(request.getParameter("ip"));

		String upPass = upBean.getPass(); // 08_update.jsp에서 입력한 비밀번호
		String inPass = bean.getPass(); // 세션에 저장되어있는 비밀번호

		if (upPass.equals(inPass)) { // 비밀번호 같으면 수정 가능
			bMgr.updateBoard(upBean);
			String url = "04_boardRead.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else { // 비밀번호 다르면 수정 불가
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 틀렸습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
