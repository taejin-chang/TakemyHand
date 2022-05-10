package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.QuestionDTO;
import Util.JdbcDAO;

public class QuestionDAO extends JdbcDAO {
	private static QuestionDAO _dao;
	
	private QuestionDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new QuestionDAO();
	}
	
	public static QuestionDAO getDAO() {
		return _dao;
	}
	
	public int insertQna(QuestionDTO qna) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into question values(?,?,?,?,sysdate,0,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, qna.getQ_no());
			pstmt.setString(2, qna.getM_userid());
			pstmt.setString(3, qna.getQ_title());
			pstmt.setString(4, qna.getQ_content());
			pstmt.setString(5, qna.getQ_status());
			pstmt.setInt(6, qna.getRef());
			pstmt.setInt(7, qna.getReStep());
			pstmt.setInt(8, qna.getReLevel());
			pstmt.setString(9, qna.getP_no());
			
			rows=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("[에러]insertQna 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows;
	}
	
	public List<QuestionDTO> selectqnaList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QuestionDTO> qnaList=new ArrayList<QuestionDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {
				if(keyword.equals("")) {//모든 게시글을 검색할 경우
					String sql=" select * from (select rownum rn, temp.* from "
							+ "(select * from question order by ref desc,reStep) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {//게시글 번호로 검색할 경우
					String sql="select * from question where q_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}
				
			} else {//검색할 경우
				String sql="select * from (select rownum rn,temp.* from "
						+ "(select * from question where "+search+" like '%'||?||'%' and q_status!=9 "
						+ "order by ref desc,reStep) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QuestionDTO qna=new QuestionDTO();
				qna.setQ_no(rs.getInt("q_no"));
				qna.setM_userid(rs.getString("m_userid"));
				qna.setQ_title(rs.getString("q_title"));
				qna.setQ_content(rs.getString("q_content"));
				qna.setQ_date(rs.getString("q_date"));
				qna.setQ_count(rs.getInt("q_count"));
				qna.setQ_status(rs.getString("q_status"));
				qna.setRef(rs.getInt("ref"));
				qna.setReStep(rs.getInt("reStep"));
				qna.setReLevel(rs.getInt("reLevel"));
				qna.setP_no(rs.getString("p_no"));
				qnaList.add(qna);
			}
			
		} catch(SQLException e ) {
			System.out.println("[에러]selectqnaList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return qnaList;
	}
	
	//총 게시물을 검색하여 반환하는 메소드
	public int selectCountQna(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
					
				String sql="select count(*) from question";
				pstmt=con.prepareStatement(sql);
					
			} else {
				String sql="select count(*) from question where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]selectCountQna 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
	
	//
	public QuestionDTO selectQna(int q_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		QuestionDTO qna=null;
		try {
			con=getConnection();
			String sql="select * from question where q_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qna=new QuestionDTO();
				qna.setQ_no(rs.getInt("q_no"));
				qna.setM_userid(rs.getString("m_userid"));
				qna.setQ_title(rs.getString("q_title"));
				qna.setQ_content(rs.getString("q_content"));
				qna.setQ_date(rs.getString("q_date"));
				qna.setQ_count(rs.getInt("q_count"));
				qna.setQ_status(rs.getString("q_status"));
				qna.setRef(rs.getInt("ref"));
				qna.setReStep(rs.getInt("reStep"));
				qna.setReLevel(rs.getInt("reLevel"));
				qna.setP_no(rs.getString("p_no"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectQna 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return qna;
	}
	
	public int updateQna(QuestionDTO qna) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql = "update question set q_content=?, q_title=?, q_status=?, q_date=sysdate where q_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, qna.getQ_content());
			pstmt.setString(2, qna.getQ_title());
			pstmt.setString(3, qna.getQ_status());
			pstmt.setInt(4, qna.getQ_no());
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("[에러]updateQna 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int removeQna(int q_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update question set q_status='9' where q_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]removeQna 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updateCount(int q_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update question set q_count=q_count+1 where q_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateCount 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updateReStep(int ref, int reStep) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update question set reStep=reStep+1 where ref=? and reStep>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, reStep);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateReStep 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int selectNextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select q_seq_no.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextNum 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNum;
	}
}
