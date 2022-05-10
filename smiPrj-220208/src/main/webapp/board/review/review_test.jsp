<%@page import="InteriorDAO.ReviewDAO"%>
<%@page import="InteriorDTO.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- BOARD 테이블에 게시글(새글)을 500개 저장하는 JSP 문서 - 테스트 프로그램 --%>
<%
	for(int i=1;i<=100;i++) {
		ReviewDTO review=new ReviewDTO();
		String n = Integer.toString(i);
		review.setM_userid("abcd"+i);
		review.setR_title("이자식"+i);
		review.setR_content("11111");
		review.setR_img("");
		review.setP_no("");
		review.setStatus(0);
		review.setRef(0);
		review.setRestep(0);
		review.setRelevel(0);
		ReviewDAO.getDao().insertReview(review);
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