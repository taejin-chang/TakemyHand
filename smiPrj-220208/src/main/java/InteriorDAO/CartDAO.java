package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.CartDTO;
import InteriorDTO.DlyDTO;
import Util.JdbcDAO;

public class CartDAO extends JdbcDAO {
	private CartDAO(){};
	 
	private static CartDAO DAO = new CartDAO();
	
	public static CartDAO getDAO() {
		return DAO;
	}
	
	
	public int insertCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		String query = "insert into cart(c_no,p_no,m_userid,c_amount,p_imgsrc,c_sum,p_name,p_kinds)"
				+"values(cart_seq_no.nextval,?,?,?,?,?,?,?)";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,cart.getP_no());
			pstmt.setString(2, cart.getM_userid());
			pstmt.setInt(3, cart.getC_amount());
			pstmt.setString(4, cart.getP_imgsrc());
			pstmt.setInt(5, cart.getC_sum());
			pstmt.setString(6, cart.getP_name());
			pstmt.setString(7, cart.getP_kinds());
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		return row;
		
	}
	
	public CartDTO selectCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from cart";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cart.setC_no(rs.getInt("c_no"));
				cart.setP_no(rs.getString("p_no"));
				cart.setC_amount(rs.getInt("c_amount"));
				cart.setP_imgsrc(rs.getString("p_imgsrc"));
				cart.setC_sum(rs.getInt("c_sum"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_kinds(rs.getString("p_kinds"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return cart;
	}
	
	public List<CartDTO> ListselectCart(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from cart where m_userid = ? order by c_no desc";
		List<CartDTO> list = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setC_no(rs.getInt("c_no"));
				cart.setP_no(rs.getString("p_no"));
				cart.setM_userid(rs.getString("m_userid"));
				cart.setC_amount(rs.getInt("c_amount"));
				cart.setP_imgsrc(rs.getString("p_imgsrc"));
				cart.setC_sum(rs.getInt("c_sum"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_kinds(rs.getString("p_kinds"));
				list.add(cart);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}	
	
	
	public int deleteCart(int c_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			String sql = "delete from cart where c_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart ���̺� delete ���� => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int deleteAllCart() {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			String sql = "delete from cart";
			pstmt = con.prepareStatement(sql);
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart ���̺� delete ���� => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public int CartCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from cart order by c_no desc";
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
	
	
	public List<CartDTO> ListselectCart2(int c_no, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from cart where c_no = ? and m_userid= ? order by c_no desc";
		List<CartDTO> list = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, c_no);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setC_no(rs.getInt("c_no"));
				cart.setP_no(rs.getString("p_no"));
				cart.setM_userid(rs.getString("m_userid"));
				cart.setC_amount(rs.getInt("c_amount"));
				cart.setP_imgsrc(rs.getString("p_imgsrc"));
				cart.setC_sum(rs.getInt("c_sum"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_kinds(rs.getString("p_kinds"));
				list.add(cart);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}	
	
	public List<CartDTO> ListselectCart3(int c_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from cart where c_no = ?";
		List<CartDTO> list = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, c_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setC_no(rs.getInt("c_no"));
				cart.setP_no(rs.getString("p_no"));
				cart.setM_userid(rs.getString("m_userid"));
				cart.setC_amount(rs.getInt("c_amount"));
				cart.setP_imgsrc(rs.getString("p_imgsrc"));
				cart.setC_sum(rs.getInt("c_sum"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_kinds(rs.getString("p_kinds"));
				list.add(cart);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public int updateOgroup(int c_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update cart set o_group=o_no.currval where c_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateOgroup 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	public List<CartDTO> ListselectCart4(int o_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from cart where o_group = ?";
		List<CartDTO> list = new ArrayList<CartDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, o_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setC_no(rs.getInt("c_no"));
				cart.setP_no(rs.getString("p_no"));
				cart.setM_userid(rs.getString("m_userid"));
				cart.setC_amount(rs.getInt("c_amount"));
				cart.setP_imgsrc(rs.getString("p_imgsrc"));
				cart.setC_sum(rs.getInt("c_sum"));
				cart.setP_name(rs.getString("p_name"));
				cart.setP_kinds(rs.getString("p_kinds"));
				cart.setO_group(rs.getInt("o_group"));
				list.add(cart);
			}
		}catch (Exception e) {
			System.out.println("[에러]ListselectCart4 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}