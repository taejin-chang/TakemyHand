package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DlyDTO;
import InteriorDTO.PtlightDTO;
import Util.JdbcDAO;

public class PtlightDAO extends JdbcDAO {
	private PtlightDAO() {};
	 
	private static PtlightDAO DAO = new PtlightDAO();
	
	public static PtlightDAO getDAO() {
		return DAO;
	}
	
	public List<PtlightDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from ptlight";
		List<PtlightDTO> list = new ArrayList<PtlightDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
				while(rs.next()) {
				PtlightDTO ptlight  = new PtlightDTO();
				ptlight.setP_no(rs.getString("p_no"));
				ptlight.setP_name(rs.getString("p_name"));
				ptlight.setP_kinds(rs.getString("p_kinds"));
				ptlight.setP_price(rs.getInt("p_price"));
				ptlight.setP_amount(rs.getInt("p_amount"));
				ptlight.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(ptlight);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public PtlightDTO selectIdMember(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PtlightDTO ptlight=null;
		try {
			con=getConnection();
			String sql="select * from ptlight where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ptlight =new PtlightDTO();
				ptlight.setP_no(rs.getString("p_no"));
				ptlight.setP_name(rs.getString("p_name"));
				ptlight.setP_kinds(rs.getString("p_kinds"));
				ptlight.setP_price(rs.getInt("p_price"));
				ptlight.setP_amount(rs.getInt("p_amount"));
				ptlight.setP_imgsrc(rs.getString("p_imgsrc"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return ptlight;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertDly(PtlightDTO ptlight) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into ptlight values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ptlight.getP_no());
			pstmt.setString(2, ptlight.getP_name());
			pstmt.setString(3, ptlight.getP_kinds());
			pstmt.setInt(4, ptlight.getP_price());
			pstmt.setInt(5, ptlight.getP_amount());
			pstmt.setString(6, ptlight.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public PtlightDTO selectptlight(PtlightDTO ptlight) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from ptlight p_no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ptlight = new PtlightDTO();
				ptlight.setP_no(rs.getString("p_no"));
				ptlight.setP_name(rs.getString("p_name"));
				ptlight.setP_kinds(rs.getString("p_kinds"));
				ptlight.setP_price(rs.getInt("p_price"));
				ptlight.setP_amount(rs.getInt("p_amount"));
				ptlight.setP_imgsrc(rs.getString("p_imgsrc"));		
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return ptlight;
	}
	
	public int PtLightCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from ptlight order by p_no desc";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		return row;
	}
	

	// 페이지별 목록 메소드(검색조건 없음)
	public List<PtlightDTO> lightSearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from ptlight order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<PtlightDTO> list = new ArrayList<PtlightDTO>(); // 리턴 값 정의
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PtlightDTO ptlight = new PtlightDTO();
				ptlight.setP_no(rs.getString("p_no"));
				ptlight.setP_name(rs.getString("p_name"));
				ptlight.setP_kinds(rs.getString("p_kinds"));
				ptlight.setP_price(rs.getInt("p_price"));
				ptlight.setP_amount(rs.getInt("p_amount"));
				ptlight.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(ptlight);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	
	public PtlightDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from ptlight where p_no=?";
		PtlightDTO ptlight = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ptlight  = new PtlightDTO();
				ptlight.setP_no(rs.getString("p_no"));
				ptlight.setP_name(rs.getString("p_name"));
				ptlight.setP_kinds(rs.getString("p_kinds"));
				ptlight.setP_price(rs.getInt("p_price"));
				ptlight.setP_amount(rs.getInt("p_amount"));
				ptlight.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return ptlight;
	}
	
}
