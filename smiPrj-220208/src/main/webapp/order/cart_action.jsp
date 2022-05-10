<%@page import="InteriorDAO.CartDAO"%>
<%@page import="InteriorDTO.CartDTO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@page import="InteriorDTO.DlyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<%MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	String p_no = request.getParameter("p_no");     
	int quantity2 = Integer.parseInt(request.getParameter("quantity2")); 
	String p_imgsrc = request.getParameter("p_imgsrc");    
	int sum = Integer.parseInt(request.getParameter("sum"));        
	String p_name = request.getParameter("p_name");    
	String p_kinds = request.getParameter("p_kinds");   

	

	CartDTO cart = new CartDTO();
	cart.setP_no(p_no);
	cart.setM_userid(loginMember.getM_userid());
	cart.setC_amount(quantity2);
	cart.setP_imgsrc(p_imgsrc);
	cart.setC_sum(sum);
	cart.setP_name(p_name);
	cart.setP_kinds(p_kinds);
	//session.setAttribute("cart", cart);
	int row = CartDAO.getDAO().insertCart(cart);
	//session.setAttribute("row", row);
	if(row==1){
	System.out.println("등록성공");
	//System.out.println(cart.getC_no());
	//RequestDispatcher dispatcher = request.getRequestDispatcher("basket.jsp");
	//dispatcher.forward(request, response);
	response.sendRedirect("basket.jsp");
	}else{
		System.out.println("등록실패");
	}
%>
	

