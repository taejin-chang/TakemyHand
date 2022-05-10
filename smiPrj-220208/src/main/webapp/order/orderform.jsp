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
 <% 
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	request.setCharacterEncoding("utf-8");


	
	int cnt = 0; // 총합계 변수
	String[] c_no = request.getParameterValues("checkRow");
	int[] c_noList = new int[c_no.length];
	 for(int i=0; i<c_no.length; i++) {
	      c_noList[i] = Integer.parseInt(c_no[i]);
	    }
	int danga=0; // 상품가격 단가 
//	int cartnumber = Integer.parseInt(request.getParameter("cartnum")); //장바구니 번호
	int quantity3 = Integer.parseInt(request.getParameter("quantity3"));//상품수량 
//	String p_name = request.getParameter("p_name");//상품명
//	String p_no = request.getParameter("p_no");//상품번호
//	String m_userid = request.getParameter("m_userid");//회원아이디
//	String imgsrc = request.getParameter("imgsrc");
//	List<CartDTO> cartlist = CartDAO.getDAO().ListselectCart(loginMember.getM_userid());	
//	List<CartDTO> cartlist = CartDAO.getDAO().ListselectCart3(cartnumber);
	
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

		<script type="text/javascript">
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    //document.getElementById("sample6_extraAddress").value = extraAddr;
		               
		                   
		                } else {
		                   // document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("zipcode").value = data.zonecode;
		                document.getElementById("add1").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("add2").focus();
		            }
		        }).open();
		    }
		</script>

</head>

<script type="text/javascript">
function send(){
	if(orderform.receiver.value==""){
		alert("수취인을 입력해주세요");
		orderform.receiver.focus();
		return;
	}
	
	 
	if(orderform.zipcode.value==""){
		alert("우편번호을 입력해주세요");
		orderform.receiver.focus();
		return;
	}
	
	if(orderform.receiver.value==""){
		alert("연락처를 입력해주세요");
		orderform.receiver.focus();
		return;
	}
	
	orderform.submit();
}
</script>

<body>

