package me.ajax.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import me.java.beans.Users;

/**
 * Servlet implementation class UsersSearchServlet
 */
@WebServlet("/UsersSearchServlet")
public class UsersSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    // ajax ==> ./UsersSearchServlet?userName=keyword
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String keyword = request.getParameter("userName");
		response.getWriter().write(getJSON(keyword));
		// getJSON(keyword): 검색된 키워드로 DB에 검색된 결과를 JSONString으로 가짐
		// response.getWriter().write(): 현재 뷰 (index.jsp)에 씀
	}	
	
	@SuppressWarnings("unchecked")
	public String getJSON(String keyword) {
		if(keyword == null) keyword = ""; 
		// select * from users where userName like %""%
		// => select * from users (DB에는 무조건 varchar(20) not null)
		
		UsersMgr umgr = new UsersMgr();
		//System.out.println(keyword);
		List<Users> list = umgr.search(keyword);
	
		/*
		 *  4명 검색 가정
		 *	[ 
		 *	  {"userName":"value", "userAge":"value", "userGender":"value", "userEmail":"value" }, 
		 *	  {"userName":"value", "userAge":"value", "userGender":"value", "userEmail":"value"}, 
		 *	  {"userName":"value", "userAge":"value", "userGender":"value", "userEmail":"value"}, 
		 *	  {"userName":"value", "userAge":"value", "userGender":"value", "userEmail":"value"} 
		 *	] 
		 * 
		 * */
		JSONArray jsonArray = new JSONArray(); // JSONObject ArrayList
		for(int i = 0; i < list.size(); i ++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userName",   list.get(i).getUserName());
			map.put("userAge",    list.get(i).getUserAge());
			map.put("userGender", list.get(i).getUserGender());
			map.put("userEmail",  list.get(i).getUserEmail());

			JSONObject jsonObject = new JSONObject(map);
			jsonArray.add(jsonObject);
		}
		return jsonArray.toJSONString();
	}

}
