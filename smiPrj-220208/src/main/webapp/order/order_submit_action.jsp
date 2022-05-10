<%@page import="InteriorDAO.CartDAO"%>
<%@page import="InteriorDAO.OrdersDAO"%>
<%@page import="InteriorDTO.OrdersDTO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%request.setCharacterEncoding("utf-8");%>
    
<%
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	//String str[] = request.getParameterValues("checkRow");
	//System.out.println(str);
	//int nums[] = new int[str.length];
	String[] c_no = request.getParameterValues("checkRow");
	int[] c_noList = new int[c_no.length];
	
	for(int i=0; i<c_no.length; i++) {
	      c_noList[i] = Integer.parseInt(c_no[i]);
	    }

	String m_userid=loginMember.getM_userid();
	String o_guest=request.getParameter("receiver");
	String zipcode=request.getParameter("zipcode");
	String m_add1=request.getParameter("add1");
	String m_add2=request.getParameter("add2");
	String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
	String o_msg=request.getParameter("msg");
	int o_amount=c_no.length;
	int o_price=Integer.parseInt(request.getParameter("cnt"));
	
	OrdersDTO order=new OrdersDTO();
	order.setM_userid(m_userid);
	order.setM_tel(tel);
	order.setO_amount(o_amount);
	order.setO_guest(o_guest);
	order.setZipcode(zipcode);
	order.setM_add1(m_add1);
	order.setM_add2(m_add2);
	order.setO_msg(o_msg);
	order.setP_no("0");
	order.setO_price(o_price);
	
	int row = OrdersDAO.getDAO().insertOrder(order);
	if(row==1) {
		for(int cartno:c_noList) {
			row = CartDAO.getDAO().updateOgroup(cartno);
		}
	}
	
	%> 
	
	 <% if(row==1) { %>
		<script type="text/javascript">
			alert("해당 물품 주문이 완료되었습니다");
			location.href="../myshop/orderList.jsp";
		</script>
	<%  } else { %> 
		<script type="text/javascript">
		alert("해당 물품 주문이 실패하였습니다.");
		location.href="../index.jsp";
		</script>
	  	
	 <% } %>
  
  
  
  
  