<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 메인페이지(index.jsp)로 이동 --%>    
<%
	//로그아웃 처리 : 세션에 저장된 권한 관련 정보를 제거
	//session.removeAttribute("loginMember");
	session.invalidate();
	
	//페이지 이동
	response.sendRedirect("login.jsp");
%>