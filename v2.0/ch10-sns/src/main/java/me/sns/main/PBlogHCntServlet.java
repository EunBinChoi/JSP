package me.sns.main;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.java.beans.HeartReplyBean;
import me.sns.heartReply.HeartReplyMgr;

@WebServlet("/pBlogUpHCnt") // 웹 브라우저에서 사용되는 url 값으로 매핑
public class PBlogHCntServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PBlogMgr pMgr = new PBlogMgr();
		
		// 03_home.jsp 또는 05_guest.jsp에서 좋아요를 하고 싶은 포토포스트의 num값을 받음
		int num = Integer.parseInt(request.getParameter("num"));
		
		String id = null;
		if(session.getAttribute("idKey") != null) {
			id = (String)session.getAttribute("idKey");
		}
		else {
			id = request.getParameter("id");
		}
		
		
		HeartReplyMgr hMgr = new HeartReplyMgr();
		int hnumdbl = hMgr.getHnumDoubleClickHeartReply(num, id);
		System.out.println("isdblclick : " + hnumdbl);
		
		// 해당 게시물에 대해 하나의 사용자가 한번만 클릭 
		if(hnumdbl == -1) {
			// 매개변수 num으로 '좋아요' 카운트를 증가하는 메소드 호출
			pMgr.upHCnt(num);
			HeartReplyBean hbean = new HeartReplyBean();
			hbean.setNum(num);
			hbean.setId(id);
			hMgr.insertHeartReply(hbean);
		}	
		// 동일한 게시물에 대해 동일한 사용자가 중복 클릭
		else {
			// 매개변수 num으로 '좋아요' 카운트를 감소하는 메소드 호출
			pMgr.downHCnt(num);
			hMgr.deleteHeartReply(hnumdbl);	
		}
		
		
		// gid 요청을 유무로 03_home.jsp or 05_guest.jsp로 이동할 지 판단함
		String gid = request.getParameter("gid");
		System.out.println("gid : " + gid);
		System.out.println("id : " + id);
		System.out.println("num : " + num);
		System.out.println();
		System.out.println();
		System.out.println();
		
		// gid 요청이 없다면 03_home.jsp로 페이지를 이동함
		if(gid == null) response.sendRedirect("03_home.jsp");
		// gid 요청이 있다면 05_guest.jsp로 페이지로 이동함
		else response.sendRedirect("05_guest.jsp?gid="+gid);
	}
}