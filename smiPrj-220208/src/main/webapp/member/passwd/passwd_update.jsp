<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");%>
    
<%
	String m_passwd=request.getParameter("passwd");
	String m_userid=request.getParameter("m_userid");
	String m_name=request.getParameter("m_name");
	String m_email=request.getParameter("m_email");
	String m_tel=request.getParameter("m_tel");
	
	System.out.println(m_passwd);
	System.out.println(m_tel);

	
	if(m_email==null) {m_email="";}
	if(m_tel==null) {m_tel="";}
	
	if(m_email=="") {
		System.out.println("m_tel="+m_tel);
		int row = MemberDAO.getDAO().updatePw(m_passwd, m_name, m_tel, m_userid);
		System.out.println("row1="+row);
		if(row==1) {
			System.out.println("row2="+row);
			response.sendRedirect("find_passwd.jsp");
		} else {
			System.out.println("row3="+row);
			response.sendRedirect("find_pw_action.jsp");
		}
	} else {
		int row = MemberDAO.getDAO().updatePw(m_passwd, m_name, m_email, m_userid);
		if(row==1) {
			response.sendRedirect("find_passwd.jsp");
		} else {
			response.sendRedirect("find_pw_action.jsp");
		}
	}
%>

