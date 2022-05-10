<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- BOARD 테이블에 게시글(새글)을 500개 저장하는 JSP 문서 - 테스트 프로그램 --%>
<%
	for(int i=6;i<=500;i++) {
		ProductDTO product=new ProductDTO();
		String n = Integer.toString(i);
		product.setP_no(n);
		product.setP_name("테스트");
		product.setP_kinds("100_homedeco");
		product.setP_price(1000);
		product.setP_amount(10000);
		product.setP_imgsrc("1.png");
		ProductDAO.getDAO().insertProduct(product);
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