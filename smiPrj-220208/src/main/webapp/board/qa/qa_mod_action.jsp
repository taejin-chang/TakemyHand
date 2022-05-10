<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="InteriorDAO.QuestionDAO"%>
<%@page import="InteriorDTO.QuestionDTO"%>
<%@page import="InteriorDAO.NoticeDAO"%>
<%@page import="InteriorDTO.NoticeDTO"%>
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
*/
	String pageNum=request.getParameter("pageNum");

	int q_no=Integer.parseInt(request.getParameter("q_no"));
	String q_status=request.getParameter("q_status");
	String q_title=request.getParameter("q_title");
	String q_content=request.getParameter("content");
	
	QuestionDTO qa=new QuestionDTO();
	qa.setQ_title(q_title);
	qa.setQ_content(q_content);
	qa.setQ_status(q_status);
	qa.setQ_no(q_no);
	
	int row=QuestionDAO.getDAO().updateQna(qa);
	
	response.sendRedirect("qa.jsp?pageNum="+pageNum);  
	
%>

