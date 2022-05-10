package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.MemberDTO;
import InteriorDTO.ProductDTO;
import Util.JdbcDAO;

public class ProductDAO extends JdbcDAO {
	private ProductDAO() {};
	 
	private static ProductDAO DAO = new ProductDAO();
	
	public static ProductDAO getDAO() {
		return DAO;
	}
	
	public List<ProductDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from product";
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product  = new ProductDTO();
				product.setP_no(rs.getString("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_kinds(rs.getString("p_kinds"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_amount(rs.getInt("p_amount"));
				product.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(product);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public int insertProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql = "insert into product values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getP_no());
			pstmt.setString(2, product.getP_name());
			pstmt.setString(3, product.getP_kinds());
			pstmt.setInt(4, product.getP_price());
			pstmt.setInt(5, product.getP_amount());
			pstmt.setString(6, product.getP_imgsrc());
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("[에러]insertProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public List<ProductDTO> selectProductList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select * from (select rownum rn, temp.* from (select * from light union all select * from ptlight union all "
					+ " select * from deco union all select * from homegallery union all select * from dly "
					+ " union all select * from bookshelf union all select * from drawer union all select * from furniture) temp order by p_no) where rn between ? and ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setP_no(rs.getString("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_kinds(rs.getString("p_kinds"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_amount(rs.getInt("p_amount"));
				product.setP_imgsrc(rs.getString("p_imgsrc"));
				productList.add(product);
			}
		} catch(SQLException e ) {
			System.out.println("[에러]selectProductList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return productList;
	}
	
	public List<ProductDTO> selectProductLists(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {//검색 사용 X
				if(keyword.equals("")) {//모든 상품을 검색할 경우
					String sql="select * from (select rownum rn, temp.* from (select * from light union all select * from ptlight union all "
							+ "select * from deco union all select * from homegallery union all select * from dly "
							+ "union all select * from bookshelf union all select * from drawer union all select * from furniture) temp order by p_no) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				} 
				
			} else {
					String sql="select * from (select rownum rn, temp.* from "
							+ " (select * from light union all select * from ptlight union all "
							+ " select * from deco union all select * from homegallery union all select * from dly "
							+ " union all select * from bookshelf union all select * from drawer union all select * from furniture) temp where "+search+" like '%'||?||'%' order by p_no) temp) where "
							+ " rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, keyword);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setP_no(rs.getString("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_kinds(rs.getString("p_kinds"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_amount(rs.getInt("p_amount"));
				product.setP_imgsrc(rs.getString("p_imgsrc"));
				productList.add(product);
			}
			
		} catch(SQLException e ) {
			System.out.println("[에러]selectProductList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return productList;
	}
		
	public ProductDTO searchProduct(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDTO product=null;

		try {
			con=getConnection();
			
			String sql="select rownum rn, temp.* from (select * from light union all select * from ptlight union all "
					+ " select * from deco union all select * from homegallery union all select * from dly "
					+ " union all select * from bookshelf union all select * from drawer union all select * from furniture) temp where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			
			rs=pstmt.executeQuery();

			if(rs.next()) {
				product=new ProductDTO();
				product.setP_no(rs.getString("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_kinds(rs.getString("p_kinds"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_amount(rs.getInt("p_amount"));
				product.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		} catch(SQLException e) {
			System.out.println("[에러]searchProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}
	/*
	//상품의 총 개수를 검색하여 반환하는 메소드
	public int selectCountProduct(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
					
				String sql="select count(*) from product";
				pstmt=con.prepareStatement(sql);
					
			} else {
				String sql="select count(*) from product where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]searchCountProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
	*/
	
	//상품의 총 개수를 검색하여 반환하는 메소드
	public int selectCountProduct(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			if(keyword.equals("")) {
				String sql="select count(*) from (select * from light union all select * from ptlight union all"
						+ " select * from deco union all select * from homegallery union all select * from dly"
						+ " union all select * from bookshelf union all select * from drawer union all select * from furniture)";
				pstmt=con.prepareStatement(sql);
					
			} else {
				String sql="select count(*) from (select rownum rn, temp.* from (select * from light union all select * from ptlight union all "
						+ " select * from deco union all select * from homegallery union all select * from dly "
						+ " union all select * from bookshelf union all select * from drawer union all select * from furniture) temp order by p_no)"
						+ " where "+search+" like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch(SQLException e) {
			System.out.println("[에러]searchCountProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt,rs);
		} return count;
	}
	
	public int updateProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql = "update temp. (select * from light union all select * from ptlight union all "
					+ " select * from deco union all select * from homegallery union all select * from dly "
					+ " union all select * from bookshelf union all select * from drawer union all select * from furniture) temp set p_name=?, p_kinds=?, p_price=?, p_amount=?, p_imgsrc=? where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getP_name());
			pstmt.setString(2, product.getP_kinds());
			pstmt.setInt(3, product.getP_price());
			pstmt.setInt(4, product.getP_amount());
			pstmt.setString(5, product.getP_imgsrc());
			pstmt.setString(6, product.getP_no());
			
			rows=pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("[에러]updateProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int removeProduct(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from product where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]removeProduct 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public List<ProductDTO> selectProductLists() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			String sql="select rownum rn, temp.* from (select * from light union all select * from ptlight union all "
					+ "select * from deco union all select * from homegallery union all select * from dly "
					+ "union all select * from bookshelf union all select * from drawer union all select * from furniture) temp order by p_no";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setP_no(rs.getString("p_no"));
				product.setP_name(rs.getString("p_name"));
				product.setP_kinds(rs.getString("p_kinds"));
				product.setP_price(rs.getInt("p_price"));
				product.setP_amount(rs.getInt("p_amount"));
				product.setP_imgsrc(rs.getString("p_imgsrc"));
				productList.add(product);
			}
		} catch(SQLException e ) {
			System.out.println("[에러]selectProductList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return productList;
	}
	
}
