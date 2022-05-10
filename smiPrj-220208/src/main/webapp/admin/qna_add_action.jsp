<%@page import="InteriorDAO.NoticeDAO"%>
<%@page import="InteriorDTO.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	

	String m_userid=request.getParameter("id");
	String n_title=request.getParameter("n_title");
	String n_content=request.getParameter("n_content");
	
	
	NoticeDTO notice=new NoticeDTO();
	notice.setM_userid(m_userid);
	notice.setN_title(n_title);
	notice.setN_content(n_content);
	int row=NoticeDAO.getDAO().insertNotice(notice);
	
	response.sendRedirect("notice_manager.jsp");  
	
%>

