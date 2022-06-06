package me.jdbc.register;

import me.java.beans.*;

import java.sql.*;
import java.util.*;

// DBCP 이용하지 않는 방법
public class RegisterTableTest {
	
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "scott";
	private final String password = "tiger";
	
	private Connection conn = null; // DB connection 객체 
	private Statement stmt = null;  // sql문 작성 객체
	private ResultSet rs = null;    // sql문 실행 결과 담는 객체

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String tblName = "register";
		
		////////////////////////// select ///////////////////////////////////
		// select one
//		String inputPrimaryKey = "a";
//		RegisterBean registerBean = new RegisterTableTest().selectOne(tblName, inputPrimaryKey);
//		
//		if(registerBean != null) {
//			System.out.println(registerBean);
//		}
//		else {
//			System.out.println("can not select by " +  
//								inputPrimaryKey + " from " + tblName);
//		}
		
		// select all
//		List<RegisterBean> registerBeanList = new RegisterTableTest().selectAll(tblName);
//		for(int i = 0; i < registerBeanList.size(); i++) {
//			System.out.println(registerBeanList.get(i));
//		}
		
		
		////////////////////////// dml ///////////////////////////////////
		
		// insert one
		//insertOne(tblName, new RegisterBean("d", "d", "d", "d@naver.com", "010-0000-0000"));
		
		// insert all
//		List<RegisterBean> registerBeanList = new ArrayList<>();
//		registerBeanList.add(new RegisterBean("e", "e", "e", "e@naver.com", "010-0000-0000"));
//		registerBeanList.add(new RegisterBean("f", "f", "f", "f@naver.com", "010-0000-0000"));
//		registerBeanList.add(new RegisterBean("g", "g", "g", "g@naver.com", "010-0000-0000"));
//		new RegisterTableTest().insertAll(tblName, registerBeanList);
		
		// update
//		String inputPrimaryKey = "a";
//		String attribute = "pwd";
//		String revisedData = "aaaAAAaaaaaaaaaaaa";
//		new RegisterTableTest().update(tblName, inputPrimaryKey, attribute, revisedData);
//		
		// delete one
//		String inputPrimaryKey = "a";
//		new RegisterTableTest().deleteOne(tblName, inputPrimaryKey);
		
		// delete all
//		new RegisterTableTest().deleteAll(tblName);
		
		////////////////////////// ddl ///////////////////////////////////
		// drop table
//		new RegisterTableTest().dropTable(tblName);
		
		
		// create table
//		List<String> columnNames = new ArrayList<>();
//		columnNames.add("id");
//		columnNames.add("pwd");
//		columnNames.add("name");
//		columnNames.add("email");
//		columnNames.add("phone");

//		List<String> columnDatatypes = new ArrayList<>();
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		columnDatatypes.add("varchar(20)");
//		
//		new RegisterTableTest().createTable(tblName, columnNames, columnDatatypes);
	}
	
	/*
	 * 자바의 질의문 실행 함수 (java.sql package)
	 * 
	 * ResultSet executeQuery()
	 * : 보통 select
	 * : WHY? select은 반환 테이블 존재
	 * 
	 * int executeUpdate()
	 * : 보통 ddl, dml
	 * : dml (insert, update, delete): 영향 받는 행의 갯수 반환
	 * : ddl (create, drop): 반환 값이 없음 (0)
	 * 
	 * boolean execute(): 보통 실행 결과가 다수 행일 때
	 * : true - 결과가 ResultSet
	 * : false - 결과가 없는 경우
	 * 
	 * */
	
	// select * from ? 
	public List<RegisterBean> selectAll(String tblName) {
		List<RegisterBean> registerBeanList = new ArrayList<>();
		RegisterBean registerBean = null;
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from " + tblName);
			
			if(rs != null) {
				while(rs.next()) { // select all (여러 개의 행이 있을 수 있음)
					registerBean = new RegisterBean();
					registerBean.setId(rs.getString("ID"));
					registerBean.setPwd(rs.getString("PWD"));
					registerBean.setName(rs.getString("NAME"));
					registerBean.setEmail(rs.getString("EMAIL"));
					registerBean.setPhone(rs.getString("PHONE"));
					
					registerBeanList.add(registerBean);
				}
			}
		} catch(ClassNotFoundException e) { 
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return registerBeanList;
	}
	
	// select * from ? where id = ?
	public RegisterBean selectOne(String tblName, String id) { 
		RegisterBean registerBean = null;
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from " + tblName +" where id = '" + id + "'");
			
			if(rs != null) {
				while(rs.next()) { // primary key로 select 했으니 결과 원소는 1행
					registerBean = new RegisterBean();
					registerBean.setId(rs.getString("ID"));
					registerBean.setPwd(rs.getString("PWD"));
					registerBean.setName(rs.getString("NAME"));
					registerBean.setEmail(rs.getString("EMAIL"));
					registerBean.setPhone(rs.getString("PHONE"));
				}
			}
		} catch(ClassNotFoundException e) { 
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return registerBean;
		
	}
	
	// insert into ? values (bean.getId(), bean.getPw() .....) 
	public boolean insertOne(String tblName, RegisterBean bean) {
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}
	
	// for loop +  insert into ? values (bean.getId(), bean.getPw() .....) 
	public boolean insertAll(String tblName, List<RegisterBean> beanList) {
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}
	
	// update ? set ? = ? where id = ?
	public boolean update(String tblName, String id, String attribute, String revisedData) {
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}
	
	// delete from ? where id = ?
	public boolean deleteOne(String tblName, String id) {
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}
	
	// delete from ?
	public boolean deleteAll(String tblName) {
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}

	// drop table ?
	public boolean dropTable(String tblName) {
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}

	// for loop + create table ? (? ?)
	public boolean createTable(String tblName, List<String> columnNames, List<String> columnDatatypes) { 
		String sql = "create table " + tblName;
		
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
			
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
			if(rs != null) {
				try { rs.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(stmt != null) {
				try { stmt.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
			if(conn != null) {
				try { conn.close(); } 
				catch(Exception e) { e.printStackTrace(); }
			}
		}
		return false;
	}

}
