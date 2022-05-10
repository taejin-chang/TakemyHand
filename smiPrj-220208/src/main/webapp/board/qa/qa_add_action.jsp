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
	
	//String saveDirectory=request.getServletContext().getRealPath("/web/images/qa_img");

	//MultipartRequest mr = new MultipartRequest(request, saveDirectory, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	int ref=Integer.parseInt(request.getParameter("ref"));
	int reStep=Integer.parseInt(request.getParameter("reStep"));
	int reLevel=Integer.parseInt(request.getParameter("reLevel"));
	String pageNum=request.getParameter("pageNum");

	int q_no=QuestionDAO.getDAO().selectNextNum();
	
	if(ref==0) {//새글인 경우
		ref=q_no;
	} else {//답글인 경우 - ref, reStep, reLevel 변수에 부모글의 전달값이 저장
		QuestionDAO.getDAO().updateReStep(ref, reStep);
		
		reStep++;
		reLevel++;
		
	}
	
	String q_status=request.getParameter("q_status");
	String m_userid=request.getParameter("m_userid");
	String q_title=request.getParameter("q_title");
	String q_content=request.getParameter("content");
	
	System.out.println(m_userid);
	System.out.println(q_title);
	System.out.println(q_content);
	
	QuestionDTO qa=new QuestionDTO();
	qa.setM_userid(m_userid);
	qa.setQ_title(q_title);
	qa.setQ_content(q_content);
	qa.setQ_status(q_status);
	qa.setRef(ref);
	qa.setReLevel(reLevel);
	qa.setReStep(reStep);
	qa.setQ_no(q_no);
	
	int row=QuestionDAO.getDAO().insertQna(qa);
	
	response.sendRedirect("qa.jsp?pageNum="+pageNum);  
	
%>

