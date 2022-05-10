package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.ReviewDTO;
import Util.JdbcDAO;


public class ReviewDAO extends JdbcDAO {
	private static ReviewDAO _dao;
	
	public ReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new ReviewDAO();
	}
	
	public static ReviewDAO getDao() {
		return _dao;
	}
	
	//리뷰 전달받아 삽입 저장하고 삽입행의 갯수 반환
	
	public int insertReview(ReviewDTO review) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into review values(r_seq_no.nextval,?,?,?,sysdate,0,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1, review.getR_no());
			pstmt.setString(1, review.getM_userid());//
			pstmt.setString(2, review.getR_title());//
			pstmt.setString(3, review.getR_content());//
			pstmt.setString(4, review.getR_img());//
			pstmt.setString(5, review.getP_no());//
			pstmt.setInt(6, review.getStatus());
			pstmt.setInt(7, review.getRef());
			pstmt.setInt(8, review.getRestep());
			pstmt.setInt(9, review.getRelevel());
			rows=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("[에러]insertReview 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows;
	}

	public List<ReviewDTO> selectReviewList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ReviewDTO> reviewList=new ArrayList<ReviewDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {
				if(keyword.equals("")) {//검색기능을 사용하지 않은 경우 
					String sql=" select * from (select rownum rn, temp.* from "
							+ "(select * from review order by ref desc,restep) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {//게시글 번호로 검색할 경우
					String sql="select * from question where r_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}					
					
			} else {//검색기능을 사용한 경우
				String sql="select * from (select rownum rn,temp.* from "
						+ "(select * from review where "+search+" like '%'||?||'%' and status!=9 "
						+ "order by ref desc,restep) temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			} 
				
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO review=new ReviewDTO();
				review.setR_no(rs.getInt("r_no"));
				review.setM_userid(rs.getString("m_userid"));
				review.setR_title(rs.getString("r_title"));
				review.setR_content(rs.getString("r_content"));
				review.setR_date(rs.getString("r_date"));
				review.setR_count(rs.getInt("r_count"));
				review.setR_img(rs.getString("r_img"));
				review.setP_no(rs.getString("p_no"));
				review.setStatus(rs.getInt("status"));
				review.setRef(rs.getInt("ref"));
				review.setRestep(rs.getInt("restep"));
				review.setRelevel(rs.getInt("relevel"));
				reviewList.add(review);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return reviewList;
}
	
			
			
	
	//BOARD 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 메소드
	// => 검색 기능을 제공하기 위해 매개변수에 검색 관련 값을 전달받아 저장
	public int selectReviewCount(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
				String sql="select count(*) from review";
				pstmt=con.prepareStatement(sql);
			} else {//검색 기능을 사용한 경우
				//비교컬럼(search)에 검색단어(keyword)가 포함된 게시글의 갯수 검색
				String sql="select count(*) from review where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectReviewCount 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//글번호를 전달받아 리뷰게시글 삭제
		public ReviewDTO selectNumReview(int r_no) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ReviewDTO review=null;
			
			try {
				con=getConnection();
				
				String sql="select*from review where r_no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, r_no);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					review=new ReviewDTO();
					review.setR_no(rs.getInt("r_no"));
					review.setM_userid(rs.getString("m_userid"));
					review.setR_title(rs.getString("r_title"));
					review.setR_content(rs.getString("r_content"));
					review.setR_date(rs.getString("r_date"));
					review.setR_count(rs.getInt("r_count"));
					review.setR_img(rs.getString("r_img"));
					review.setP_no(rs.getString("p_no"));
					review.setStatus(rs.getInt("status"));
					review.setRef(rs.getInt("ref"));
					review.setRestep(rs.getInt("reStep"));
					review.setRelevel(rs.getInt("reLevel"));
				}
			}catch (Exception e) {
				System.out.println("[에러]selectNumReview 메소드의 SQL 오류 = "+e.getMessage());
			}finally {
				close(con, pstmt, rs);
			}
			return review;
		}
	
	
	
	
	//사용후기 내용 변경(업데이트)
	
	public int updateReview(ReviewDTO review) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set r_title=?, r_content=?, r_img=?, r_date=sysdate where r_no=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, review.getR_title());
			pstmt.setString(2, review.getR_content());
			pstmt.setString(3, review.getR_img());
			pstmt.setInt(4, review.getR_no());
			rows=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("[에러]updateReview 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteReview(int r_no) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set status=0 where r_no=?  ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
			
			rows=pstmt.executeUpdate();	
		} catch (Exception e) {
			System.out.println("[에러]deleteReview 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호를 전달받아 BOARD 테이블에 저장된 해당 글번호의 게시글 조회수를 변경(증가) 하고 변경행의 갯수를 반환하는 메소드
	public int updateRcount(int r_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
				
			String sql="update review set r_count=r_count+1 where r_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, r_no);
				
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateRcount 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	//BOARD 테이블에 저장된 게시글 중 조건에 맞는 게시글의 RE_STEP 컬럼값을 변경하고 변경행의 갯수를 반환하는 메소드  
	public int updateRStep(int ref, int reStep) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update review set reStep=reStep+1 where ref=? and reStep>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, reStep);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateRStep 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//리뷰_seq 다음값을 검색하여 반환하는 메소드
	public int selectNextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select r_seq_no.nextval from dual";
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

	

	/*
	//글 제목을 전달받아 리뷰게시글 검색
		public ReviewDTO selecttitleReview(String title) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ReviewDTO review=null;
			
			try {
				con=getConnection();
				
				String sql="select * from board where m_title=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, title);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					ReviewDTO review=new ReviewDTO();
					review.setR_no(rs.getInt("r_no"));
					review.setM_userid(rs.getString("m_userid"));
					review.setR_title(rs.getString("r_title"));
					review.setR_content(rs.getString("r_content"));
					review.setR_date(rs.getString("r_date"));
					review.setR_count(rs.getInt("r_count"));
					review.setR_img(rs.getString("r_img"));
					review.setP_no(rs.getString("p_no"));
				}
			}catch (Exception e) {
				System.out.println("[에러]selecttitleReview 메소드의 SQL 오류 = "+e.getMessage());
			}finally {
				close(con, pstmt, rs);
			}
			return review;
		}
	*/	
		
	
