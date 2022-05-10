package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.MemberDTO;
import Util.JdbcDAO;

public class MemberDAO extends JdbcDAO {
	private static MemberDAO _dao;
	 
	private MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new MemberDAO();
	}
	
	public static MemberDAO getDAO() {
		return _dao;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertMember(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
					
			String sql="insert into member values(?,?,?,?,?,?,?,?,1,null)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_userid());
			pstmt.setString(2, member.getM_passwd());
			pstmt.setString(3, member.getM_zipcode());
			pstmt.setString(4, member.getM_add1());
			pstmt.setString(5, member.getM_add2());
			pstmt.setString(6, member.getM_tel());
			pstmt.setString(7, member.getM_email());
			pstmt.setString(8, member.getM_name());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public MemberDTO selectIdMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO member=null;
		try {
			con=getConnection();
			String sql="select * from member where m_userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				member=new MemberDTO();
				member.setM_userid(rs.getString("m_userid"));
				member.setM_passwd(rs.getString("m_passwd"));
				member.setM_zipcode(rs.getString("m_zipcode"));
				member.setM_add1(rs.getString("m_add1"));
				member.setM_add2(rs.getString("m_add2"));
				member.setM_tel(rs.getString("m_tel"));
				member.setM_email(rs.getString("m_email"));
				member.setM_name(rs.getString("m_name"));
				member.setM_grade(rs.getInt("m_grade"));
				member.setM_last_login(rs.getString("m_last_login"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return member;
	}
	
	public int loginMember(String id,String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;

		int row = 0;
	 
		String query="select m_userid, m_passwd from member where m_userid=? and m_passwd=?";
		try {
			con=getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();

			
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setM_userid(rs.getString("m_userid"));
				dto.setM_passwd(rs.getString("m_passwd"));
				row = pstmt.executeUpdate();
			}
		}catch (Exception e) {
			System.out.println("[에러]loginMember 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return row;
	
	}
	
	
	public MemberDTO memberSelect(String A, String B) {//매개변수를 1개만 쓸 때는 A=userid, 매개변수를 2개 쓸때는 A=name, B=이메일 or phonenum
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//리턴타입 정의	
		MemberDTO member = null;
		//query 정의
		
		try {
			con = getConnection();
			if(B.equals("")) {
				String query="select * from member where m_userid=?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, A);
				
			} else if(B.contains("@")) {
				String query="select * from member where m_name like ? and m_email like ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, A);
				pstmt.setString(2, B);
				
			} else {
				String query="select * from member where m_name like ? and m_tel like ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, A);
				pstmt.setString(2, B);
			}
			
			rs= pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberDTO();
				member.setM_userid(rs.getString("m_userid"));
				member.setM_passwd(rs.getString("m_passwd"));
				member.setM_zipcode(rs.getString("m_zipcode"));
				member.setM_add1(rs.getString("m_add1"));
				member.setM_add2(rs.getString("m_add2"));
				member.setM_tel(rs.getString("m_tel"));
				member.setM_email(rs.getString("m_email"));
				member.setM_name(rs.getString("m_name"));
				member.setM_grade(rs.getInt("m_grade"));
				member.setM_last_login(rs.getString("m_last_login"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		// 리턴타입이 있을 경우
		return member;
	}
	
	public List<MemberDTO> selectMemberList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberDTO> productList=new ArrayList<MemberDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {//검색 사용 X
				if(keyword.equals("")) {//모든 상품을 검색할 경우
					String sql=" select * from (select rownum rn, temp.* from "
							+ "(select * from member order by m_name) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {//상품번호로 검색할 경우
					String sql="select * from member where p_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}
			
			} else {
					String sql="select * from (select rownum rn, temp.* from "
							+ "(select * from member where "+search+ " like '%'||?||'%' order by m_name) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO member=new MemberDTO();
				member.setM_userid(rs.getString("m_userid"));
				member.setM_name(rs.getString("m_name"));
				member.setM_passwd(rs.getString("m_passwd"));
				member.setM_tel(rs.getString("m_tel"));
				member.setM_email(rs.getString("m_email"));
				member.setM_zipcode(rs.getString("m_zipcode"));
				member.setM_add1(rs.getString("m_add1"));
				member.setM_add2(rs.getString("m_add2"));
				member.setM_grade(rs.getInt("m_grade"));
				member.setM_last_login(rs.getString("m_last_login"));
				productList.add(member);
			}
			
		} catch(SQLException e ) {
			System.out.println("[에러]selectMemberList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return productList;
	}
	
	//총 회원수를 검색하여 반환하는 메소드
	public int selectCountMember(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
					
				String sql="select count(*) from member";
				pstmt=con.prepareStatement(sql);
					
			} else {
				String sql="select count(*) from member where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]selectCountMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
	
	public int updateMember1(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql = "update member set m_name=?, m_tel=?, m_email=?, m_grade=? where m_userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getM_name());
			pstmt.setString(2, member.getM_tel());
			pstmt.setString(3, member.getM_email());
			pstmt.setInt(4, member.getM_grade());
			pstmt.setString(5, member.getM_userid());
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("[에러]updateMember1 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updateMember2(MemberDTO member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql = "update member set m_passwd=?, m_zipcode=?, m_add1=?, m_add2=?, m_name=?, m_tel=?, m_email=? where m_userid=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, member.getM_passwd());
			pstmt.setString(2, member.getM_zipcode());
			pstmt.setString(3, member.getM_add1());
			pstmt.setString(4, member.getM_add2());
			pstmt.setString(5, member.getM_name());
			pstmt.setString(6, member.getM_tel());
			pstmt.setString(7, member.getM_email());
			pstmt.setString(8, member.getM_userid());
			
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("[에러]updateMember2 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	public int updateGrade(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update member set m_grade=0 where m_userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateGrade 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updatePw(String A, String B, String C, String D) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
				
			 if(C.contains("@")) {
				String sql="update member set m_passwd=? where m_name like ? and m_email like ? and m_userid like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, A);
				pstmt.setString(2, B);
				pstmt.setString(3, C);
				pstmt.setString(4, D);
				
			 } else if(C.contains("-")) {
				String sql="update member set m_passwd=? where m_name like ? and m_tel like ? and m_userid like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, A);
				pstmt.setString(2, B);
				pstmt.setString(3, C);
				pstmt.setString(4, D);
			}
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updatePw 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
