package ex01;

import java.sql.*;
import java.util.ArrayList;
import ex01.RegisterBean;

public class RegisterMgrPool {
	private DBConnectionMgr pool = null;
	
	// ������
	// jdbc ����̹� �ε�
	public RegisterMgrPool() {
		try {
			pool = DBConnectionMgr.getInstance();
			// DB Ŀ�ؼ� Ǯ ��ü ����
		}
		catch(Exception e) {
			System.out.println
			("[ERROR] Ŀ�ؼ� Ǯ ��ü ��ȯ ����!");
		}
	}
	
	// DB ���� ����
	public boolean loginRegister
	(String id, String pwd){
		
		Connection conn = null; // DB ���� ��ü
		PreparedStatement stmt = null; // sql�� �ۼ� ��ü
		ResultSet rs = null; // sql�� ���� ��� ��� ��ü

		boolean result = false;
		
		try {
			conn 
			= pool.getConnection();
			// JDBC ����̹��� ���� DB ���� 
			String query = "select count(*) from REGISTER"
					+ " where id = ? and pwd = ?";
			stmt = conn.prepareStatement(query);
			// Statement���� �ణ ���� �ӵ��� ����
			// why? ���ǹ� �̸� ������ �س��� ��������� ���޹��� ����
			// id, pwd�� �����ϵ��� ���� ó�� (���ǹ� ���� ?)
			
			// loginRegister �Լ� ȣ�� ���޵� ���ڷ� ����
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			
			rs = stmt.executeQuery();
			// ���ǹ� ����
			
			// ���̵�� �н����带 �Է��� �޾Ƽ�
			// �ش� ���̵�� �н����带 ���� �����Ͱ� �ִ��� ���̺� ��ȸ
			// ��� ���̺��� �� ���� 1�����
			// ������ ���̵� �н����尡 ���̺� ����!
			
			if(rs.next() && rs.getInt(1) == 1)
				result = true;
			// rs.getInt(1) 
				// : ���� ���� 1��° �Ӽ� �� (count(*) ��ȯ)
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			pool.freeConnection(conn);
			// Ŀ�ؼ� Ǯ�� ��ü ��ȯ (���� �ϱ� ����)
			// close() ȣ�� X (��ü ���� ���� X)
		}
		return result;
	}
	
}
