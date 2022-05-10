package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DecoDTO;
import InteriorDTO.DlyDTO;
import Util.JdbcDAO;

public class DecoDAO extends JdbcDAO {
	private DecoDAO() {};
	 
	private static DecoDAO DAO = new DecoDAO();
	
	public static DecoDAO getDAO() {
		return DAO;
	}
	
	public List<DecoDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from deco";
		List<DecoDTO> list = new ArrayList<DecoDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DecoDTO deco  = new DecoDTO();
				deco.setP_no(rs.getString("p_no"));
				deco.setP_name(rs.getString("p_name"));
				deco.setP_kinds(rs.getString("p_kinds"));
				deco.setP_price(rs.getInt("p_price"));
				deco.setP_amount(rs.getInt("p_amount"));
				deco.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(deco);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public int DecoCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from deco order by p_no desc";
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
	public List<DecoDTO> DecoSearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from deco order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<DecoDTO> list = new ArrayList<DecoDTO>(); // ���� �� ����
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DecoDTO deco = new DecoDTO();
				deco.setP_no(rs.getString("p_no"));
				deco.setP_name(rs.getString("p_name"));
				deco.setP_kinds(rs.getString("p_kinds"));
				deco.setP_price(rs.getInt("p_price"));
				deco.setP_amount(rs.getInt("p_amount"));
				deco.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(deco);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	public DecoDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from deco where p_no=?";
		DecoDTO deco = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				deco  = new DecoDTO();
				deco.setP_no(rs.getString("p_no"));
				deco.setP_name(rs.getString("p_name"));
				deco.setP_kinds(rs.getString("p_kinds"));
				deco.setP_price(rs.getInt("p_price"));
				deco.setP_amount(rs.getInt("p_amount"));
				deco.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return deco;
	}
	
	public int insertDeco(DecoDTO deco) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into deco values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, deco.getP_no());
			pstmt.setString(2, deco.getP_name());
			pstmt.setString(3, deco.getP_kinds());
			pstmt.setInt(4, deco.getP_price());
			pstmt.setInt(5, deco.getP_amount());
			pstmt.setString(6, deco.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertDeco �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
