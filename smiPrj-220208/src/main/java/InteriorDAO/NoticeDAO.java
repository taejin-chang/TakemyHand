package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.MemberDTO;
import InteriorDTO.NoticeDTO;
import InteriorDTO.ProductDTO;
import InteriorDTO.ReviewDTO;
import Util.JdbcDAO;

public class NoticeDAO extends JdbcDAO {
	private static NoticeDAO _dao;
	
	private NoticeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new NoticeDAO();
	}
	
	public static NoticeDAO getDAO() {
		return _dao;
	}
	
	public int insertNotice(NoticeDTO notice) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into notice values(notice_seq_no.nextval,?,?,?,sysdate,0)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, notice.getM_userid());
			pstmt.setString(2, notice.getN_title());
			pstmt.setString(3, notice.getN_content());
			
			rows=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("[에러]insertNotice 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows;
	}
	
	public List<NoticeDTO> selectNoticeList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NoticeDTO> noticeList=new ArrayList<NoticeDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {//검색 사용 X
				if(keyword.equals("")) {//모든 상품을 검색할 경우
					String sql=" select * from (select rownum rn, temp.* from "
							+ "(select * from notice order by n_no) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {//게시글 번호로 검색할 경우
					String sql="select * from notice where n_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}
			
			} else {
					String sql="select * from (select rownum rn, temp.* from "
							+ "(select * from notice where "+search+ " like '%'||?||'%' order by n_no) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO notice=new NoticeDTO();
				notice.setN_no(rs.getInt("n_no"));
				notice.setM_userid(rs.getString("m_userid"));
				notice.setN_title(rs.getString("n_title"));
				notice.setN_content(rs.getString("n_content"));
				notice.setN_regdate(rs.getString("n_regdate"));
				notice.setN_count(rs.getInt("n_count"));
				noticeList.add(notice);
			}
			
		} catch(SQLException e ) {
			System.out.println("[에러]selectNoticeList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return noticeList;
	}
	
	//총 게시물을 검색하여 반환하는 메소드
	public int selectCountNotice(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
					
				String sql="select count(*) from notice";
				pstmt=con.prepareStatement(sql);
					
			} else {
				String sql="select count(*) from notice where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]selectCountNotice 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
	
	//
	public NoticeDTO selectNotice(int n_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		NoticeDTO notice=null;
		try {
			con=getConnection();
			String sql="select * from notice where n_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				notice=new NoticeDTO();
				notice.setM_userid(rs.getString("m_userid"));
				notice.setN_content(rs.getString("n_content"));
				notice.setN_count(rs.getInt("n_count"));
				notice.setN_no(rs.getInt("n_no"));
				notice.setN_regdate(rs.getString("n_regdate"));
				notice.setN_title(rs.getString("n_title"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNotice 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return notice;
	}
	public int updateNotice(NoticeDTO notice) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql = "update notice set n_content=?, n_title=?, n_regdate=sysdate where n_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, notice.getN_content());
			pstmt.setString(2, notice.getN_title());
			pstmt.setInt(3, notice.getN_no());
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("[에러]updateNotice 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int removeNotice(int n_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from notice where n_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]removeNotice 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updateReadcount(int n_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update notice set readcount=readcount+1 where n_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n_no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReadcount 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public List<NoticeDTO> selectAllboardList(int startRow, int endRow, String search, String keyword, String loginMember) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NoticeDTO> noticeList=new ArrayList<NoticeDTO>();
		try {
			con=getConnection();
			
			String sql="select * from (select rownum rn, temp.* from "
					+ " (select n_no, m_userid, n_title, n_regdate, n_count from notice union "
					+ " select b_no, m_userid, b_title, b_date, b_count from board union "
					+ " select q_no, m_userid, q_title, q_date, q_count from question union "
					+ " select r_no, m_userid, r_title, r_date, r_count from review) temp where m_userid=? order by rn) where rn between ? and ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, loginMember);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO notice=new NoticeDTO();
				notice.setN_no(rs.getInt("n_no"));
				notice.setM_userid(rs.getString("m_userid"));
				notice.setN_title(rs.getString("n_title"));
				notice.setN_regdate(rs.getString("n_regdate"));
				notice.setN_count(rs.getInt("n_count"));
				noticeList.add(notice);
			}
		} catch(SQLException e ) {
			System.out.println("[에러]selectAllboardList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return noticeList;
	}
	
	public int selectCountAllboard(String search, String keyword, String loginMember) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
				String sql="select count(*) from (select n_no, m_userid, n_title, n_regdate, n_count from notice union "
						+ "select b_no, m_userid, b_title, b_date, b_count from board union "
						+ "select q_no, m_userid, q_title, q_date, q_count from question union "
						+ "select r_no, m_userid, r_title, r_date, r_count from review) where m_userid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, loginMember);
	
			} else {
				String sql="select count(*) from (select rownum rn, temp.* from ("
						+ "select n_no, m_userid, n_title, n_regdate, n_count from notice union "
						+ "select b_no, m_userid, b_title, b_date, b_count from board union "
						+ "select q_no, m_userid, q_title, q_date, q_count from question union "
						+ "select r_no, m_userid, r_title, r_date, r_count from review) temp where m_userid=? order by rn)"
						+ " where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, loginMember);
				pstmt.setString(2, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]selectCountAllboard 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
}
