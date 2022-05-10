package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DlyDTO;
import InteriorDTO.FurnitureDTO;
import InteriorDTO.HomegalleryDTO;
import Util.JdbcDAO;

public class HomegalleryDAO extends JdbcDAO {
	private HomegalleryDAO() {};
	 
	private static HomegalleryDAO DAO = new HomegalleryDAO();
	
	public static HomegalleryDAO getDAO() {
		return DAO;
	}
	
	public List<HomegalleryDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from homegallery";
		List<HomegalleryDTO> list = new ArrayList<HomegalleryDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HomegalleryDTO homegallery  = new HomegalleryDTO();
				homegallery.setP_no(rs.getString("p_no"));
				homegallery.setP_name(rs.getString("p_name"));
				homegallery.setP_kinds(rs.getString("p_kinds"));
				homegallery.setP_price(rs.getInt("p_price"));
				homegallery.setP_amount(rs.getInt("p_amount"));
				homegallery.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(homegallery);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public int HomegalleryCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from homegallery order by p_no desc";
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
	
	// �������� ��� �޼ҵ�(�˻����� ����)
	public List<HomegalleryDTO> HomegallerySearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from Homegallery order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<HomegalleryDTO> list = new ArrayList<HomegalleryDTO>(); // ���� �� ����
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HomegalleryDTO dto = new HomegalleryDTO();
				dto.setP_no(rs.getString("p_no"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_kinds(rs.getString("p_kinds"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setP_amount(rs.getInt("p_amount"));
				dto.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	public HomegalleryDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from homegallery where p_no=?";
		HomegalleryDTO homegallery = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				homegallery  = new HomegalleryDTO();
				homegallery.setP_no(rs.getString("p_no"));
				homegallery.setP_name(rs.getString("p_name"));
				homegallery.setP_kinds(rs.getString("p_kinds"));
				homegallery.setP_price(rs.getInt("p_price"));
				homegallery.setP_amount(rs.getInt("p_amount"));
				homegallery.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return homegallery;
	}
	
	
	public int insertHomegallery(HomegalleryDTO hg) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into homegallery values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, hg.getP_no());
			pstmt.setString(2, hg.getP_name());
			pstmt.setString(3, hg.getP_kinds());
			pstmt.setInt(4, hg.getP_price());
			pstmt.setInt(5, hg.getP_amount());
			pstmt.setString(6, hg.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertHomegallery �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
		
}