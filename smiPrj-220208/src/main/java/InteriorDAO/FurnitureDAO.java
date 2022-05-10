package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DlyDTO;
import InteriorDTO.FurnitureDTO;
import Util.JdbcDAO;

public class FurnitureDAO extends JdbcDAO {
	private FurnitureDAO() {};
	 
	private static FurnitureDAO DAO = new FurnitureDAO();
	
	public static FurnitureDAO getDAO() {
		return DAO;
	}
	
	public List<FurnitureDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from furniture";
		List<FurnitureDTO> list = new ArrayList<FurnitureDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FurnitureDTO furniture  = new FurnitureDTO();
				furniture.setP_no(rs.getString("p_no"));
				furniture.setP_name(rs.getString("p_name"));
				furniture.setP_kinds(rs.getString("p_kinds"));
				furniture.setP_price(rs.getInt("p_price"));
				furniture.setP_amount(rs.getInt("p_amount"));
				furniture.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(furniture);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public FurnitureDTO selectIdMember(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		FurnitureDTO furniture=null;
		try {
			con=getConnection();
			String sql="select * from furniture where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				furniture =new FurnitureDTO();
				furniture.setP_no(rs.getString("p_no"));
				furniture.setP_name(rs.getString("p_name"));
				furniture.setP_kinds(rs.getString("p_kinds"));
				furniture.setP_price(rs.getInt("p_price"));
				furniture.setP_amount(rs.getInt("p_amount"));
				furniture.setP_imgsrc(rs.getString("p_imgsrc"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return furniture;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertFurniture(FurnitureDTO furniture) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into furniture values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, furniture.getP_no());
			pstmt.setString(2, furniture.getP_name());
			pstmt.setString(3, furniture.getP_kinds());
			pstmt.setInt(4, furniture.getP_price());
			pstmt.setInt(5, furniture.getP_amount());
			pstmt.setString(6, furniture.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public FurnitureDTO selectFurniture(FurnitureDTO furniture) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from furniture p_no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				furniture = new FurnitureDTO();
				furniture.setP_no(rs.getString("p_no"));
				furniture.setP_name(rs.getString("p_name"));
				furniture.setP_kinds(rs.getString("p_kinds"));
				furniture.setP_price(rs.getInt("p_price"));
				furniture.setP_amount(rs.getInt("p_amount"));
				furniture.setP_imgsrc(rs.getString("p_imgsrc"));		
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return furniture;
	}
	
	public int FurnitureyCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from furniture order by p_no desc";
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
	public List<FurnitureDTO> FurnitureSearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from furniture order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<FurnitureDTO> list = new ArrayList<FurnitureDTO>(); // 리턴 값 정의
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FurnitureDTO furniture = new FurnitureDTO();
				furniture.setP_no(rs.getString("p_no"));
				furniture.setP_name(rs.getString("p_name"));
				furniture.setP_kinds(rs.getString("p_kinds"));
				furniture.setP_price(rs.getInt("p_price"));
				furniture.setP_amount(rs.getInt("p_amount"));
				furniture.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(furniture);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	public FurnitureDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from furniture where p_no=?";
		FurnitureDTO furniture = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				furniture  = new FurnitureDTO();
				furniture.setP_no(rs.getString("p_no"));
				furniture.setP_name(rs.getString("p_name"));
				furniture.setP_kinds(rs.getString("p_kinds"));
				furniture.setP_price(rs.getInt("p_price"));
				furniture.setP_amount(rs.getInt("p_amount"));
				furniture.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return furniture;
	}
	
}
