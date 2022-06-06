package me.jdbc.connectionPool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import me.java.beans.RegisterBean;

// DBCP 이용하는 방법
public class RegisterDBCP {

	private Connection conn = null; // DB connection 객체
	private Statement stmt = null; // sql문 작성 객체
	private ResultSet rs = null; // sql문 실행 결과 담는 객체
	private DBConnectionMgr pool = null; // DBCP 객체

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String tblName = "register";
		List<RegisterBean> registerBeanList = new RegisterDBCP().selectAll(tblName);
		System.out.println(registerBeanList); 
	}
	
	public RegisterDBCP() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<RegisterBean> selectAll(String tblName) {

		List<RegisterBean> registerBeanList = new ArrayList<>();
		RegisterBean registerBean = null;
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from " + tblName);

			if (rs != null) {
				while (rs.next()) { // select all (여러 개의 행이 있을 수 있음)
					registerBean = new RegisterBean();
					registerBean.setId(rs.getString("ID"));
					registerBean.setPwd(rs.getString("PWD"));
					registerBean.setName(rs.getString("NAME"));
					registerBean.setEmail(rs.getString("EMAIL"));
					registerBean.setPhone(rs.getString("PHONE"));

					registerBeanList.add(registerBean);
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, stmt, rs);
			// close()를 통해 객체 연결 해제하지 말고 커넥션 풀에 객체 반환 (재사용하기 위함)
		}
		return registerBeanList;
	}

	// select * from ? where id = ?
	public RegisterBean selectOne(String tblName, String id) {
		RegisterBean registerBean = null;
		try {
			pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
			conn = pool.getConnection(); // Oracle DB 연결

			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from " + tblName + " where id = '" + id + "'");

			if (rs != null) {
				while (rs.next()) { // primary key로 select 했으니 결과 원소는 1행
					registerBean = new RegisterBean();
					registerBean.setId(rs.getString("ID"));
					registerBean.setPwd(rs.getString("PWD"));
					registerBean.setName(rs.getString("NAME"));
					registerBean.setEmail(rs.getString("EMAIL"));
					registerBean.setPhone(rs.getString("PHONE"));
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, stmt, rs);
		}
		return registerBean;

	}
	
	// insert into ? values (bean.getId(), bean.getPw() .....) 
		public boolean insertOne(String tblName, RegisterBean bean) {
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				rs = stmt.executeQuery("insert into " + tblName + 
						" values ('" + bean.getId() + "', '" + bean.getPwd() + "', '" + 
									bean.getName() + "', '" + bean.getEmail() + "', '" +
									bean.getPhone() + "')");
				
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}
		
		// for loop +  insert into ? values (bean.getId(), bean.getPw() .....) 
		public boolean insertAll(String tblName, List<RegisterBean> beanList) {
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				
				for(RegisterBean bean : beanList) {
					rs = stmt.executeQuery("insert into " + tblName + 
							" values ('" + bean.getId() + "', '" + bean.getPwd() + "', '" + 
										bean.getName() + "', '" + bean.getEmail() + "', '" +
										bean.getPhone() + "')");
				}
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}
		
		// update ? set ? = ? where id = ?
		public boolean update(String tblName, String id, String attribute, String revisedData) {
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				stmt.executeQuery("update " + tblName + 
						" set " + attribute + " = " + "'" + revisedData + "'" +  " where id = '" + id + "'");
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}
		
		// delete from ? where id = ?
		public boolean deleteOne(String tblName, String id) {
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				rs = stmt.executeQuery("delete from " + tblName + 
						" where id= '" + id + "'");
				
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}
		
		// delete from ?
		public boolean deleteAll(String tblName) {
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				rs = stmt.executeQuery("delete from " + tblName);
				
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}

		// drop table ?
		public boolean dropTable(String tblName) {
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				rs = stmt.executeQuery("drop table " + tblName);
				
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}

		// for loop + create table ? (? ?)
		public boolean createTable(String tblName, List<String> columnNames, List<String> columnDatatypes) { 
			String sql = "create table " + tblName;
			
			try {
				pool = DBConnectionMgr.getInstance(); // DBCP 객체 얻음
				conn = pool.getConnection(); // Oracle DB 연결
				
				stmt = conn.createStatement();
				// insert into register values ();
				if(columnNames.size() != columnDatatypes.size()) return false;
				
				sql += " (";
				for(int i = 0; i < columnNames.size(); i++) {
					if(i == columnNames.size()-1) {
						sql += columnNames.get(i) + " " + columnDatatypes.get(i);
					}
					else {
						sql += columnNames.get(i) + " " + columnDatatypes.get(i) + ",";
					}
				}
				sql += " )";
				
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				
				return true;
			} catch(ClassNotFoundException e) { 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(conn, stmt, rs);
			}
			return false;
		}
	

}
