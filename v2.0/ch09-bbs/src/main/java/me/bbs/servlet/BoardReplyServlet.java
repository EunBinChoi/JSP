package me.bbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.bbs.mgr.BoardMgr;
import me.java.beans.BoardBean;

/**
 * Servlet implementation class BoardReplyServlet
 */
@WebServlet("/BoardReplyServlet")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		BoardMgr bMgr = new BoardMgr();
		BoardBean reBean = new BoardBean();
		reBean.setName(request.getParameter("name"));
		reBean.setSubject(request.getParameter("subject"));
		reBean.setContent(request.getParameter("content"));
		reBean.setPos(Integer.parseInt(request.getParameter("pos"))); 
		reBean.setRef(Integer.parseInt(request.getParameter("ref"))); 
		reBean.setDepth(Integer.parseInt(request.getParameter("depth"))); 
		reBean.setPass(request.getParameter("pass"));
		reBean.setIp(request.getParameter("ip"));

		// 답변하고자 하는 게시물 이전에 있는 게시물의 상대적인 위치값을 수정
		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
		// 답변 게시물을 tblBoard 테이블에 저장
		bMgr.replyBoard(reBean);
		
		// 답변 게시물을 저장하고 있는 03_list.jsp로 현재 페이지 값 (nowPage) 전달
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("02_boardList.jsp?nowPage="+nowPage);
	}

}
