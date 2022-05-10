<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getParameter("m_grade")==null || request.getParameter("m_userid")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	
		String m_userid=request.getParameter("m_userid");
		String m_passwd=request.getParameter("m_passwd");
		String m_tel=request.getParameter("m_tel");
		String m_email=request.getParameter("m_email");
		String m_name=request.getParameter("m_name");
		int m_grade=Integer.parseInt(request.getParameter("m_grade"));
		String m_last_login=request.getParameter("m_last_login");
		
		MemberDTO member=new MemberDTO();
		member.setM_email(m_email);
		member.setM_grade(m_grade);
		member.setM_name(m_name);
		member.setM_passwd(m_passwd);
		member.setM_tel(m_tel);
		member.setM_userid(m_userid);
		
		MemberDAO.getDAO().updateMember1(member);
		
		response.sendRedirect("member_manager.jsp");  
%>

