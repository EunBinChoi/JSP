package ex02;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

public class RegisterMgr {
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "scott";
	private final String password = "tiger";
	
	// ������
	// jdbc ����̹� �ε�
	public RegisterMgr() {
		try {
			Class.forName(driver);
		}
		catch(Exception e) {
			System.out.println
			("[ERROR] JDBC ����̹� �ε� ����!");
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
			= DriverManager.getConnection(url, user, password);
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
			if(rs != null) {
				try {
					rs.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(stmt != null) {
				try {
					stmt.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return list; // ��� ��ȯ
	}
	
}
