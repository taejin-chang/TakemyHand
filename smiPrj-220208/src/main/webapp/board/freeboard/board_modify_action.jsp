<%@page import="InteriorDAO.BoardDAO"%>
<%@page import="InteriorDTO.BoardDTO"%>
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
	String saveDirectory=request.getServletContext().getRealPath("/web/images/board-img");
	
	MultipartRequest mr=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String pageNum=mr.getParameter("pageNum");
	
	int b_no=Integer.parseInt(mr.getParameter("b_no"));
	int b_status=0;
	String b_title=mr.getParameter("b_title");
	String b_content=mr.getParameter("content");
	
	String img=mr.getFilesystemName("img1");
	
	BoardDTO board=new BoardDTO();
	board.setB_title(b_title);
	board.setB_content(b_content);
	board.setStatus(b_status);
	board.setB_img(img);
	board.setB_no(b_no);
	BoardDAO.getDAO().updateBoard(board);

	response.sendRedirect("freeboard.jsp?pageNum="+pageNum);  

	
	%>