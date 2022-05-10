<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- BOARD 테이블에 게시글(새글)을 500개 저장하는 JSP 문서 - 테스트 프로그램 --%>
<%
	for(int i=1;i<=100;i++) {
		MemberDTO member=new MemberDTO();
		String n = Integer.toString(i);
		member.setM_userid("abcd"+i);
		member.setM_passwd("000000");
		member.setM_zipcode("11111");
		member.setM_add1("수원시 권선구 수원역");
		member.setM_add2("1번출구");
		member.setM_tel("010-1111-111"+i);
		member.setM_email("aaa@naver.com");
		member.setM_name("이자식"+i);
		member.setM_grade(1);
		member.setM_last_login("");
		MemberDAO.getDAO().insertMember(member);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>500개의 테스트 게시글을 저장 하였습니다.</h1>
</body>
</html>