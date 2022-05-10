<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="Util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	
	//전달값을 반환받아 저장
	//String id=request.getParameter("id");
	//String pass=Utility.encrypt(request.getParameter("passwd"));
	
	String id = request.getParameter("id");
	String pass =request.getParameter("passwd");
	MemberDTO member = MemberDAO.getDAO().memberSelect(id,"");
	if(member==null || member.getM_grade()==0) {//아이디에 대한 인증 실패가 발생한 경우
		session.setAttribute("id", id);
		session.setAttribute("message", "입력한 아이디가 존재하지 않습니다.");
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(!member.getM_passwd().equals(pass)) {//비밀번호에 대한 인증 실패가 발생한 경우
		session.setAttribute("id", id);
		session.setAttribute("message", "입력한 아이디가 없거나 비밀번호가 맞지 않습니다.");
		response.sendRedirect("login.jsp");
		return;
	}
	session.setAttribute("loginMember", MemberDAO.getDAO().selectIdMember(id));
	
	String url=(String)session.getAttribute("url");
	if(url==null) {//기존 요청 페이지가 없는 경우 - 메인페이지 이동
		response.sendRedirect("../index.jsp");
		System.out.println("메인페이지로 이동합니다");
	} else {//기존 요청 페이지가 있는 경우 - 요청페이지 이동
		session.removeAttribute("url");
		System.out.println("로그인 전 URL주소로 이동합니다");
		response.sendRedirect(url);
	}
//	int row = MemberDAO.getDAO().loginMember(id, pass);
	
%>


