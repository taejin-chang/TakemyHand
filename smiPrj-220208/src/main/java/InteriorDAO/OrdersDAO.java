package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.CartDTO;
import InteriorDTO.MemberDTO;
import InteriorDTO.OrdersDTO;
import InteriorDTO.PtlightDTO;
import Util.JdbcDAO;

public class OrdersDAO extends JdbcDAO {
	private static OrdersDAO _dao;
	
	private OrdersDAO() {
		
	}
	
	static {
		_dao=new OrdersDAO();
	}
	
	public static OrdersDAO getDAO() {
		return _dao;
	}
	
	public List<OrdersDTO> selectOrdersList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrdersDTO> orderList=new ArrayList<OrdersDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {//검색 사용 X
				if(keyword.equals("")) {//모든 상품을 검색할 경우
					String sql=" select * from (select rownum rn, temp.* from "
							+ "(select * from orders order by o_no) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} else {//상품번호로 검색할 경우
					String sql="select * from orders where o_no=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
				}
			
			} else {
					String sql="select * from (select rownum rn, temp.* from "
							+ "(select * from orders where "+search+ " like '%'||?||'%' order by o_no) temp) where "
							+ "rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrdersDTO orders=new OrdersDTO();
				orders.setO_no(rs.getInt("o_no"));
				orders.setM_userid(rs.getString("m_userid"));
				orders.setM_tel(rs.getString("m_tel"));
				orders.setO_amount(rs.getInt("o_amount"));
				orders.setM_add1(rs.getString("m_add1"));
				orders.setM_add2(rs.getString("m_add2"));
				orders.setO_stat(rs.getString("o_stat"));
				orders.setO_msg(rs.getString("o_msg"));
				orders.setP_no(rs.getString("p_no"));
				orderList.add(orders);
			}
			
		} catch(SQLException e ) {
			System.out.println("[에러]selectOrdersList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return orderList;
	}
	
	public OrdersDTO searchOrders(String userid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		OrdersDTO orders=null;

		try {
			con=getConnection();
			
			String sql="select * from orders where m_userid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				orders=new OrdersDTO();
				orders.setO_no(rs.getInt("o_no"));
				orders.setM_userid(rs.getString("m_userid"));
				orders.setM_tel(rs.getString("m_tel"));
				orders.setZipcode(rs.getString("zipcode"));
				orders.setO_price(rs.getInt("o_price"));
				orders.setO_amount(rs.getInt("o_amount"));
				orders.setM_add1(rs.getString("m_add1"));
				orders.setM_add2(rs.getString("m_add2"));
				orders.setO_stat(rs.getString("o_stat"));
				orders.setO_msg(rs.getString("o_msg"));
				orders.setP_no(rs.getString("p_no"));
				orders.setO_guest(rs.getString("o_guest"));
			}
		} catch(SQLException e) {
			System.out.println("[에러]searchOrders 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return orders;
	}
	
	public List<OrdersDTO> ListSelects (String userid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<OrdersDTO> list = new ArrayList<OrdersDTO>();
		String sql="select * from orders where m_userid=?";
		try {
			con=getConnection();			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userid);			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
	            OrdersDTO orders=new OrdersDTO();
	            orders.setO_no(rs.getInt("o_no"));
	            orders.setM_userid(rs.getString("m_userid"));
	            orders.setM_tel(rs.getString("m_tel"));
	            orders.setZipcode(rs.getString("zipcode"));
	            orders.setO_price(rs.getInt("o_price"));
	            orders.setO_amount(rs.getInt("o_amount"));
	            orders.setM_add1(rs.getString("m_add1"));
	            orders.setM_add2(rs.getString("m_add2"));
	            orders.setO_stat(rs.getString("o_stat"));
	            orders.setO_msg(rs.getString("o_msg"));
	            orders.setP_no(rs.getString("p_no"));
	            orders.setO_guest(rs.getString("o_guest"));
	            list.add(orders);

			}
		} catch(SQLException e) {
			System.out.println("[에러]searchOrders 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	//주문의 총 개수를 검색하여 반환하는 메소드
	public int selectCountOrders(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
					
				String sql="select count(*) from orders";
				pstmt=con.prepareStatement(sql);
					
			} else {
				String sql="select count(*) from orders where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]selectCountOrders 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
	
	public int insertOrder(OrdersDTO orders) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
					
			String sql="insert into orders(o_no,m_userid,m_tel,o_amount,o_guest,zipcode,m_add1,m_add2,o_stat,o_msg,p_no,o_price) values(o_no.nextval,?,?,?,?,?,?,?,'1',?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, orders.getM_userid());
			pstmt.setString(2, orders.getM_tel());
			pstmt.setInt(3, orders.getO_amount());
			pstmt.setString(4, orders.getO_guest());
			pstmt.setString(5, orders.getZipcode());
			pstmt.setString(6, orders.getM_add1());
			pstmt.setString(7, orders.getM_add2());
			pstmt.setString(8, orders.getO_msg());
			pstmt.setString(9, orders.getP_no());
			pstmt.setInt(10, orders.getO_price());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertOrder 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int OrderCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from orders order by o_no desc";
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
}
