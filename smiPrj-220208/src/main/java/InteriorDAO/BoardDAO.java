package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
import java.util.ArrayList;
import java.util.List;

import Util.JdbcDAO;
import InteriorDTO.BoardDTO;
import InteriorDTO.ReviewDTO;

public class BoardDAO extends JdbcDAO {
	private static BoardDAO _dao;
	
	private BoardDAO() {
		
	}
	
	static {
		_dao=new BoardDAO();
	}
	
	public static BoardDAO getDAO() {
		return _dao;
	}

	//BOARD 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 메소드
			// => 검색 기능을 제공하기 위해 매개변수에 검색 관련 값을 전달받아 저장
			public int selectBoardCount(String search, String keyword) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				int count=0;
				try {
					con=getConnection();
					
					if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
						String sql="select count(*) from board";
						pstmt=con.prepareStatement(sql);
					} else {//검색 기능을 사용한 경우
						//비교컬럼(search)에 검색단어(keyword)가 포함된 게시글의 갯수 검색
						String sql="select count(*) from board where "+search+" like '%'||?||'%'";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, keyword);
					}
					
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						count=rs.getInt(1);
					}
				} catch (SQLException e) {
					System.out.println("[에러]selectBoardCount 메소드의 SQL 오류 = "+e.getMessage());
				} finally {
					close(con, pstmt, rs);
				}
				return count;
			}
			
			public List<BoardDTO> selectBoardList(int startRow, int endRow, String search, String keyword) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				List<BoardDTO> boardList=new ArrayList<BoardDTO>();
				try {
					con=getConnection();
					
					if(search.equals("")) {
						if(keyword.equals("")) {//검색기능을 사용하지 않은 경우 
							String sql=" select * from (select rownum rn, temp.* from "
									+ "(select * from board order by ref desc,restep) temp) where "
									+ "rn between ? and ?";
							pstmt=con.prepareStatement(sql);
							pstmt.setInt(1, startRow);
							pstmt.setInt(2, endRow);
						} else {//게시글 번호로 검색할 경우
							String sql="select * from board where b_no=?";
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, keyword);
						}					
							
					} else {//검색기능을 사용한 경우
						String sql="select * from (select rownum rn,temp.* from "
								+ "(select * from board where "+search+" like '%'||?||'%' and status!=9 "
								+ "order by ref desc,restep) temp) where rn between ? and ?";
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, keyword);
							pstmt.setInt(2, startRow);
							pstmt.setInt(3, endRow);
					} 
						
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						BoardDTO board=new BoardDTO();
						board.setB_no(rs.getInt("b_no"));
						board.setM_userid(rs.getString("m_userid"));
						board.setB_title(rs.getString("b_title"));
						board.setB_content(rs.getString("b_content"));
						board.setB_date(rs.getString("b_date"));
						board.setB_count(rs.getInt("b_count"));
						board.setB_img(rs.getString("b_img"));
						board.setP_no(rs.getString("p_no"));
						board.setStatus(rs.getInt("status"));
						board.setRef(rs.getInt("ref"));
						board.setRestep(rs.getInt("restep"));
						board.setRelevel(rs.getInt("relevel"));
						boardList.add(board);
					}
				} catch (SQLException e) {
					System.out.println("[에러]selectReviewList 메소드의 SQL 오류 = "+e.getMessage());
				} finally {
					close(con, pstmt, rs);
				}
				return boardList;
				}
				
			//리뷰_seq 다음값을 검색하여 반환하는 메소드
			public int selectNextNum() {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				int nextNum=0;
				try {
					con=getConnection();
					
					String sql="select b_seq_no.nextval from dual";
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
			
			
			//BOARD 테이블에 저장된 게시글 중 조건에 맞는 게시글의 RE_STEP 컬럼값을 변경하고 변경행의 갯수를 반환하는 메소드  
			public int updateRStep(int ref, int reStep) {
				Connection con=null;
				PreparedStatement pstmt=null;
				int rows=0;
				try {
					con=getConnection();
					
					String sql="update board set restep=restep+1 where ref=? and restep>?";
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
			
	//게시글 등록.  board 테이블에 저장하고 삽입 행의 갯수 반환
	public int insertBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into board values(?,?,?,?,sysdate,0,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,board.getB_no());
			pstmt.setString(2, board.getM_userid());//
			pstmt.setString(3, board.getB_title());//
			pstmt.setString(4, board.getB_content());//
			pstmt.setString(5, board.getB_img());//
			pstmt.setString(6, board.getP_no());//
			pstmt.setInt(7, board.getStatus());
			pstmt.setInt(8, board.getRef());
			pstmt.setInt(9, board.getRestep());
			pstmt.setInt(10, board.getRelevel());

			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertBoard 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
		
	
	
		
		//글번호를 전달받아 리뷰게시글 삭제
			public BoardDTO selectNumBoard(int b_no) {
				Connection con=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				BoardDTO board=null;
				
				try {
					con=getConnection();
					
					String sql="select * from board where b_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, b_no);
					
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						board=new BoardDTO();
						board.setB_no(rs.getInt("b_no"));
						board.setM_userid(rs.getString("m_userid"));
						board.setB_title(rs.getString("b_title"));
						board.setB_content(rs.getString("b_content"));
						board.setB_date(rs.getString("b_date"));
						board.setB_count(rs.getInt("b_count"));
						board.setB_img(rs.getString("b_img"));
						board.setP_no(rs.getString("p_no"));
						board.setStatus(rs.getInt("status"));
						board.setRef(rs.getInt("ref"));
						board.setRestep(rs.getInt("reStep"));
						board.setRelevel(rs.getInt("reLevel"));
					}
				}catch (Exception e) {
					System.out.println("[에러]selectNumReview 메소드의 SQL 오류 = "+e.getMessage());
				}finally {
					close(con, pstmt, rs);
				}
				return board;
			}
		
		
			//글번호를 전달받아 BOARD 테이블에 저장된 해당 글번호의 게시글 조회수를 변경(증가) 하고 변경행의 갯수를 반환하는 메소드
			public int updateBcount(int b_no) {
				Connection con=null;
				PreparedStatement pstmt=null;
				int rows=0;
				try {
					con=getConnection();
						
					String sql="update board set b_count=b_count+1 where b_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, b_no);
						
					rows=pstmt.executeUpdate();
				} catch (SQLException e) {
					System.out.println("[에러]updateRcount 메소드의 SQL 오류 = "+e.getMessage());
				} finally {
					close(con, pstmt);
				}
				return rows;
			}

			public int deleteBoard(int b_no) {
				Connection con = null;
				PreparedStatement pstmt=null;
				int rows=0;
				try {
					con=getConnection();
					
					String sql="update board set status=9 where b_no=?  ";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, b_no);
					
					rows=pstmt.executeUpdate();	
				} catch (Exception e) {
					System.out.println("[에러]deleteReview 메소드의 SQL 오류 = "+e.getMessage());
				} finally {
					close(con, pstmt);
				}
				return rows;
			}
			
		//사용후기 내용 변경(업데이트)
		
		public int updateBoard(BoardDTO board) {
			Connection con = null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update board set b_title=?, b_content=?, b_img=?, b_date=sysdate where b_no=?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, board.getB_title());
				pstmt.setString(2, board.getB_content());
				pstmt.setString(3, board.getB_img());
				pstmt.setInt(4, board.getB_no());
				rows=pstmt.executeUpdate();
			}catch (Exception e) {
				System.out.println("[에러]updateReview 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}

		
		
		

		
		
					
}		
					
					
					
					
					
	