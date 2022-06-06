package me.ajax.servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import me.java.beans.Users;
import me.jdbc.connectionPool.DBConnectionMgr;

// DB랑 연동해서 쿼리를 날리는 함수가 정의된 클래스
// 테이블 이름 + Mgr: DAO (DB Access Object)
public class UsersMgr {
	private DBConnectionMgr pool = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public UsersMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	// search(String name)
	public List<Users> search(String keyword) { // 이름으로 검색
		String SQL = "select * from users where userName like ?";
		List<Users> usersList = new ArrayList<Users>();
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Users users = new Users();
				users.setUserName(rs.getString("userName"));
				users.setUserAge(rs.getInt("userAge"));
				users.setUserGender(rs.getString("userGender"));
				users.setUserEmail(rs.getString("userEmail"));
				usersList.add(users);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return usersList;
	}
	
	
	// register(Users user)
	public int register(Users user) {
		String SQL = "insert into users values (?, ?, ?, ?)";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setInt(2, user.getUserAge());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate(); 
			// 정상적으로 실행될 경우에는 추가된 행 개수를 반환 (1개)
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return -1; // 오류
	}
}
