package ex03;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

import ex02.RegisterBean;

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
	// ����� ������ ���� (ArrayList<RegisterBean>)
	public Vector<RegisterBean> getRegisterList(){
		
		Connection conn = null; // DB ���� ��ü
		Statement stmt = null; // sql�� �ۼ� ��ü
		ResultSet rs = null; // sql�� ���� ��� ��� ��ü
		Vector<RegisterBean> list 
		= new Vector<RegisterBean>();
		
		try {
			conn 
			= pool.getConnection();
			// JDBC ����̹��� ���� DB ���� 
			
			stmt = conn.createStatement();
			// sql�� �ۼ� ��ü ����
			
			rs = stmt.executeQuery("select * from REGISTER");
			// ���ǹ� ����
			
			if(rs != null){
				while(rs.next()){ // ���� ���ڵ� ���� ��ȯ (true/false)
					
					// bean ����
					RegisterBean bean = new RegisterBean();
					
					// bean �Ӽ��� set
					bean.setId(rs.getString("id"));   
					// rs.getString(): �÷��̸� ���� ������ ��ȯ
					// bean.setId(): �����͸� bean ������ ����
					bean.setPwd(rs.getString("pwd")); 
					bean.setName(rs.getString("name")); 
					bean.setNum1(rs.getString("num1")); 
					bean.setNum2(rs.getString("num2")); 
					bean.setEmail(rs.getString("email"));
					bean.setPhone(rs.getString("phone"));
					list.addElement(bean);
					
				}
			}
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			pool.freeConnection(conn);
			// Ŀ�ؼ� Ǯ�� ��ü ��ȯ (���� �ϱ� ����)
			// close() ȣ�� X (��ü ���� ���� X)
		}
		
		return list; // ��� ��ȯ
	}
	
}
