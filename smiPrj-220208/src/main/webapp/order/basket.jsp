<%@page import="InteriorDAO.FurnitureDAO"%>
<%@page import="InteriorDAO.DrawerDAO"%>
<%@page import="InteriorDAO.BookshelfDAO"%>
<%@page import="InteriorDAO.PtlightDAO"%>
<%@page import="InteriorDAO.LightDAO"%>
<%@page import="InteriorDAO.HomegalleryDAO"%>
<%@page import="InteriorDAO.DecoDAO"%>
<%@page import="InteriorDTO.DecoDTO"%>
<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="InteriorDAO.CartDAO"%>
<%@page import="InteriorDTO.CartDTO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/include/header.jsp" %>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    


<% //CartDTO cart = (CartDTO)session.getAttribute("cart");
//	CartDTO dto = new CartDTO();
	List<CartDTO> cartlist = CartDAO.getDAO().ListselectCart(loginMember.getM_userid());

	int danga=0;
	int cartSum=0;
%>   

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/>
<meta property="og:url" content="http://ecudemo200642.cafe24.com/order/basket.html" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="website" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>


<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tZXBTgQhDIbvO159DjYb4zNo4sHEJ2BKB8gCJVBW5-2FOHrxpuXWtPC1-fNDlaOICmFpFUvtQTMY6XI-Pz5cVG5r8LA4jkFVg4vB6m1Sq66ogt6p8Yg9KKjj6mkUTr2A5a5n7tVf2QMXybSAiorBMrJX5FcNV21RmG3gOW0kBo17dZTVu68u-Mr_4_4SGShGSsLQr4Qw9NsOzU8CM1FgnyfRHYZZ6Fy6U2CW3llbnzTjLNX1Oom8NmZxa__A6WOeIGGW2P0QiH1MR5fY-qsZX9Sb8zn7ZKUbAKVbZ3hKWXx46Ma2VHZpbkVdwD2hNoKr62AHssSUxUfmrsVgb9s0dJpmvpdjNX4C&type=css&k=044e113c0ac6eccd36d801c5199f68a93c975c2d&t=1636193578&user=T"  />


</head>
<body>

<hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="../index.html">홈</a></li>
        <li title="현재 위치"><strong>장바구니</strong></li>
    </ol></div>

<div class="titleArea">
    <h2>장바구니</h2>
</div>

<div class="xans-element- xans-order xans-order-basketpackage "><p class="orderStep"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/img_order_step1.gif" alt="01 장바구니"></p>
<div class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight "><ul class="menu">
<li class="selected "><a href="/order/basket.html">국내배송상품 <%=CartDAO.getDAO().CartCount()%></a></li>
           
        </ul>
<p class="right displaynone">장바구니에 담긴 상품은 7일 동안 보관됩니다.</p>
</div>
<div class="orderListArea ec-base-table typeList gBorder">
        <div class="xans-element- xans-order xans-order-normtitle title "><h3>장바구니 전체상품(<%=CartDAO.getDAO().CartCount()%>)</h3>
</div>
               	<form name="cartform" method="post">

        <table border="1" summary="" class="xans-element- xans-order xans-order-normnormal xans-record-"><caption>무료배송</caption>
<colgroup>
<col style="width:27px">
<col style="width:92px">
<col style="width:auto">
<col style="width:88px">
<col style="width:110px">
<col style="width:88px">
<col style="width:88px">
<col style="width:85px">
<col style="width:98px">
<col style="width:110px">
</colgroup>
<thead>

<tr>

<th scope="col">
				<%--form 두번째위치 --%>
				<input type="checkbox" id="checkAll" name="checkAll" value="all"  onclick="checkAll();"></th>
                <th scope="col">이미지</th>
                <th scope="col">상품정보</th>
                <th scope="col">수량</th>
                <th scope="col">상품구매금액</th>
                <th scope="col">상품번호</th>
                <th scope="col" class="mileage">상품분류</th>
                <th scope="col">배송구분</th>
                <th scope="col" width="10">회원 아이디</th>
                <th scope="col">장바구니 번호</th>
            </tr></thead>
<tfoot class="right"><tr>
<td colspan="10">
<%-- 
<span class="gLeft"></span>  합계 : <strong class="txtEm gIndent10"><span id="normal_normal_ship_fee_sum" class="txt18"><%=cart.getC_sum()%></span>원</strong>
--%>
</td>
            </tr></tfoot>
