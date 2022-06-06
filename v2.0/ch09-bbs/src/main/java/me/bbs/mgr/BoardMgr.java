package me.bbs.mgr;

import java.util.ArrayList;
import java.util.List;

import me.java.beans.BoardBean;
import me.jdbc.connectionPool.*;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

// 파일 업로드 기능에 필요한 클래스
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

// 게시문 SQL 처리 파일
// DB Access Object (DAO)
public class BoardMgr {

	private DBConnectionMgr pool;

	// 파일 업로드에 사용하는 폴더 위치
	private static final String JSPWORKSPACE = "D:\\GoottAcademy-2\\jsp-workspace\\ch09-bbs\\src\\main\\webapp";
	private static final String SAVEFOLDER = "upload";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 5 * 1024 * 1024; // 5mb

	public BoardMgr() {
		try {
			// DBConnectionMgr 객체 가져옴
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판 리스트
	public List<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<BoardBean> boardList = new Vector<BoardBean>();
		try {
			// DBConnectionMgr pool 객체를 통해 DB에 연결
			conn = pool.getConnection();

			// 일부 데이터만 가지고 오는 쿼리
			if (keyWord.equals("null") || keyWord.equals("")) {

				// 모든 게시물 가지고 오기 위함
				sql = "SELECT * FROM ( SELECT ROWNUM AS ROW_NUM, BOARD.* "
						+ "FROM ( SELECT * FROM BOARD ORDER BY REF DESC, POS) BOARD) "
						+ "WHERE ROW_NUM >= ? AND ROW_NUM <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {

				// keyField 컬럼에 keyWord 단어를 검색하기 위한 SQL문
				sql = "SELECT * from ( SELECT ROWNUM AS ROW_NUM, BOARD.* " + "FROM ( SELECT * FROM BOARD WHERE "
						+ keyField + " LIKE ? ORDER BY REF DESC, POS) BOARD ) " + "WHERE ROW_NUM >= ? AND ROW_NUM <= ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery(); // SQL문 실행하고 결과 값을 ResultSet 객체 타입으로 반환
			while (rs.next()) {

				// SQL 결과 값을 bean 객체에 저장
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegDate(rs.getString("regdate"));
				bean.setCount(rs.getInt("count"));
				boardList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Connection 객체 재사용을 위해 풀에 반환
			pool.freeConnection(conn, pstmt, rs);
		}
		return boardList;
	}

	// 총 게시물수
	public int getTotalCount(String keyField, String keyWord) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			conn = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				// 모든 게시물의 개수 구하는 SQL문
				sql = "SELECT COUNT(NUM) FROM BOARD";
				pstmt = conn.prepareStatement(sql);
			} else {
				// 검색된 게시물의 개수 구하는 SQL문
				sql = "SELECT COUNT(NUM) FROM BOARD WHERE " + keyField + " LIKE ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				// "%가%"
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1); // count(num)에 대한 값을 가지옴
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return totalCount;
	}

	// 게시물 입력
	public void insertBoard(HttpServletRequest req) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		try {
			conn = pool.getConnection();
			sql = "SELECT MAX(NUM) FROM BOARD";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			if (rs.next())
				ref = rs.getInt(1) + 1;
			File file = new File(JSPWORKSPACE + File.separator + SAVEFOLDER);
			if (!file.exists())
				file.mkdirs();
			multi = new MultipartRequest(req, JSPWORKSPACE + File.separator + SAVEFOLDER, MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}
			String content = multi.getParameter("content");
			if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
				content = UtilMgr.replace(content, "<", "&lt;");
			}
			sql = "INSERT INTO BOARD(NUM, NAME, SUBJECT, CONTENT, "
					+ "POS, REF, DEPTH, REGDATE, PASS, COUNT, IP, FILENAME, FILESIZE)";
			sql += "VALUES(BOARD_SEQ.NEXTVAL, ?, ?, ?, 0, ?, 0, SYSDATE, ?, 0, ?, ?, ?)";

			// 매개변수로 받은 BoardBean 객체의 getter 메소드로 반환받아 각각의 매개변수 (?)에 set
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("subject"));
			pstmt.setString(3, content);
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, multi.getParameter("ip"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
	}

