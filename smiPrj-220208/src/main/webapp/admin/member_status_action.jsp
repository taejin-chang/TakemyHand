<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getParameter("m_userid")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	
		String m_userid=request.getParameter("m_userid");
		
		MemberDTO member=new MemberDTO();
		member.setM_userid(m_userid);
		
		MemberDAO.getDAO().updateGrade(m_userid);
		
		response.sendRedirect("member_manager.jsp");  
%>