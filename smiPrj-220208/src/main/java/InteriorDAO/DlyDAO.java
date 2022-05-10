package InteriorDAO;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import InteriorDTO.DlyDTO;
import Util.JdbcDAO;

public class DlyDAO extends JdbcDAO {
	private DlyDAO() {};
	 
	private static DlyDAO DAO = new DlyDAO();
	
	public static DlyDAO getDAO() {
		return DAO;
	}
	
	public List<DlyDTO> ListSelectProduct() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from dly";
		List<DlyDTO> list = new ArrayList<DlyDTO>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DlyDTO dly  = new DlyDTO();
				dly.setP_no(rs.getString("p_no"));
				dly.setP_name(rs.getString("p_name"));
				dly.setP_kinds(rs.getString("p_kinds"));
				dly.setP_price(rs.getInt("p_price"));
				dly.setP_amount(rs.getInt("p_amount"));
				dly.setP_imgsrc(rs.getString("p_imgsrc"));
				list.add(dly);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	public DlyDTO SelectProduct(String p_no){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String query = "select * from dly where p_no=?";
		DlyDTO dly = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dly  = new DlyDTO();
				dly.setP_no(rs.getString("p_no"));
				dly.setP_name(rs.getString("p_name"));
				dly.setP_kinds(rs.getString("p_kinds"));
				dly.setP_price(rs.getInt("p_price"));
				dly.setP_amount(rs.getInt("p_amount"));
				dly.setP_imgsrc(rs.getString("p_imgsrc"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return dly;
	}
	
	public DlyDTO selectIdMember(String p_no) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DlyDTO dly=null;
		try {
			con=getConnection();
			String sql="select * from dly where p_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dly =new DlyDTO();
				dly.setP_no(rs.getString("p_no"));
				dly.setP_name(rs.getString("p_name"));
				dly.setP_kinds(rs.getString("p_kinds"));
				dly.setP_price(rs.getInt("p_price"));
				dly.setP_amount(rs.getInt("p_amount"));
				dly.setP_imgsrc(rs.getString("p_imgsrc"));
				
				
			}
		} catch (SQLException e) {
			System.out.println("[����]selectIdMember �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return dly;
	}
	
	//ȸ�������� ���޹޾� MEMBER ���̺� �����Ͽ� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	public int insertDly(DlyDTO dly) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			String sql="insert into dly values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dly.getP_no());
			pstmt.setString(2, dly.getP_name());
			pstmt.setString(3, dly.getP_kinds());
			pstmt.setInt(4, dly.getP_price());
			pstmt.setInt(5, dly.getP_amount());
			pstmt.setString(6, dly.getP_imgsrc());
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]insertMember �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	public DlyDTO selectDly(DlyDTO dly) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from dly p_no desc";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dly = new DlyDTO();
				dly.setP_no(rs.getString("p_no"));
				dly.setP_name(rs.getString("p_name"));
				dly.setP_kinds(rs.getString("p_kinds"));
				dly.setP_price(rs.getInt("p_price"));
				dly.setP_amount(rs.getInt("p_amount"));
				dly.setP_imgsrc(rs.getString("p_imgsrc"));		
			}
		} catch (SQLException e) {
			System.out.println("[����]selectIdMember �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return dly;
	}
	
	public int DlyCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from dly order by p_no desc";
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
	public List<DlyDTO> DlySearchList(int startpage, int endpage) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
						// "select X.* from (select rownum as rnum, A.*"
		String query = "select X.* from (select rownum as rnum, A.* from ("
				+ "select * from dly order by p_no desc) A "
				+ "where rownum <=? ) X where X.rnum >= ?";
		List<DlyDTO> list = new ArrayList<DlyDTO>(); // ���� �� ����
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, endpage);
			pstmt.setInt(2, startpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DlyDTO dly = new DlyDTO();
				dly.setP_no(rs.getString("p_no"));
				dly.setP_name(rs.getString("p_name"));
				dly.setP_kinds(rs.getString("p_kinds"));
				dly.setP_price(rs.getInt("p_price"));
				dly.setP_amount(rs.getInt("p_amount"));
				dly.setP_imgsrc(rs.getString("p_imgsrc"));	
				list.add(dly);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return list;
	}	
	
	// �˻����ǿ� �´�  ���� ��ü �Խñ� �Ѽ��� ���ϴ� �޼ҵ�
	public int DlyCount(String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		String query="select count(*) from dly where " + search + " like '%" + search + "%'";
//		String query2="select count(*) from tbl_guest4 where " + s_query; 
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, pstmt,rs);
		}
		return row;
	}
	
	
	
	public static String pageList(int page,int totpage,String url,String addtag) {
		int idx_pre, idx_start;
		  	
		String s_pre = "";    // Prev ���� ����
		String s_idx = "";    // ��ȣ ���� ����
		String s_next = "";   // Next ���� ����

		idx_start = ((page-1) / 10) * 10 + 1 ;  // ���� ������ ���
		idx_pre = ((page-1) / 10);              // Priview ������ ���

	  	// Prev ǥ�� �κ�
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*10)+addtag+"'>"
	  				+ "<img src=../Guest/img/i_prev.gif width=30 height=7></a>";
	  	} else {
	  		s_pre = "<img src=../Guest/img/i_prev.gif width=30 height=7> ";
	  	}

	  	// ��ȣ ǥ�úκ�	
	  	for(int i=0;i<10;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + addtag + "'> " + idx_start + " </a> ";
	  		}
	  	}
		// Next ǥ�úκ�
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+addtag+"'>"
	  				+ "<img src=../Guest/img/i_next.gif width=30 height=7></a>";
	  	} else {
	  		s_next = " <img src=../Guest/img/i_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next;  // Html �� ����
	  	return outHtml;
	}
	
	public static String pageListHan(int page,int totpage,String url,String query, String key) {
		int idx_pre, idx_start;
		  	
		String s_pre = "";    // Prev ���� ����
		String s_idx = "";    // ��ȣ ���� ����
		String s_next = "";   // Next ���� ����

		idx_start = ((page-1) / 10) * 10 + 1 ;  // ���� ������ ���
		idx_pre = ((page-1) / 10);              // Priview ������ ���

	  	// Prev ǥ�� �κ�
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*10)+"&search="+query+"&key="+ URLEncoder.encode(key)+"'>"
	  				+ "<img src=../Guest/img/i_prev.gif width=30 height=7></a>";
	  	} else {
	  		s_pre = "<img src=../Guest/img/i_prev.gif width=30 height=7> ";
	  	}

	  	// ��ȣ ǥ�úκ�	
	  	for(int i=0;i<10;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + "&search="+query+"&key=" + URLEncoder.encode(key) + "'> " + idx_start + " </a> ";
	  		}
	  	}
		// Next ǥ�úκ�
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+ "&search="+query+"&key="+ URLEncoder.encode(key)+"'>"
	  				+ "<img src=../Guest/img/i_next.gif width=30 height=7></a>";
	  	} else {
	  		s_next = " <img src=../Guest/img/i_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next;  // Html �� ����
	  	return outHtml;
	}
	public List<DlyDTO> selectProductList(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DlyDTO> dlyList=new ArrayList<DlyDTO>();
		try {
			con=getConnection();
			
			String sql="select * from (select rownum rn, temp.* from (select * from light union all select * from ptlight union all "
					+ "select * from deco union all select * from homegallery union all select * from dly union all "
					+ "select * from bookshelf union all select * from drawer union all select * from furniture) temp order by p_no) where rn between ? and ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DlyDTO dly=new DlyDTO();
				dly.setP_no(rs.getString("p_no"));
				dly.setP_name(rs.getString("p_name"));
				dly.setP_kinds(rs.getString("p_kinds"));
				dly.setP_price(rs.getInt("p_price"));
				dly.setP_amount(rs.getInt("p_amount"));
				dly.setP_imgsrc(rs.getString("p_imgsrc"));
				dlyList.add(dly);
			}
		} catch(SQLException e ) {
			System.out.println("[에러]selectProductList 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con,pstmt, rs);
		}
		return dlyList;
	}
	
	//상품의 총 개수를 검색하여 반환하는 메소드
		public int selectCountProduct(String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				if(keyword.equals("")) {
						
					String sql="select count(*) from temp (select * from light union all select * from ptlight union all"
							+ "select * from deco union all select * from homegallery union all select * from dly"
							+ "union all select * from bookshelf union all select * from drawer union all select * from furniture) temp";
					pstmt=con.prepareStatement(sql);
						
				} else {
					String sql="select count(*) from (select rownum rn, temp.* from (select * from light union all select * from ptlight union all"
							+ "select * from deco union all select * from homegallery union all select * from dly"
							+ "union all select * from bookshelf union all select * from drawer union all select * from furniture) temp order by p_no) "
							+ "where "+search+" like '%'||?||'%'";
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
}
