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
	
	int r_no=ReviewDAO.getDao().selectNextNum();
	
	String saveDirectory=request.getServletContext().getRealPath("/web/images/review-img");
	
	MultipartRequest mr=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	
	int ref=Integer.parseInt(mr.getParameter("ref"));
	int reStep=Integer.parseInt(mr.getParameter("reStep"));
	int reLevel=Integer.parseInt(mr.getParameter("reLevel"));
	String pageNum=mr.getParameter("pageNum");
	String subject=mr.getParameter("subject");
	String rcontent=mr.getParameter("rcontent");
	String img1=mr.getFilesystemName("img1");
	String m_userid=mr.getParameter("m_userid");

	if(ref==0) {//새글인 경우
		ref=r_no;
	} else {//답글인 경우 - ref, reStep, reLevel 변수에 부모글의 전달값이 저장
		ReviewDAO.getDao().updateRStep(ref, reStep);
		
		reStep++;
		reLevel++;
		
	}

	ReviewDTO review=new ReviewDTO();
	review.setM_userid(m_userid);
	review.setR_title(subject);
	review.setR_content(rcontent);
	review.setR_img(img1);
	review.setRef(ref);
	review.setRelevel(reLevel);
	review.setRestep(reStep);
	review.setR_no(r_no);
	
	int row= ReviewDAO.getDao().insertReview(review);
	//response.sendRedirect("review.jsp?pageNum="+pageNum);  
	
	response.sendRedirect("review.jsp?pageNum="+pageNum);  

	
	%>