package me.poll.mgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.List;


import me.java.beans.*;
import me.jdbc.connectionPool.DBConnectionMgr;

// 투표 SQL 처리 파일
// DAO (DB Access Object)
public class PollMgr {

	private DBConnectionMgr pool;

	public PollMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from PollList";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}

	public boolean insertPoll(PollListBean plBean, PollItemBean piBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into PollList(num, question, sdate, edate, wdate, type, active)"
					+ " values(BOARD_SEQ.NEXTVAL, ?, ?, ?, sysdate, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, plBean.getQuestion());
			pstmt.setString(2, plBean.getSdate());
			pstmt.setString(3, plBean.getEdate());
			pstmt.setInt(4, plBean.getType());
			
			if(plBean.getSdate().compareTo(plBean.getEdate()) == -1)  pstmt.setInt(5, 1);
			else if(plBean.getSdate().compareTo(plBean.getEdate()) == 0) pstmt.setInt(5, 1);
			else pstmt.setInt(5, 0);
			
			int result = pstmt.executeUpdate();
			
			if (result == 1) {
				sql = "insert into pollItem values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				String item[] = piBean.getItem();
				int itemnum = getMaxNum();
				System.out.println("itemNum :" + itemnum);
				System.out.println("item.length :" + item.length);
				
				
				int j = 0;
				for (int i = 0; i < item.length; i++) {
					if (item[i] == null || item[i].equals("")) break;
					System.out.println("itemNum :" + itemnum);
					System.out.println("itemNum :" + itemnum);
					
					pstmt.setInt(1, itemnum);
					pstmt.setInt(2, i);
					pstmt.setString(3, item[i]);
					pstmt.setInt(4, 0);
					j = pstmt.executeUpdate();
				}
				if (j > 0) flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public List<PollListBean> getAllList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<PollListBean> list = new Vector<PollListBean>();
		try {
			con = pool.getConnection();
			sql = "select * from PollList order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PollListBean plBean = new PollListBean();
				plBean.setNum(rs.getInt("num"));
				plBean.setQuestion(rs.getString("question"));
				plBean.setSdate(rs.getString("sdate"));
				plBean.setEdate(rs.getString("edate"));
				list.add(plBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	public PollListBean getList(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		PollListBean plBean = new PollListBean();
		try {
			con = pool.getConnection();
			if (num == 0) sql = "select * from PollList order by num desc";
			else sql = "select * from PollList where num=" + num;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				plBean.setQuestion(rs.getString("question"));
				plBean.setType(rs.getInt("type"));
				plBean.setActive(rs.getInt("active"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return plBean;
	}

	public List<String> getItem(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<String> list = new Vector<String>();
		try {
			con = pool.getConnection();
			if (num == 0) 
				num = getMaxNum();
			sql = "select item from PollItem where listnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

	public boolean updatePoll(int num, String[] itemnum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update PollItem set cnt = cnt+1 where listnum=? and itemnum = ?";
			pstmt = con.prepareStatement(sql);
			if (num == 0) {
				num = getMaxNum();
				System.out.println(num);
			}
			for (int i = 0; i < itemnum.length; i++) {
				if (itemnum[i] == null || itemnum[i].equals("")) break;
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				System.out.println(Integer.parseInt(itemnum[i]));
				int j = pstmt.executeUpdate();
				if (j > 0) flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	public List<PollItemBean> getView(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<PollItemBean> vlist = new Vector<PollItemBean>();
		try {
			con = pool.getConnection();
			sql = "select item, cnt from PollItem where listnum=?";
			pstmt = con.prepareStatement(sql);
			if (num == 0)
				pstmt.setInt(1, getMaxNum());
			else
				pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PollItemBean piBean= new PollItemBean();
				String item[] = new String[1];
				item[0] = rs.getString(1);
				piBean.setItem(item);
				piBean.setCnt(rs.getInt(2));
				vlist.add(piBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public int sumCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			con = pool.getConnection();
			sql = "select sum(cnt) from PollItem where listnum=?";
			pstmt = con.prepareStatement(sql);
			if (num == 0) pstmt.setInt(1, getMaxNum());
			else pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return count;
	}
}