<%for(CartDTO cart:cartlist){%>
            <tbody class="xans-element- xans-order xans-order-list center">
            <tr class="xans-record-">
			<td><input type="checkbox" id="checkRow" name="checkRow" value="<%=cart.getC_no() %>" class="checkRow"></td>
                <td class="thumb gClearLine">                
                <%if(cart.getP_kinds().equals("110")){
                	danga=DlyDAO.getDAO().SelectProduct(cart.getP_no()).getP_price();%>
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=cart.getP_imgsrc()%>">
               <!--  <a href="/product/detail.html?product_no=13&amp;cate_no=1"> -->
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

				<% 	
					cartSum+=cart.getC_amount()*danga;
				%>       

                <%--
                 <%if(cartlist.get(i).getP_kinds().equals("110")){%>
                <a href="/product/detail.html?product_no=13&amp;cate_no=1">
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=cartlist.get(i).getP_imgsrc()%>"></a>
                <%}else if(cartlist.get(i).getP_kinds().equals("120")){ %>
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=cartlist.get(i).getP_imgsrc()%>"></a>
                <%}else if(cartlist.get(i).getP_kinds().equals("130")){%>
                <img src="<%=request.getContextPath()%>/web/images/100_homedeco/130_Homegallery/<%=cartlist.get(i).getP_imgsrc()%>"></a> 
                <%}else if(cartlist.get(i).getP_kinds().equals("210")){ %>
                <img src="<%=request.getContextPath()%>/web/images/200_light/210_light/<%=cartlist.get(i).getP_imgsrc()%>"></a> 
                <%}else if(cartlist.get(i).getP_kinds().equals("220")){ %>
                <img src="<%=request.getContextPath()%>/web/images/200_light/220_ptlight/<%=cartlist.get(i).getP_imgsrc()%>"></a> 
                <%}else if(cartlist.get(i).getP_kinds().equals("310")){%>
                <img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=cartlist.get(i).getP_imgsrc()%>"></a> 
                <%}else if(cartlist.get(i).getP_kinds().equals("320")){ %>
                <img src="<%=request.getContextPath()%>/web/images/300_organize/320_drawer/<%=cartlist.get(i).getP_imgsrc()%>"></a>  
                <%}else if(cartlist.get(i).getP_kinds().equals("400")){ %>
                 <img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=cartlist.get(i).getP_imgsrc()%>"></a> 
                <%}%>
                 --%>
                 
                </td>
               	<%--form 최초위치 --%>
              	<input type="hidden" name="cartsum" value="<%=cartSum%>">
<%--             <input type="hidden" name="p_name" value="<%=cart.getP_name()%>">
               	<input type="hidden" name="p_no" value="<%=cart.getP_no()%>">
               	<input type="hidden" name="p_kinds" value="<%=cart.getP_kinds()%>">
               	<input type="hidden" name="p_no" value="<%=cart.getP_no()%>">
               	<input type="hidden" name="m_userid" value="<%=cart.getM_userid()%>">
               	<input type="hidden" name="imgsrc" value="<%=cart.getP_imgsrc()%>"> 
--%>
               	
                <td class="left gClearLine" align="center">
                    <strong class="name" style="font-size: 30px;"><a href="#none" class="ec-product-name"><%=cart.getP_name()%></a></strong>    
                    <ul class="xans-element- xans-order xans-order-optionall option">
</ul>

                </td>
                <td class="right">
                        <span class="">
                            <span class="ec-base-qty"><input id="quantity3" name="quantity3" size="2" value="<%=cart.getC_amount()%>" type="text"><a href="javascript:add();" class="up"><img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가"></a><a href="javascript:del();" class="down" "><img src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소"></a></span>
                           
                        </span>
                    <span class="displaynone">3</span>
                </td>
                <td>
                    <div id="">
<strong><%=cart.getC_amount()*danga%>원</strong><p class="displaynone"></p>
</div>
                </td>

                <td>
                    <span><%=cart.getP_no()%></span>
                    <div id="" class="displaynone">
<strong>-<span id="product_discount_price_front0">0</span>원</strong><p class="displaynone"></p>
</div>
                </td>
                <td>
                    <span id="product_mileage0" class="txtInfo"><%=cart.getP_kinds()%></span>
                </td>
                <td class="right">
                    <div class="txtInfo" align="center">무료배송<br></div>
                </td>
              <td>
                    <span id="product_mileage0" class="txtInfo"><%=cart.getM_userid() %></span>
                </td>
                <td>
                    <span id="product_mileage0" class="txtInfo"><%=cart.getC_no() %></span>
                </td>
            </tr>
            <tr>
<td><input type="hidden" name="cartnum" value="<%=cart.getC_no()%>"></td></tr>
</tbody><%--for문 마지막 --%>
<%} %>
</table>
</form>

        </div>

<div class="xans-element- xans-order xans-order-selectorder ec-base-button "><span class="gLeft">
            <strong class="text">선택상품을</strong>
            <a href="#none" class="btnEm" id="delete"><i class="icoDelete"></i> 삭제하기</a>
        </span>

</div>
<!-- 총 주문금액 : 국내배송상품 -->
<div class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder total  "><table border="1" summary="">
<caption>총 주문금액</caption>
            <colgroup>
<col style="width:17%;">
<col style="width:17%;" class="displaynone">
<col style="width:19%;">
<col style="width:17%;" class="displaynone">
<col style="width:auto;">
</colgroup>
<thead><tr>
<th scope="col"><strong>총 상품금액</strong></th>
                <th scope="col"><strong>총 배송비</strong></th>
                <th scope="col" id="total_benefit_price_title_area" class="displaynone">
</th>
                <th scope="col"><strong>결제예정금액</strong></th>
            </tr></thead>
<tbody class="center"><tr>
<td><div class="box txt16">
<strong><span class="txt23"><span class="total_product_price_display_front"><%=cartSum%></span></span>원</strong> <span class="txt14 displaynone"><span class="total_product_price_display_back"></span></span>
</div></td>
                <td class="displaynone"><div class="box txt16">
<strong><span class="txt23"><span class="total_product_vat_price_front">0</span></span>원</strong> <span class="txt14 displaynone"><span class="total_product_vat_price_back"></span></span>
</div></td>
                <td>
                    <div class="box shipping txt16">
                        <strong class="txt23">+ </strong><strong><span id="total_delv_price_front" class="txt23"><span class="total_delv_price_front">0</span></span>원</strong> <span class="txt14 displaynone"><span class="total_delv_price_back"></span></span>
                        <div class="shippingArea displaynone">(<span></span>
                            <div class="shippingFee">
                                <a href="#none" class="btnNormal" id="">자세히</a>)
                                <div class="ec-base-tooltip" style="display: none;">

                                    <a href="#none" class="btnClose"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"></a>
                                   <span class="edge"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td id="total_benefit_price_area" class="displaynone"><div class="box txt16">
<strong class="txt23">- </strong><strong><span id="total_product_discount_price_front" class="txt23">0</span>원</strong> <span class="txt14 displaynone"><span id="total_product_discount_price_back"></span></span>
</div></td>
                <td><div class="box txtEm txt16">
<strong class="txt23">= </strong><strong><span id="total_order_price_front" class="txt23"><%=cartSum%></span>원</strong> <span class="txt14 displaynone"><span id="total_order_price_back"></span></span>
</div></td>
            </tr></tbody>
</table>

</div>
<!-- 총 주문금액 : 해외배송상품 -->
<div class="xans-element- xans-order xans-order-totaloversea ec-base-table typeList gBorder total displaynone "><table border="1" summary="">
<caption>총 주문금액</caption>
            <colgroup>
<col style="width:23%;">
<col style="width:21%;" class="displaynone">
<col style="width:21%;" class="displaynone">
<col style="width:auto">
</colgroup>
<thead><tr>
<th scope="col"><span>총 상품금액</span></th>
                <th scope="col" class="displaynone"><strong>총 부가세</strong></th>
                <th scope="col" id="oversea_total_benefit_price_title_area" class="displaynone">총 할인금액 <a href="#none" class="btnNormal" onclick="OrderLayer.onDiv('order_layer_benefit', event);">내역보기</a>
</th>
                <th scope="col">총 합계</th>
            </tr></thead>
<tbody class="center"><tr>
<td><div class="box txt16">
<strong><span class="txt23"><span class="total_product_price_display_front">1,178,000</span></span>원</strong> <span class="txt14 displaynone"><span class="total_product_price_display_back"></span></span>
</div></td>
                <td id="oversea_total_benefit_price_area" class="displaynone"><div class="box txt16">
<strong>- <span id="oversea_total_product_discount_price_front" class="txt23">0</span>원</strong> <span class="txt14 displaynone"><span id="oversea_total_product_discount_price_back"></span></span>
</div></td>
                <td><div class="box txtEm txt16">
<strong class="txt23">= </strong><strong><span id="oversea_total_order_price_front" class="txt23"><%=danga%></span>원</strong> <span class="txt14 displaynone"><span id="oversea_total_order_price_back"></span></span>
</div></td>
            </tr></tbody>
</table>

</div>
<div class="xans-element- xans-order xans-order-totalorder ec-base-button justify"><a href="javascript:order();"   class="btnSubmitFix sizeM  ">주문하기</a>
<span class="gRight">
            <a href="javascript:history.go(-1);" class="btnNormalFix sizeM">쇼핑계속하기</a>
        </span>
</div>
</div>

<div class="xans-element- xans-order xans-order-basketguide ec-base-help "><h3>이용안내</h3>
<div class="inner">
        <h4>장바구니 이용안내</h4>
        <ol>
<li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
            <li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
            <li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
            <li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
            <li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
        </ol>
<h4>무이자할부 이용안내</h4>
        <ol>
<li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
            <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
            <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
        </ol>
</div>
</div>

        </div><hr class="layout"/></div><hr class="layout"/>  
        
<script type="text/javascript">

function order() {
 	/* if($("#checkRow").is(':checked')==false){
		alert("최소 하나의 상품을 선택하세요");
		return;
	}  */
	if($(":checkbox[name='checkRow']:checked")){
		var frm = document.cartform;
		var chkArray = new Array(); 
		 $('input:checkbox[name=checkRow]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	            return chkArray.push(this.value);
	        }).get();


	출처: https://choija.tistory.com/119 [수캥이의 삶 ]
		cartform.action = "orderform.jsp";
		cartform.submit();
	}
}


