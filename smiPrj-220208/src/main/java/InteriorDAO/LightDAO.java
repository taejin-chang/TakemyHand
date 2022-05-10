package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DlyDTO;
import InteriorDTO.LightDTO;
import Util.JdbcDAO;

public class LightDAO extends JdbcDAO {
	private LightDAO() {};
	 
	private static LightDAO DAO = new LightDAO();
	
	public static LightDAO getDAO() {
		return DAO;
	}
	
	public List<LightDTO> ListSelectLight(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String query = "select * from light";
		List<LightDTO> list = new ArrayList<LightDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LightDTO light  = new LightDTO();
				light.setP_no(rs.getString("p_no"));
				light.setP_name(rs.getString("p_name"));
				light.setP_kinds(rs.getString("p_kinds"));
				light.setP_price(rs.getInt("p_price"));
				light.setP_amount(rs.getInt("p_amount"));
				light.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(light);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public LightDTO selectIdMember(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		LightDTO light=null;
		try {
			con=getConnection();
			String sql="select * from light where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				light =new LightDTO();
				light.setP_no(rs.getString("p_no"));
				light.setP_name(rs.getString("p_name"));
				light.setP_kinds(rs.getString("p_kinds"));
				light.setP_price(rs.getInt("p_price"));
				light.setP_amount(rs.getInt("p_amount"));
				light.setP_imgsrc(rs.getString("p_imgsrc"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return light;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertDly(LightDTO light) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into light values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, light.getP_no());
			pstmt.setString(2, light.getP_name());
			pstmt.setString(3, light.getP_kinds());
			pstmt.setInt(4, light.getP_price());
			pstmt.setInt(5, light.getP_amount());
			pstmt.setString(6, light.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public LightDTO selectDly(LightDTO light) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from light p_no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				light = new LightDTO();
				light.setP_no(rs.getString("p_no"));
				light.setP_name(rs.getString("p_name"));
				light.setP_kinds(rs.getString("p_kinds"));
				light.setP_price(rs.getInt("p_price"));
				light.setP_amount(rs.getInt("p_amount"));
				light.setP_imgsrc(rs.getString("p_imgsrc"));		
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return light;
	}
	
	public int LightCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from light order by p_no desc";
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
	public List<LightDTO> lightSearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from light order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<LightDTO> list = new ArrayList<LightDTO>(); // 리턴 값 정의
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LightDTO light = new LightDTO();
				light.setP_no(rs.getString("p_no"));
				light.setP_name(rs.getString("p_name"));
				light.setP_kinds(rs.getString("p_kinds"));
				light.setP_price(rs.getInt("p_price"));
				light.setP_amount(rs.getInt("p_amount"));
				light.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(light);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	public LightDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from light where p_no=?";
		LightDTO light = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				light  = new LightDTO();
				light.setP_no(rs.getString("p_no"));
				light.setP_name(rs.getString("p_name"));
				light.setP_kinds(rs.getString("p_kinds"));
				light.setP_price(rs.getInt("p_price"));
				light.setP_amount(rs.getInt("p_amount"));
				light.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return light;
	}
	
}
