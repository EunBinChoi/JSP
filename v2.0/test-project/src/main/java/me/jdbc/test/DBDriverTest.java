package me.jdbc.test;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDriverTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		try {
			Class.forName(driver); // JDBC 드라이버 객체 생성
			System.out.println("... JDBC Driver 로딩 성공!");
			
			DriverManager.getConnection(url, user, password); // JDBC 드라이버를 통해 DB 연결  
			System.out.println("... 오라클 DB 연결 성공!");
		} catch(ClassNotFoundException e) { 
			System.out.println("[ClassNotFoundException] JDBC Driver 로딩 실패!");
		} catch(SQLException e) {
			System.out.println("[SQLException] 오라클 DB 연결 실패!");
		} catch(Exception e) {
			System.out.println("[Exception] 예외 발생!");
		}
	}

}
