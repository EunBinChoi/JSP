package me.sns.heartReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import me.java.beans.HeartReplyBean;
import me.jdbc.connectionPool.DBConnectionMgr;

public class HeartReplyMgr {
private DBConnectionMgr pool;
	
	public HeartReplyMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Heart Insert
	// 댓글을 입력하는 메소드
	public void insertHeartReply(HeartReplyBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			
			// 03_home.jsp 및 05_guest.jsp에서 요청한 댓글을 저장하는 sql문
			sql = "insert into tblHeartReply (hnum, num, id, hdate) "
					+ "values (tblHeartReply_SEQ.nextval, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// Heart Delete
	// 댓글을 삭제하는 메소드
	public void deleteHeartReply(int hnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			
			// 03_home.jsp 및 05_guest.jsp에서 요청한 댓글을 삭제하는 sql문
			sql = "delete from tblHeartReply where hnum=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, hnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// Heart All Delete
	// 포토포스트의 관련된 댓글을 모두 삭제하는 메소드
	public void deleteAllHeartReply(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			
			// PBlogMgr.java에서 포토포스트 삭제시 관련된 모든 댓글 삭제하는 sql문
			sql = "delete from tblHeartReply where num=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// Heart List
	// 댓글 메소드
	public Vector<HeartReplyBean> listHeartReply(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<HeartReplyBean> heartReplyList = new Vector<HeartReplyBean>();
		try {
			con = pool.getConnection();
			
			// 조건에 맞는 댓글 리스트를 가져오는 sql문
			sql = "select * from tblHeartReply where num=? order by hnum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HeartReplyBean bean = new HeartReplyBean();
				bean.setHnum(rs.getInt(1));
				bean.setNum(rs.getInt(2));
				bean.setId(rs.getString(3));
				bean.setHdate(rs.getString(4));
				heartReplyList.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return heartReplyList;
	}
	
	public int getHnumDoubleClickHeartReply(int num, String id) {
		Vector<HeartReplyBean> vhlist = listHeartReply(num);
		
		if(vhlist.size() == 0) return -1;
		for(HeartReplyBean bean : vhlist) {
			if(bean.getId() != null && id != null) { 
				if(bean.getId().equals(id)) {
					return bean.getHnum(); // heart reply primary key
				}
			}
		}
		return -1;
	}
}
