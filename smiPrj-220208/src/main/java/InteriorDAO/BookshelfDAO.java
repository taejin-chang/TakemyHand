package InteriorDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.BookshelfDTO;
import InteriorDTO.DlyDTO;
import Util.JdbcDAO;

public class BookshelfDAO extends JdbcDAO {
	private BookshelfDAO() {};
	 
	private static BookshelfDAO DAO = new BookshelfDAO();
	
	public static BookshelfDAO getDAO() {
		return DAO;
	}
	
	public List<BookshelfDTO> ListSelectProduct(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from bookshelf";
		List<BookshelfDTO> list = new ArrayList<BookshelfDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookshelfDTO bookshelf  = new BookshelfDTO();
				bookshelf.setP_no(rs.getString("p_no"));
				bookshelf.setP_name(rs.getString("p_name"));
				bookshelf.setP_kinds(rs.getString("p_kinds"));
				bookshelf.setP_price(rs.getInt("p_price"));
				bookshelf.setP_amount(rs.getInt("p_amount"));
				bookshelf.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(bookshelf);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public BookshelfDTO selectbookshelfPno(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BookshelfDTO bookshelf=null;
		try {
			con=getConnection();
			String sql="select * from bookshelf where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bookshelf =new BookshelfDTO();
				bookshelf.setP_no(rs.getString("p_no"));
				bookshelf.setP_name(rs.getString("p_name"));
				bookshelf.setP_kinds(rs.getString("p_kinds"));
				bookshelf.setP_price(rs.getInt("p_price"));
				bookshelf.setP_amount(rs.getInt("p_amount"));
				bookshelf.setP_imgsrc(rs.getString("p_imgsrc"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return bookshelf;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하여 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertBookshelf(BookshelfDTO bookshelf) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into bookshelf values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bookshelf.getP_no());
			pstmt.setString(2, bookshelf.getP_name());
			pstmt.setString(3, bookshelf.getP_kinds());
			pstmt.setInt(4, bookshelf.getP_price());
			pstmt.setInt(5, bookshelf.getP_amount());
			pstmt.setString(6, bookshelf.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public BookshelfDTO selectBookshelf(BookshelfDTO bookshelf) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from bookshelf p_no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bookshelf = new BookshelfDTO();
				bookshelf.setP_no(rs.getString("p_no"));
				bookshelf.setP_name(rs.getString("p_name"));
				bookshelf.setP_kinds(rs.getString("p_kinds"));
				bookshelf.setP_price(rs.getInt("p_price"));
				bookshelf.setP_amount(rs.getInt("p_amount"));
				bookshelf.setP_imgsrc(rs.getString("p_imgsrc"));		
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdMember 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return bookshelf;
	}
	
	public int BookshelfCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from Bookshelf order by p_no desc";
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
	public List<BookshelfDTO> BookshelfSearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from bookshelf order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<BookshelfDTO> list = new ArrayList<BookshelfDTO>(); // 리턴 값 정의
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookshelfDTO bookshelf = new BookshelfDTO();
				bookshelf.setP_no(rs.getString("p_no"));
				bookshelf.setP_name(rs.getString("p_name"));
				bookshelf.setP_kinds(rs.getString("p_kinds"));
				bookshelf.setP_price(rs.getInt("p_price"));
				bookshelf.setP_amount(rs.getInt("p_amount"));
				bookshelf.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(bookshelf);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	
	public BookshelfDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from bookshelf where p_no=?";
		BookshelfDTO bookshelf = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bookshelf  = new BookshelfDTO();
				bookshelf.setP_no(rs.getString("p_no"));
				bookshelf.setP_name(rs.getString("p_name"));
				bookshelf.setP_kinds(rs.getString("p_kinds"));
				bookshelf.setP_price(rs.getInt("p_price"));
				bookshelf.setP_amount(rs.getInt("p_amount"));
				bookshelf.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return bookshelf;
	}
	
}
