package me.jdbc.beans;
import java.sql.*;
import java.util.Vector;

import me.jdbc.beans.*;

public class RegisterDBMgr {
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "scott";
	private final String password = "tiger";

	// 생성자
	// jdbc 드라이버 로딩
	public RegisterDBMgr() {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			System.out.println("[ERROR] JDBC 드라이버 로딩 실패!");
		}
	}

	// DB 연결 생성
	// 사용자 데이터 저장 (ArrayList<RegisterBean>)
	public Vector<RegisterBeans> getRegisterList() {

		Connection conn = null; // DB 연결 객체
		Statement stmt = null; // sql문 작성 객체
		ResultSet rs = null; // sql문 실행 결과 담는 객체
		Vector<RegisterBeans> registerList = new Vector<RegisterBeans>();

		try {
			conn = DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결
			stmt = conn.createStatement(); // sql문 작성 객체 생성
			rs = stmt.executeQuery("SELECT * FROM REGISTER"); // 질의문 실행

			if (rs != null) {
				while (rs.next()) { // 다음 레코드 유무 반환 (true/false)
					// bean 생성
					RegisterBeans registerBeans = new RegisterBeans();

					// bean 속성값 set
					registerBeans.setId(rs.getString("id"));
					// rs.getString(): 컬럼이름 통해 데이터 반환
					// registerBeans.setId(): 데이터를 bean 값으로 설정
					registerBeans.setPwd(rs.getString("pwd"));
					registerBeans.setName(rs.getString("name"));
					registerBeans.setEmail(rs.getString("email"));
					registerBeans.setPhone(rs.getString("phone"));
					registerList.add(registerBeans);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				try { rs.close();} 
				catch (Exception e) { e.printStackTrace(); }
			}
			if (stmt != null) {
				try { stmt.close();} 
				catch (Exception e) { e.printStackTrace(); }
			}
			if (conn != null) {
				try { conn.close(); } 
				catch (Exception e) { e.printStackTrace(); }
			}
		}
		return registerList; // 결과 반환
	}
}
