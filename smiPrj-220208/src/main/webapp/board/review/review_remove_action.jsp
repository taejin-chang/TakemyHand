<%@page import="InteriorDAO.ReviewDAO"%>
<%@page import="InteriorDTO.ReviewDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	/*
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	
	//검색된 게시글이 없거나 삭제글인 경우 -> 비정상적인 요청에 대한 응답처리
	if(review==null || review.getStatus()==0) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;	
	}
	*/

	
	/*
	//로그인 사용자가 게시글 작성자가 아니거나 관리자가 아닌경우
	if(!loginMember.getM_userid().equals(review.getM_userid()) && loginMember.getM_grade()!=9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	*/
	
	int r_no=Integer.parseInt(request.getParameter("r_no"));	
	ReviewDTO review=ReviewDAO.getDao().selectNumReview(r_no);
	//글번호받아 게시물 삭제
	ReviewDAO.getDao().deleteReview(r_no);
	
	response.sendRedirect("review.jsp");  

	
%>
    
    
    