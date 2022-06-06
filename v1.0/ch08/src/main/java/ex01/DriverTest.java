package ex01;

import java.sql.*;

public class DriverTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		try {
			Class.forName(driver); 
			// 1
			System.out.println("jdbc driver �ε� ����!");
			
			DriverManager.getConnection(url, user, password); 
			// 2
			// DB ������ ���� �õ�
			System.out.println("����Ŭ ���� ����!");
		} catch(ClassNotFoundException e) { // 1
			System.out.println("jdbc driver �ε� ����!");
		} catch(SQLException e) {
			System.out.println("����Ŭ ���� ����!");
		}
		
	}

}
