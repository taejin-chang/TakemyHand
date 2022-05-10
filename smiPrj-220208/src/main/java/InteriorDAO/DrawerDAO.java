package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DlyDTO;
import InteriorDTO.DrawerDTO;
import Util.JdbcDAO;

public class DrawerDAO extends JdbcDAO {
	private DrawerDAO() {};
	 
	private static DrawerDAO DAO = new DrawerDAO();
	
	public static DrawerDAO getDAO() {
		return DAO;
	}
	
	public List<DrawerDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from drawer";
		List<DrawerDTO> list = new ArrayList<DrawerDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DrawerDTO drawer  = new DrawerDTO();
				drawer.setP_no(rs.getString("p_no"));
				drawer.setP_name(rs.getString("p_name"));
				drawer.setP_kinds(rs.getString("p_kinds"));
				drawer.setP_price(rs.getInt("p_price"));
				drawer.setP_amount(rs.getInt("p_amount"));
				drawer.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(drawer);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public DrawerDTO selectIdMember(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DrawerDTO drawer=null;
		try {
			con=getConnection();
			String sql="select * from drawer where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				drawer =new DrawerDTO();
				drawer.setP_no(rs.getString("p_no"));
				drawer.setP_name(rs.getString("p_name"));
				drawer.setP_kinds(rs.getString("p_kinds"));
				drawer.setP_price(rs.getInt("p_price"));
				drawer.setP_amount(rs.getInt("p_amount"));
				drawer.setP_imgsrc(rs.getString("p_imgsrc"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return drawer;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertDrawer(DrawerDTO drawer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into drawer values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, drawer.getP_no());
			pstmt.setString(2, drawer.getP_name());
			pstmt.setString(3, drawer.getP_kinds());
			pstmt.setInt(4, drawer.getP_price());
			pstmt.setInt(5, drawer.getP_amount());
			pstmt.setString(6, drawer.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public DrawerDTO selectDrawer(DrawerDTO drawer) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from drawer p_no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				drawer = new DrawerDTO();
				drawer.setP_no(rs.getString("p_no"));
				drawer.setP_name(rs.getString("p_name"));
				drawer.setP_kinds(rs.getString("p_kinds"));
				drawer.setP_price(rs.getInt("p_price"));
				drawer.setP_amount(rs.getInt("p_amount"));
				drawer.setP_imgsrc(rs.getString("p_imgsrc"));		
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return drawer;
	}
	
	public int DrawerCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from drawer order by p_no desc";
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
	public List<DrawerDTO> DrawerSearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from drawer order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<DrawerDTO> list = new ArrayList<DrawerDTO>(); // 리턴 값 정의
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DrawerDTO drawer = new DrawerDTO();
				drawer.setP_no(rs.getString("p_no"));
				drawer.setP_name(rs.getString("p_name"));
				drawer.setP_kinds(rs.getString("p_kinds"));
				drawer.setP_price(rs.getInt("p_price"));
				drawer.setP_amount(rs.getInt("p_amount"));
				drawer.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(drawer);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	public DrawerDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from drawer where p_no=?";
		DrawerDTO drawer = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				drawer  = new DrawerDTO();
				drawer.setP_no(rs.getString("p_no"));
				drawer.setP_name(rs.getString("p_name"));
				drawer.setP_kinds(rs.getString("p_kinds"));
				drawer.setP_price(rs.getInt("p_price"));
				drawer.setP_amount(rs.getInt("p_amount"));
				drawer.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return drawer;
	}
}