<div id="gs-content">

	<div id="wrap">
		<div class="section">

		<!-- 2016-04-12 주문서작성/결제 상단 개편 -->
		<!-- 주문서작성/결제 타이틀/단계표시 -->
		<div class="order-heading-container partition-step2"><!-- 장바구니 : partition-step1, 주문서작성/결제 : partition-step2, 주문완료 : partition-step3 -->
			<h2 class="heading-title">
				<strong><i></i>주문서작성/결제</strong>
				
			</h2>
			<div class="order-flow">

				<div class="order-flow-state">
					<div class="order-flow-progress">
						<span class="order-flow-hold"><em class="hide">현재위치</em></span>
					</div>
				</div>
				<ol>
					<li>장바구니</li>
					<li>주문서<br />작성/결제</li>
					<li>주문<br />완료</li>
				</ol>
			</div>
		</div>

	<div class="ordersheet-msg">
		<h3 class="ordersheet-title">주문하실 상품</h3>
		<div class="change-family-normal">
			
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
				<th>상품명/선택사항</th>
				<th>수량</th>
				<th>상품가</th>
				<th>주문금액</th>
				<th scope="col"><em>배송비</em></th>
			
			</tr>
		</thead>
      <tbody> 
   <%
       for(int cartno:c_noList) { %>
		         <input type="hidden" id="checkRow" name="checkRow" value="<%=cartno%>"/>
        <%
         List<CartDTO> cartlist = CartDAO.getDAO().ListselectCart3(cartno);   
         for(CartDTO cart:cartlist) {       %>

         <tr>         
            <td class="td-product-block">
               <div class="product-container">
                  <div class="product-image">
                  
               <%if(cart.getP_kinds().equals("110")){
                   danga=DlyDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=cart.getP_imgsrc()%>">
                <%}else if(cart.getP_kinds().equals("120")){ 
                   danga = DecoDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=cart.getP_imgsrc()%>">
                <%}else if(cart.getP_kinds().equals("130")){
                   danga = HomegalleryDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/130_Homegallery/<%=cart.getP_imgsrc()%>"> 
                <%}else if(cart.getP_kinds().equals("210")){ 
                   danga = LightDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/200_light/210_light/<%=cart.getP_imgsrc()%>">
                <%}else if(cart.getP_kinds().equals("220")){ 
                   danga = PtlightDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/200_light/220_ptlight/<%=cart.getP_imgsrc()%>"> 
                <%}else if(cart.getP_kinds().equals("310")){
                   danga = BookshelfDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=cart.getP_imgsrc()%>"> 
                <%}else if(cart.getP_kinds().equals("320")){ 
                   danga = DrawerDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/300_organize/320_drawer/<%=cart.getP_imgsrc()%>">  
                <%}else if(cart.getP_kinds().equals("400")){ 
                   danga = FurnitureDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                 <img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=cart.getP_imgsrc()%>">
                <%}%>
              
				
						</div>
						<dl class="product-info-container">
							<dt>																
									<a href="/prd/prd.gs?prdid=1003083275&lseq=361498" class="product-title" ><%=cart.getP_name() %></a>								
							</dt>
							<dd>													
							</dd>
						</dl>
					</div>
				</td>							
				<td class="td-product-quantity">
					<input type="text" name="qty1869037799" id="qty1869037799" readonly class="input-quantity" value="<%=cart.getC_amount()%>" maxlength="3" title="수량입력란">
				</td>
					
				<td class="td-price-condition">
					<p class="set-price">
						<strong><span id="item_prc0"><%=danga%></span></strong><span class="set-price-won">원</span>
					</p>
					<p class="interest-info" id="muijaText0">일시불</p>
				</td>	
			
				<td class="td-order-amount">
					<p class="set-price">
					<strong><span id='item_amt0'><%=cart.getC_sum()%></span></strong><span class="set-price-won">원</span>
					</p>					
					<p class="family-sale-info" id="item_dcrate0"></p>
				</td>			
				<td class="td-delivery-condition"><p class='delivery-condition'>무료배송</p></td>
			</tr>
			<%cnt+=danga*cart.getC_amount();%>
			<%} %>	
				<%} %>			
		</tbody>
		
		
	</table>
	
	<div class="order-sum-total">		
		<p class="order-sum-price">
			<span class="sum-total-title">총 주문금액</span>
			<strong><span id="total_pmt_amt" ><%=cnt%></span></strong><span class="order-sum-price-won">원</span>
			<input type="hidden" name="cnt" value="<%=cnt %>"/>
		</p>
	</div>
	
<div class="order_list">
<div class="tit_order_area padT0">
	
		<h4 class="tit_order_list">배송정보 </h4>
		
</div><!-- tit_order_area -->
 
	<table class="tbl_list4 deli_info" summary="주문하시는 분, 영문성명, 주민등록번호, 이메일주소, 배송지 선택, 받으시는분, 배송지주소, 전화번호, 휴대폰번호, 남기실 말씀 항목을 입력할 수 있는 배송정보 입력폼"  >
		<caption>배송정보 입력폼</caption>
		<colgroup>
			<col width="130" />
			<col width="*" />
		</colgroup>
		<tbody>