var checkAll = document.getElementById("checkAll");
checkAll.addEventListener('click', function(){
    var objs = document.querySelectorAll(".checkRow");
    for (var i = 0; i < objs.length; i++) {
      objs[i].checked = checkAll.checked;
    };
}, false);
 
var objs = document.getElementById("checkAll");
for(var i=0; i<objs.length ; i++){
  objs[i].addEventListener('click', function(){
	   var checkAll = document.getElementById("checkAll");
    for (var j = 0; j < objs.length; j++) {
      if (objs[j].checked === false) {
   	   checkAll.checked = false;
        return;
      };
    };
    checkAll.checked = true;                                   
}, false);
} 


 function add(){
	cartform.quantity3.value++;
	//var cnt =$("#quantity3").val();
	//cnt++;
}
 /* 
function del(){
	if(quantity3.value>0){
		 //productform.quantity2.value--;
		quantity3.value--;
		}else if(quantity3.value<=0){
		quantity3.value==0;		
		}
} 
 */
 /* 
/* $("#delete").click(function() {
	if($(":checkbox[name='checkRow']:checked").length==0){
		alert("삭제할 항목을 선택해주세요");
		return;
	}
	
	var cnt = "";
	$("input[name='checkRow']:checked").each(function() {
		cnt = cnt + $(this).val()+",";
		cnt.
	}); */
	//cnt = cnt.substring(0, cnt.lastIndexOf(","));


	$("#delete").click(function() {
		if($(":checkbox[name='checkRow']:checked").length==0){
			alert("삭제할 항목을 선택해주세요");
			return;
		}
		
		if($(":checkbox[name='checkRow']:checked")){
			//alert("선택물품을 삭제합니다.");			
			cartform.action = "cart_delete_action.jsp";
			cartform.submit();
			return;
		}
		
 		if($(":checkbox[name='checkAll']:checked")){
			alert("전체항목을 삭제합니다.");
			location.href="cart_delete_action.jsp?checkAll=all";
		}
 		
	});	
 	
	
 	

</script>  

            
        
        
<%@include file="/include/footer.jsp"%>
</body></html>