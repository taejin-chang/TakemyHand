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
	
	int r_no=Integer.parseInt(mr.getParameter("r_no"));
	int r_status=0;
	String r_title=mr.getParameter("r_title");
	String r_content=mr.getParameter("content");
	
	String img=mr.getFilesystemName("img1");
	
	ReviewDTO review=new ReviewDTO();
	review.setR_title(r_title);
	review.setR_content(r_content);
	review.setStatus(r_status);
	review.setR_img(img);
	review.setR_no(r_no);
	
	ReviewDAO.getDao().updateReview(review);

	response.sendRedirect("review.jsp?pageNum="+pageNum);  

	
	%>