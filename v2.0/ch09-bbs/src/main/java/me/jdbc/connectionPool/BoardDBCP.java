package me.jdbc.connectionPool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.List;

import me.java.beans.BoardBean;

public class BoardDBCP {

	private static Connection conn = null; // DB connection 객체
	private static Statement stmt = null; // sql문 작성 객체
	private static ResultSet rs = null; // sql문 실행 결과 담는 객체
	private static DBConnectionMgr pool = null; // DBCP 객체

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String tblName = "board";

		////////////////////////// select ///////////////////////////////////
		// select one
//		int inputPrimaryKey = 1;
//		BoardBean boardBean = selectOne(tblName, inputPrimaryKey);
//		
//		if(boardBean != null) {
//			System.out.println(boardBean);
//		}
//		else {
//			System.out.println("can not select by " +  
//								inputPrimaryKey + " from " + tblName);
//		}

		
		// select all
//		List<BoardBean> boardBeanList = selectAll(tblName);
//		for(int i = 0; i < boardBeanList.size(); i++) {
//			System.out.println(boardBeanList.get(i));
//		}

		////////////////////////// dml ///////////////////////////////////

		// insert one (without num)
		// num: BOARD_SEQ.NEXTVAL
		for(int i = 21; i <= 200; i ++) {
			String str = i + "";
			 insertOne(tblName, new BoardBean(str, str, str, 
					 i, i, i, "", str, str, i, str, i));
		}

		// insert all
//		List<BoardBean> boardBeanList = new Vector<>();
//		boardBeanList.add(new BoardBean(4, "", "", "", 
//				 1, 1, 1, "", "", "", 1, "", 1));
//		boardBeanList.add(new BoardBean(5, "", "", "", 
//				 1, 1, 1, "", "", "", 1, "", 1));
//		boardBeanList.add(new BoardBean(6, "", "", "", 
//				 1, 1, 1, "", "", "", 1, "", 1));
//		insertAll(tblName, boardBeanList);

		// update
//		int inputPrimaryKey = 1;
//		String attribute = "name";
//		String revisedData = "1111111111";
//		update(tblName, inputPrimaryKey, attribute, revisedData);
//		
		// delete one
//		int inputPrimaryKey = 1;
//		deleteOne(tblName, inputPrimaryKey);

		// delete all
//		 deleteAll(tblName);

		
		
		// 필요 없음
		////////////////////////// ddl ///////////////////////////////////
		// drop table
		// dropTable(tblName);

		// create table
//		List<String> columnNames = new Vector<>();
//		columnNames.add("id");
//		columnNames.add("pwd");
//		columnNames.add("name");
//		columnNames.add("email");
//		columnNames.add("phone");
//		
//		List<String> columnDatatypes = new Vector<>();
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		
//		createTable(tblName, columnNames, columnDatatypes);
	}

	public static List<BoardBean> selectAll(String tblName) {

		List<BoardBean> boardBeanList = new Vector<>();
		BoardBean boardBean = null;
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from " + tblName);

			if (rs != null) {
				while (rs.next()) { // select all (여러 개의 행이 있을 수 있음)
					boardBean = new BoardBean(
							rs.getInt("NUM"), rs.getString("NAME"), rs.getString("SUBJECT"),
							rs.getString("CONTENT"), rs.getInt("POS"), rs.getInt("REF"), rs.getInt("DEPTH"),
							rs.getString("REGDATE"), rs.getString("PASS"), rs.getString("IP"), rs.getInt("COUNT"),
							rs.getString("FILENAME"), rs.getInt("FILESIZE"));
					boardBeanList.add(boardBean);
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
			// close()를 통해 객체 연결 해제하지 말고 커넥션 풀에 객체 반환 (재사용하기 위함)
		}
		return boardBeanList;
	}

	public static BoardBean selectOne(String tblName, int primaryKey) {
		BoardBean boardBean = null;
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from " + tblName + " where num = '" + primaryKey + "'");

			if (rs != null) {
				while (rs.next()) { // primary key로 select 했으니 결과 원소는 1행
					boardBean = new BoardBean(
							rs.getInt("NUM"), rs.getString("NAME"), rs.getString("SUBJECT"),
							rs.getString("CONTENT"), rs.getInt("POS"), rs.getInt("REF"), rs.getInt("DEPTH"),
							rs.getString("REGDATE"), rs.getString("PASS"), rs.getString("IP"), rs.getInt("COUNT"),
							rs.getString("FILENAME"), rs.getInt("FILESIZE"));
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return boardBean;

	}

	// insert into ? values (bean.getId(), bean.getPw() .....)
	public static boolean insertOne(String tblName, BoardBean bean) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			rs = stmt.executeQuery("insert into " + tblName + " values (BOARD_SEQ.NEXTVAL, " + "'" + bean.getName()
					+ "', '" + bean.getSubject() + "', '" + bean.getContent() + "', '" + bean.getPos() + "', '"
					+ bean.getRef() + "', '" + bean.getDepth() + "', '" + bean.getRegDate() + "', '" + bean.getPass()
					+ "', '" + bean.getIp() + "', '" + bean.getCount() + "', '" + bean.getFileName() + "', '"
					+ bean.getFileSize() + "')");

			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}

	// for loop + insert into ? values (bean.getId(), bean.getPw() .....)
	public static boolean insertAll(String tblName, List<BoardBean> beanList) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();

			for (BoardBean bean : beanList) {
				rs = stmt.executeQuery("insert into " + tblName + " values (BOARD_SEQ.NEXTVAL, " + "'" + bean.getName()
						+ "', '" + bean.getSubject() + "', '" + bean.getContent() + "', '" + bean.getPos() + "', '"
						+ bean.getRef() + "', '" + bean.getDepth() + "', '" + bean.getRegDate() + "', '" + bean.getPass()
						+ "', '" + bean.getIp() + "', '" + bean.getCount() + "', '" + bean.getFileName() + "', '"
						+ bean.getFileSize() + "')");
			}
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}

	public static boolean update(String tblName, int primaryKey, String attribute, String revisedData) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			stmt.executeQuery("update " + tblName + " set " + attribute + " = " + "'" + revisedData + "'"
					+ " where num = '" + primaryKey + "'");
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}
	
	public static boolean update(String tblName, int primaryKey, String attribute, int revisedData) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			stmt.executeQuery("update " + tblName + " set " + attribute + " = " + "'" + revisedData + "'"
					+ " where num = '" + primaryKey + "'");
			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}


	public static boolean deleteOne(String tblName, int primaryKey) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			rs = stmt.executeQuery("delete from " + tblName + " where num= '" + primaryKey + "'");

			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}

	// delete from ?
	public static boolean deleteAll(String tblName) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			rs = stmt.executeQuery("delete from " + tblName);

			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}

	// drop table ?
	public static boolean dropTable(String tblName) {
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			rs = stmt.executeQuery("drop table " + tblName);

			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}

	// for loop + create table ? (? ?)
	public static boolean createTable(String tblName, List<String> columnNames, List<String> columnDatatypes) {
		String sql = "create table " + tblName;

		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			// insert into board values ();
			if (columnNames.size() != columnDatatypes.size())
				return false;

			sql += " (";
			for (int i = 0; i < columnNames.size(); i++) {
				if (i == columnNames.size() - 1) {
					sql += columnNames.get(i) + " " + columnDatatypes.get(i);
				} else {
					sql += columnNames.get(i) + " " + columnDatatypes.get(i) + ",";
				}
			}
			sql += " )";

			System.out.println(sql);
			rs = stmt.executeQuery(sql);

			return true;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn);
		}
		return false;
	}

}
