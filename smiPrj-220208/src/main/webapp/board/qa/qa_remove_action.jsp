<%@page import="InteriorDAO.QuestionDAO"%>
<%@page import="InteriorDTO.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("q_no")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;	
	}
	

	int q_no=Integer.parseInt(request.getParameter("q_no"));
	
	QuestionDTO qa=QuestionDAO.getDAO().selectQna(q_no);
	
	if(qa==null || qa.getQ_status()=="9") {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;	
	}
	/*
	//로그인 사용자가 게시글 작성자가 아니거나 관리자가 아닌 경우 => 비정상적인 요청에 대한 응답 처리 
	if(!loginMember.getId().equals(board.getId()) && loginMember.getStatus()!=9) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;	
	}
	*/
	QuestionDAO.getDAO().removeQna(q_no);
	
	
	response.sendRedirect("qa.jsp");  
	
%>