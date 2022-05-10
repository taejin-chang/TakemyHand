<%@page import="InteriorDAO.OrdersDAO"%>
<%@page import="InteriorDTO.OrdersDTO"%>
<%@page import="InteriorDAO.FurnitureDAO"%>
<%@page import="InteriorDAO.DrawerDAO"%>
<%@page import="InteriorDAO.BookshelfDAO"%>
<%@page import="InteriorDAO.PtlightDAO"%>
<%@page import="InteriorDAO.LightDAO"%>
<%@page import="InteriorDAO.HomegalleryDAO"%>
<%@page import="InteriorDAO.DecoDAO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.CartDAO"%>
<%@page import="InteriorDTO.CartDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/include/header.jsp" %>
 
<%
request.setCharacterEncoding("utf-8"); 
List<OrdersDTO> list = OrdersDAO.getDAO().ListSelects(loginMember.getM_userid());

int cnt=0;
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    

<title>주문서 작성/결제</title>

<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/common/styles/common.min.css?20220127093858">
<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/common/styles/old/layout.min.css?20220127093858">

<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/order/ordsht/ordSht/styles/main.min.css?20220127093858">
<!-- jw.kim 추가 20210514 -->
<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/order/ordsht/ordSht/styles/pay.min.css?20220127093858">

<script language="javascript"
	src="https://www.vpay.co.kr/eISP/Wallet_popup_VP.js" charset="UTF-8"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



</head>


<body>

<div id="gs-content">

	<div id="wrap">
		<div class="section">

		
<div class="order-heading-container partition-step2"><!-- 장바구니 : partition-step1, 주문서작성/결제 : partition-step2, 주문완료 : partition-step3 -->
			<h2 class="heading-title">
				<strong><i></i>주문내역 조회</strong>
				
			</h2>

		</div>
	<div class="ordersheet-msg">
		<h3 class="ordersheet-title">주문내역 조회 테이블</h3><p style="text-align:right; left:700px; font-size:15px; font-weight: bold;" >전체 주문 수 : <%=OrdersDAO.getDAO().OrderCount() %>개</p>
		
		<div class="change-family-normal" >
			<!--<p class="aside-help"><a href="javascript:open_infoPop('10');" class="a-arrow-s-arrow">교환/환불안내<i></i></a></p>-->
		</div>
	</div> 
<form method="post" name="orderform" action="order_submit_action.jsp"> 
	<table class="order-tbl type-ordersheet" summary="주문할 상품목록, 상품명/선택사항, 수량, 상품가, 주문금액, 배송비">
		<caption>주문서 상품 리스트</caption>
		<colgroup>
			<col width="*" />
			<col width="80" />
			<col width="160" />
			<col width="160" />
			<col width="230" />
		</colgroup>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>배송지</th>
				<th scope="col"><em>아이디</em></th>
			
			</tr>
		</thead>
      <tbody> 
    <%for(int i=0; i<list.size(); i++) {%>
         <tr>         
            <td class="td-product-block">
            
               <div class="product-container">
       	           <div class="" style="text-align: center; size: 10px font-size:15px; font-weight: bold;"  >
       						<%=list.get(i).getO_no() %>
						</div>
						<dl class="product-info-container">
							<dt>																
									<a href="/prd/prd.gs?prdid=1003083275&lseq=361498" class="product-title" ></a>								
							</dt>
							<dd>													
							</dd>
						</dl>
					</div>
				</td>							
				<td class="td-product-quantity" style="font-size:15px; font-weight: bold; ">
					<%=list.get(i).getO_amount()%>
				</td>
					
				<td class="td-price-condition">
					<p class="set-price">
						<strong><span id="item_prc0"></span></strong><span class="set-price-won" style="font-size:15px; font-weight: bold;"><%=list.get(i).getO_price()%></span>
						
					</p>
					
				</td>	
			
				<td class="td-order-amount">
					<p class="set-price">
					<strong><span id='item_amt0'></span></strong><span class="set-price-won" style="font-size:12px; font-weight: bold;"><%=list.get(i).getM_add1()+list.get(i).getM_add2()%></span>
					</p>					
					<p class="family-sale-info" id="item_dcrate0"></p>
				</td>			
				<td class="td-delivery-condition"><p class='delivery-condition' style="font-size:15px; font-weight: bold;"><%=list.get(i).getM_userid()%></p></td>
			</tr>
			<% cnt+=list.get(i).getO_price();%>
		<%} %>
		
		</tbody>
		
		
	</table>
	
	<div class="order-sum-total">		
		<p class="order-sum-price">
			<span class="sum-total-title">총 주문금액</span>
			<strong><span id="total_pmt_amt" ></span></strong><span class="order-sum-price-won" style="font-size:15px; font-weight: bold;" ><%=cnt %>원</span>
		</p>
	</div>
	
<div class="order_list">
 
	
</form>
</div>


	    	    
					
		
		</div>
	</div>
</div>

</body>
</html>