<%@page import="InteriorDTO.BoardDTO"%>
<%@page import="InteriorDAO.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="Util.Utility"%>
<%@page import="javax.management.relation.InvalidRelationIdException"%>
<%@page import="InteriorDTO.ReviewDTO"%>
<%@page import="InteriorDAO.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	String saveDirectory=request.getServletContext().getRealPath("/web/images/review-img");
	
	MultipartRequest mr=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String pageNum=mr.getParameter("pageNum");
	String subject=mr.getParameter("subject");
	String rcontent=mr.getParameter("rcontent");
	String img1=mr.getFilesystemName("img1");
	String m_userid=request.getParameter("m_userid");
	String p_no="";
	int b_status=0;
	int ref=Integer.parseInt(mr.getParameter("ref"));
	int restep=Integer.parseInt(mr.getParameter("reStep"));
	int relevel=Integer.parseInt(mr.getParameter("reLevel"));
	if(p_no!="") {
		p_no=mr.getParameter("p_no");
	}
	if(b_status!=0) {
		b_status=Integer.parseInt(mr.getParameter("b_status"));
	}
	
	int num=BoardDAO.getDAO().selectNextNum();

	if(ref==0) {
		ref=num;
	} else {
		BoardDAO.getDAO().updateRStep(ref, restep);
		
		restep++;
		relevel++;
		
	}
	BoardDTO board=new BoardDTO();
	board.setB_no(num);
	board.setM_userid(m_userid);
	board.setB_title(subject);
	board.setB_content(rcontent);
	board.setB_img(img1);
	board.setP_no(p_no);
	board.setStatus(b_status);
	board.setRef(ref);
	board.setRestep(restep);
	board.setRelevel(relevel);
	
	int row= BoardDAO.getDAO().insertBoard(board);
	//response.sendRedirect("review.jsp?pageNum="+pageNum);  
	
	response.sendRedirect("freeboard.jsp?pageNum="+pageNum);  
	
	%>