	// 게시물 리턴
	public BoardBean getBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			conn = pool.getConnection();
			sql = "SELECT * FROM BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// SQL 결과 값을 BoardBean 객체의 setter() 메소드로 bean 객체에 저장
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegDate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setIp(rs.getString("ip"));
				bean.setCount(rs.getInt("count"));
				bean.setFileName(rs.getString("filename"));
				bean.setFileSize(rs.getInt("filesize"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return bean;
	}

	// 조회수 증가
	public void upCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = pool.getConnection();
			// 읽은 게시물의 count 값 증가
			sql = "UPDATE BOARD SET COUNT=COUNT+1 WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}

	// 게시물 삭제
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			// 게시물 삭제를 위한 SQL문
			sql = "SELECT FILENAME FROM BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {
					File file = new File(JSPWORKSPACE + File.separator + SAVEFOLDER + File.separator + rs.getString(1));
					if (file.exists())
						UtilMgr.delete(JSPWORKSPACE + File.separator + SAVEFOLDER + File.separator + rs.getString(1));
				}
			}
			
			// 해당 글 삭제
			sql = "DELETE FROM BOARD WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			// 해당 글과 연결된 답변도 같이 삭제
			sql = "DELETE FROM BOARD WHERE REF=? AND REF!=0";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
	}

	// 게시물 수정
	public void updateBoard(BoardBean bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = pool.getConnection();
			// 게시물 수정를 위한 SQL문
			sql = "UPDATE BOARD SET NAME=?, SUBJECT=?, CONTENT=? WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}

	// 게시물 답변
	public void replyBoard(BoardBean bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = pool.getConnection();
			// 답변 게시물을 저장하기 위한 SQL문 선언
			sql = "INSERT INTO BOARD (NUM, NAME, SUBJECT, CONTENT, POS, REF, DEPTH, REGDATE, PASS, IP, COUNT) ";
			sql += "VALUES(BOARD_SEQ.NEXTVAL, ?,?,?,?,?,?,SYSDATE,?,?,0)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, pos);
			pstmt.setInt(5, bean.getRef());
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}

	// 답변에 위치값 증가
	public void replyUpBoard(int ref, int pos) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = pool.getConnection();
			// 매개변수로 받은 ref와 ref 값이 같은 게시물 중 매개변수로 받은 pos값 보다 게시물의 pos값이 더 큰 게시물은 pos값을 1개씩
			// 증가
			sql = "UPDATE BOARD SET POS=POS+1 WHERE REF=? AND POS > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}

	// 파일 다운로드
	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		try {
			req.setCharacterEncoding(ENCTYPE);
			
			String fileName = req.getParameter("filename"); 
			// 첨부파일 이름 (한국어, 영어 그대로)
			System.out.println("fileName : " + fileName);

			File file = new File(JSPWORKSPACE + File.separator + SAVEFOLDER + File.separator + fileName);
			if (file.isFile()) {
				byte b[] = new byte[(int) file.length()];
				String headerFileName = java.net.URLEncoder.encode(fileName, ENCTYPE);
				// http header에 set하기 위해서 첨부파일 이름을 16진수로 변경
				System.out.println("headerFileName : " + headerFileName);

				// 응답 객체 res 헤더 필드 Accept-Ranges에 byte 단위로 설정
				// 다운로드 도중에 중단될 경우에 파일 다운로드를 계속 수행
				// 보통 대용량 파일 다운로드할 경우에는 중단될 수 있기 때문에 중단된 시점부터 계속 수행
				res.setHeader("Accept-Ranges", "bytes");

				// 요청 객체 정보인 req에서 클라이언트의 User-Agent 정보 리턴
				String strClient = req.getHeader("User-Agent");

				// 브라우저 버전과 정보를 구분해서 contentType 설정
				if (strClient.indexOf("MSIE6.0") != -1) {
					res.setContentType("application/smnet;charset="+ENCTYPE);
					res.setHeader("Content-Disposition", "filename=" + headerFileName + ";");
				} else {
					res.setContentType("application/smnet;charset="+ENCTYPE);
					res.setHeader("Content-Disposition", "attachment;filename=" + headerFileName + ";");
				}

				out.clear(); // jsp 출력 스트림과 servlet 출력 스트림 겹침 방지
				out = pageContext.pushBody(); // 파일 존재 여부에 따라 스트링 방식으로 브라우저로 파일 전송

				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 페이징 및 블럭 테스트를 위한 게시물 저장 메소드
	public void postTest(int numOfPost) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = pool.getConnection();
			sql = "INSERT INTO BOARD(NUM, NAME, SUBJECT, CONTENT, POS, REF, DEPTH, REGDATE, PASS, IP, COUNT, FILENAME, FILESIZE) "
					+ "VALUES(BOARD_SEQ.NEXTVAL, 'aaa', 'bbb', 'ccc', 0, 0, 0, SYSDATE, '1111', '127.0.0.1', 0, NULL, 0)";
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < numOfPost; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}
	}

	// main
	public static void main(String[] args) {
		new BoardMgr().postTest(200);
		System.out.println("SUCCESS");
	}
}