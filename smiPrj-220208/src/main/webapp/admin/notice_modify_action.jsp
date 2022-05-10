<%@page import="InteriorDAO.NoticeDAO"%>
<%@page import="InteriorDTO.NoticeDTO"%>
<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getParameter("n_no")==null || request.getParameter("m_userid")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	
		int n_no=Integer.parseInt(request.getParameter("n_no"));
		String n_title=request.getParameter("n_title");
		String n_content=request.getParameter("n_content");
		
		NoticeDTO notice=new NoticeDTO();
		notice.setN_no(n_no);
		notice.setN_title(n_title);
		notice.setN_content(n_content);
		
		NoticeDAO.getDAO().updateNotice(notice);
		
		response.sendRedirect("notice_manager.jsp");  
%>