</tbody>
                     
                <tr class="last" >       
					<th scope="row" class="vtop"><em><label id="">주문하시는 분<sup class='require-icon'>*</sup></label></em></th>		
					<td class="pdb8">
						<div>
							<input type="text" size="10" name="name" readonly="readonly"  value="<%=loginMember.getM_name()%>" class="input2" style="width:65px">
						</div>
					</td>	    		
		    	</tr>			

				<tr style="display:none;">
					<th scope="row" class="tit_deli2 al"><em><label for="">연락처</label></em></th>
					<td>
						<div>
							<div class="gs-select gs-select2" style="width:90px;">
								<a class="current" href="javascript:;"  id="cancle_phone1">010</a>
								<ul id="list_cell_tel1">
									
									<li class="on">
										<a href="javascript:clickCelphnRegonTelno('010', '0');">010</a>
									</li>
									
								</ul>
							</div>
							-
							<input type="text" id="dlv_send_cell2" name="dlv_send_cell2" value="" class="input2" maxlength="4" style="width:52px;">
							-
							<input type="text" id="dlv_send_cell3" name="dlv_send_cell3" value="" class="input2" maxlength="4" style="width:52px;">
						</div>
					</td>
				</tr>


		<!-- 최근사용주소 view end-->
		
			<tr>
				<th scope="row"><em><label for="s_name0">받으시는 분<sup class="require-icon">*</sup></label></em></th>						
				<td>						
				<div>
					<input	type="text" id="receiver" name="receiver"	value="" class="input2" style="width:65px;">
										
				</div>			
			</td>
		</tr>

		<tr class="last" >
			<th scope="row" rowspan="2" valign="top"><em><label for="s_postCode_0">배송지주소<sup class="require-icon">*</sup></label></em></th>
			<td>
				<div>
					<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" class="input2" style="width:55px">
								<span class="gs-btn">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"style="height:18px"><br>
								</span>			
				</div>
			</td>
		</tr>
		
		
		<tr class="last" >
			<td>
			<!-- RoadNmAddr end -->
            <div id="div_baseAddr0" >
				<label for="baseAddr0" class="hide">배송지 기본 주소</label>
				<input type="text" id="add1" name="add1" placeholder="주소" 
					 class="input2" style="width:270px">

				<label for="dtlAddr0" class="hide">배송지 상세 주소</label>
				<input type="text" id="add2" name="add2" placeholder="상세주소" class="input2" style="width:270px">				
									
			</div>				
			</td><!-- 배송지 기본주소  -->
		</tr>
		</tr>
		<!-- 휴대폰번호 시작 -->	
			<tr class="last" >
				<th scope="row"><em><label for="use_sphone">연락처<sup class="require-icon">*</sup></label></em></th>		
			<td>
				<div>								
						
						<input type="text" id="genrlTxnoTelno0" title="연락처 첫번째 입력란" class="input2" style="width:55px" name="tel1"  maxlength="4"
							value="010" style="width:52px;" readonly="readonly"/>											
						
						<!-- gs-select gs-select2 -->														
						- <input type="text" id="genrlTxnoTelno0" title="연락처 두번째 3 ~ 4자리 입력란" class="input2" style="width:55px" name="tel2" maxlength="4"
							value="" style="width:52px;" />
						- <input type="text" id="genrlDtlTelno0" title="연락처 마지막 4자리 입력란" class="input2" style="width:55px" name="tel3" maxlength="4"
							value="" style="width:52px;" />
				</div>
			</td>
		</tr>

		<!-- 남기실 말씀 시작 -->
		<tr class="last" >
			<th scope="row" class="pdb10"><em><label for="dlvPickMsgCntnt0">수령장소</label></em></th>
			<td class="value_area pdb10">
				<div class="input_form">
						<label for="dlvPickMsgCntnt0" class="value_txt" id="use_comment0" style="visibility:visible;" onClick="select_view('0')"></label>
						<input type="text" id="dlvPickMsgCntnt0" class="input2" style="width:454px" name="msg" maxlength="40" onMouseOut="hide_view('0');"  value=""
						class="input inputKo" onblur="" style="width:538px;" onClick="select_view('0')"/>
				</div>				
			</td>
		</tr>

<!-- 받는자 정보 끝 -->
	</table>
</form>
</div>


	    	    
			<div class="clearfix">
	<!-- [ 좌측 ] 결제 수단 선택 영역 -->
	<section id="payment-method">
			
			


				</main>
		</article>
	</section>

	
	<!-- [ 우측 ] 최종 결제 영역 end -->
</div>		
					<button type="button" id="btn_order_sheet_payment" class="gui-btn red giant round" onclick="send();"><strong>결제하기</strong></button>

		<!-- 팝업 문구 2021-07-05 -->
		<div class="notice-box__gray center" id="tabletMsgImg">
			<h5 class="color-teal pt19"><i class="ico-notice"></i>확인해 주세요!</h5>
			<p class="pt12">팝업창 차단이 설정되어 있으면 결제가 진행되지 않습니다.<br />
			설정에서 팝업차단을 해지했는지 확인해 주세요.</p>
		</div>
		</div>
	</div>
</div>

</body>
</html>