package ex01;

import java.sql.*;
import java.util.ArrayList;


public class MemberMgr {
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ID�� �ߺ� Ȯ��
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from tblMember "
					+ "where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) == 1) result = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	// �����ȣ �˻� (���θ� (~��, area3)�� ������ �˻�)
	// ArrayList: ����� ���θ��� ���� �ּҸ� ��ȯ
	public ArrayList<ZipcodeBean> 
	zipcodeRead(String area3){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<ZipcodeBean> list 
		= new ArrayList<ZipcodeBean>();
		
		// �˻��ܾ�: ����
		// ���ε���10
		// ���ε���20
		// ���ε���30
		try {
			con = pool.getConnection();
			sql = "select * from tblZipcode "
					+ "where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 + "%");
			// �˻��� �ܾ �����ϸ� �� ��ȸ
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				list.add(bean);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	// ȸ������ 
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into tblMember(id,pwd,name,gender,birthday,email,zipcode"
					+ ",address,hobby,job) values (?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			String hobby[] = bean.getHobby();
			// "���ͳ�", "����" ... (5��) 
			// --> "10000"     (DB ����)
			
			char hb[] = { '0', '0', '0', '0', '0' };
			String lists[] 
					= { "���ͳ�", "����", "����", "��ȭ", "�" };
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (hobby[i].equals(lists[j]))
						hb[j] = '1';
				}
			}
			pstmt.setString(9, new String(hb)); // 10000
			pstmt.setString(10, bean.getJob());
			
			if(pstmt.executeUpdate() == 1) {
				result = true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	
	// �α��� 
	// (id, pwd�� tblMember ���̺� ������ �����Ͱ� �ִ���)
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean result = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}
}
