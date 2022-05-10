<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
<%@include file="/include/header.jsp" %>
<%
	String p_no=request.getParameter("p_no");
	String p_name = request.getParameter("p_name");
	String p_price = request.getParameter("p_price");
	String p_imgsrc = request.getParameter("p_imgsrc");
	String p_kinds = request.getParameter("p_kinds");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head><script>
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="../../../../index.html" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/product/sample-product-05/40/" />
<meta property="og:title" content="sample product 05" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="product" />
<meta property="og:image" content="http://ecudemo200642.cafe24.com/web/product/big/202110/fdd1566a7b0f63c904bd22323760e557.jpg" />

<meta property="product:sale_price:currency" content="KRW" />
<meta property="product:productId" content="40" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>
<script type="text/javascript">

</script>

<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nY0xDgIxDAT7iJZ3WPAIHgAvcILhTkq8luNI8HsOKhoklHY1M0sLmtDh6GSOu3Mjl47hRaj0TjeHBhW0Bt1tw57-4aWkjjpihaaMx6Q4ImZPKz_F59TgXGVShaW6qqTMqj__2YwuC4zO37XTp7Yx11Hibb4A&type=css&k=4f71ccad5d92075c43c7257aa004f55767e250ce&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tdbBTsMwDADQ-8aV78g0Ie5IHDhw4wtcx2uMkjhKnIn9PWkZ_ADOqVFdPVeW48QFSeQIj71RbWPRPSU5n07PT2dX-hIZj0FTdM3T0VPjNbsFGjlszSXxPZIrdTxRnScFjg8j8ugMWfCelSWDPV0pwkb_D45wk67bmnHPgpKSOfrzwhglPGyBQ-dJsIpE5TJJDxRn0fcWmaXDyhmUZlUdlkny0lXNW_sPl695BYmzij0-wkn0CFA1m3r3NKmPHdmClI_ApXBerROg5OswxlwtaG6PTbNKvVm7jaBieCPw9gWPsopKMf9lHbXY7MtlGp2nNd87NzU_zwO0oGDX0Ci9SP7lX_f7zcsn7FPqGw&type=css&k=e682c2bec97a886ea397c55e69152217306626f3&t=1636193578&user=T"  />
<style type="text/css">
#prdDetailContentLazy img[src=""], #prdDetailContentLazy img:not([src]) { visibility: hidden !important; height: 1px !important; }
</style>
<title>sample product 05 - 쇼핑몰 이름</title>
<meta name="path_role" content="PRODUCT_DETAIL" />
<meta name="keywords" content="sample product 05, , 쇼핑몰 이름, OUTER" />
<meta name="design_html_path" content="/product/detail.html" /></head><body onload="init();"><div id="skipNavigation">
    <p><a href="#category">전체상품목록 바로가기</a></p>
    <p><a href="#contents">본문 바로가기</a></p>
</div>
<div id="wrap">
    <div id="header">
 <!--inner -->
</div><hr class="layout"/><div id="container">
        <div id="contents">
            
<!--
    $category_page = /product/list.html
    $project_page = /product/project.html
    $jointbuy_page = /product/jointbuy.html
-->
<div class="xans-element- xans-product xans-product-headcategory path "><span>현재 위치</span>
<ol>
<li><a href="../../../../../../../index.html">홈</a></li>
        <li class=""><a href="../../../../../../../category/outer/45/index.html">OUTER</a></li>
        <li class="displaynone"><a href=""></a></li>
        <li class="displaynone"><a href=""></a></li>
        <li class="displaynone"><strong><a href=""></a></strong></li>
    </ol>
</div>

<div class="xans-element- xans-product xans-product-detail"><!--
		$coupon_download_page = /coupon/coupon_productdetail.html
    -->
<div class="detailArea ">
        <div class="xans-element- xans-product xans-product-image imgArea "><div class="keyImg">
                <div class="thumbnail">
                    <%if(p_kinds.equals("110")){ %>  
                       <img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=p_imgsrc%>" class="BigImage "/></a>
                    <%}else if(p_kinds.equals("120")){%>
                       <img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=p_imgsrc%>" class="BigImage "/></a>
                    <%}else if(p_kinds.equals("130")){%>
                    <img src="<%=request.getContextPath()%>/web/images/100_homedeco/130_Homegallery/<%=p_imgsrc%>"  class="BigImage" alt="" />
                    <%}%>
                    <div id="zoom_wrap"></div>
                </div>
            </div>
<div class="xans-element- xans-product xans-product-addimage listImg"><ul>
<li class="xans-record-">
<%if(p_kinds.equals("110")){ %>
<img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=p_imgsrc %>"  class="ThumbImage"/>
<%}else if(p_kinds.equals("120")){%>
<img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=p_imgsrc %>"  class="ThumbImage"/>
<%}else if(p_kinds.equals("130")){%>
<img src="<%=request.getContextPath()%>/web/images/100_homedeco/130_Homegallery/<%=p_imgsrc %>"  class="ThumbImage"/>
<%}%>
</li>
                                    </ul>
</div>


</div>

        <div class="infoArea">
            <div class="headingArea">
                <h2>
<!--[]--><%=p_name%> </h2>
                <span class="icon">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </span>
            </div>            

         
            <div class="xans-element- xans-product xans-product-detaildesign"><!--
                    출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
                    count = 10
                -->
<form name="productform" action="<%=request.getContextPath()%>/order/cart_action.jsp" method="post">
<input type="hidden" name="p_no" value="<%=p_no%>">               
<input type="hidden" name="p_kinds" value="<%=p_kinds%>">               
<input type="hidden" name="p_name" value="<%=p_name%>">
<input type="hidden" name="p_imgsrc" value="<%=p_imgsrc%>">
               
<table border="1" summary="">
<caption> 기본 정보</caption>
                    <tbody>
<tr class="displaynone xans-record-">
<th scope="row"><span style="font-size:16px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span></th>
                            <td><span style="font-size:16px;color:#555555;"><%=p_name %></span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:12px;color:#000000;font-weight:bold;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span></th>
                            <td><span style="font-size:12px;color:#000000;font-weight:bold;"><strong id="span_product_price_text"><%=p_price%>원 </strong><input id="product_price" name="product_price" value="" type="hidden"  /></span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_DELIVERY_TITLE>상품번호</span></th>
                            <td><span style="font-size:12px;color:#555555;"><%=p_no%></span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_DELIVERY>배송방법</span></th>
                            <td><span style="font-size:12px;color:#555555;">택배</span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_DELIVERY_PRICE>배송비</span></th>
                            <td><span style="font-size:12px;color:#555555;"><span class="delv_price_B"><input id="delivery_cost_prepaid" name="delivery_cost_prepaid" value="P" type="hidden"  /><strong>무료</strong></span></span></td>
                        </tr>
</tbody>
</table>
</div>



            <div id="totalProducts" class="">
                <p class="ec-base-help txtWarn txt11 "> 수량을 선택해주세요.</p>
                <p class="ec-base-help txtWarn txt11 displaynone"> 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</p>
                <table border="1" summary="">
<caption>상품 목록</caption>
                    <colgroup>
<col style="width:284px;"/>
<col style="width:80px;"/>
<col style="width:110px;"/>
</colgroup>
<thead><tr>
<th scope="col">상품명</th>
                            <th scope="col">상품수</th>
                            <th scope="col">가격</th>
                        </tr></thead>
<tbody class="">
<tr>
<td><%=p_name%></td>
 <td>
     <span class="quantity">
     	<input type=hidden name="sellprice"  id="sellprice" value="<%=p_price%>">
         <input name="quantity2" id="quantity2" value="1" type="text"/> 
         <a href="javascript:add();" class="up QuantityUp"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가"/></a>
         <a href="javascript:del();" class="down QuantityDown"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소"/></a>
     </span>
 </td>
<script type="text/javascript">
var sell_price;
var amount;

function init () {
	sell_price = document.productform.sellprice.value;
	amount = document.productform.quantity2.value;
	document.productform.sum.value = sell_price;
	change();
}

function add () {
	hm = document.productform.quantity2;
	sum = document.productform.sum;
	hm.value ++ ;
	sum.value = parseInt(hm.value) * sell_price;
	//$("#total2").text(sum.value+"원");		
	//	$("#total2").text(sum.value+"원");	
	$("#total2").text(sum.value+"원("+hm.value +"개)");
	
}

function del () {
	hm = document.productform.quantity2;
	sum = document.productform.sum;
		if (hm.value > 1) {
			cnt = hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		//	$("#total2").text(sum.value+"원");
			$("#total2").text(sum.value+"원("+hm.value +"개)");
		}
}

function change () {
	hm = document.productform.quantity2;
	sum = document.productform.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
		sum.value = parseInt(hm.value) * sell_price;

	
		
}  
	
/*
function add(){
	   productform.quantity2.value++;
	 
}

function del(){
	if(productform.quantity2.value>0){
		 //productform.quantity2.value--;
		productform.quantity2.value--;
		
		}else if(productform.quantity2.value<=0){
		productform.quantity2.value==0;		
		}
}
*/

<% if(loginMember!=null) {%>
function send(){
	productform.submit();
}
<%}%>
<%if(loginMember==null){%>

function send2(){
	alert("회원전용입니다.로그인해주세요");
	location.href="<%=request.getContextPath()%>/member/login.jsp";
}
<%}%>
</script>                            
                            <td class="right">
<input type="text" name="sum" id="sum"  readonly="readonly" size="1" style="border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; font-size:21px; font-weight:bold;"><span style="font-size:13px; font-weight: bold;" >원</span>
</td>
                        </tr><tr id="totalProductsOption" class="xans-element- xans-product xans-product-option option xans-record-"><!--
                            $use_per_add_option = yes
                            $default_option = yes
                            --><td class="middle" colspan="3">
                                <table border="1" summary="">
<caption>옵션 정보</caption>
                                    <colgroup>
<col style="width:105px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody></tbody>
</table>
</td>
</tr>
</tbody>

</table>
</div>


            <div id="totalPrice" class="totalPrice">
                <strong>총 상품금액</strong>(수량) : <span class="total" id="total2" style="font-size:20px"><strong><em ><%=p_price%></em></strong> (1개)</span>
            </div>
            <p class="ec-base-help txt11 displaynone EC-price-warning">할인가가 적용된 최종 결제예정금액은 주문 시 확인할 수 있습니다.</p>

			
            <div class="xans-element- xans-product xans-product-action "><div class="ec-base-button gColumn">
                    <a href="#none" class="btnSubmit sizeL " onclick="">
                        <span id="btnBuy">BUY NOW</span>
                    </a>
                    <a href="javascript:send();" class="btnNormal sizeL " onclick="send2();">CART</a>
                    <span class="btnEm sizeL gFlex2 displaynone">SOLD OUT</span>
                </div>
</div>
        </div>
    </div>


</div>
</form>
<div class="xans-element- xans-product xans-product-additional"><div id="prdDetail" class="ec-base-tab gFlex ">
        <ul class="menu_detail">
<li class="selected"><a href="#prdDetail">DETAIL</a></li>
            <li><a href="#prdInfo">GUIDE</a></li>
            <li class=""><a href="#prdReview">REVIEW</a></li>
            <li class=""><a href="#prdQnA">Q&amp;A</a></li>
        </ul>
<div class="cont">
            <p align="center">
<a href="http://1pixel.co.kr/" target="_blank"><img border="0" alt="" ec-data-src="//dwddse.cafe24.com/web/upload/cafe24_guide/images/1pixel_guide.jpg" usemap="#Map_1pixel"></a></p>

<p align="center"><img ec-data-src="//dwddse.cafe24.com/web/upload/img_detail_02.jpg" alt=""></p>        </div>
    </div>
<div id="prdInfo" class="ec-base-tab gFlex ">
        <ul class="menu_detail">
<li><a href="#prdDetail">DETAIL</a></li>
            <li class="selected"><a href="#prdInfo">GUIDE</a></li>
            <li class=""><a href="#prdReview">REVIEW</a></li>
            <li class=""><a href="#prdQnA">Q&amp;A</a></li>
        </ul>
<div class="detail_guide_box">
        
        <h2>SHOPPING GUIDE<span>구매전 필독사항 입니다 :)</span>
</h2>
        
        <div class="cont">
            <h3>상품결제정보</h3>
            고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
      정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
      <br>
      무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
      주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
      않은 주문은 자동취소 됩니다. <br>
        </div>
        <div class="cont">
            <h3>배송정보</h3>
            <ul class="delivery">
<li>배송 방법 : 택배</li>
                <li>배송 지역 : 전국지역</li>
                <li>배송 비용 : 2,500원</li>
                <li>배송 기간 : 3일 ~ 7일</li>
                <li>배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
    고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
</li>
            </ul>
</div>
        <div class="cont">
            <h3>교환 및 반품정보</h3>
            <b>교환 및 반품 주소</b><br/>-  <b><br/><br/>교환 및 반품이 가능한 경우</b><br>
- 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의<br>
&nbsp;&nbsp;경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br>
&nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내<br>
<br>

<b>교환 및 반품이 불가능한 경우</b><br>
- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여<br>
&nbsp;&nbsp;포장 등을 훼손한 경우는 제외<br>
- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
&nbsp;&nbsp;(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에<br>
&nbsp;&nbsp;따른 반품/교환은 제조사 기준에 따릅니다.)<br>
- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을 <br>
&nbsp;&nbsp;제공한 경우에 한 합니다.<br>
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
- 복제가 가능한 상품등의 포장을 훼손한 경우<br>
&nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br>
<br>
※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
&nbsp;&nbsp;(색상 교환, 사이즈 교환 등 포함)<br>
        </div>
        <div class="cont">
            <h3>서비스문의</h3>
                    </div>
          
    </div>       
    </div>
<div id="prdReview" class="ec-base-tab gFlex  ">
        <ul class="menu_detail">
<li><a href="#prdDetail">DETAIL</a></li>
            <li><a href="#prdInfo">GUIDE</a></li>
            <li class="selected"><a href="#prdReview">REVIEW</a></li>
            <li><a href="#prdQnA">Q&amp;A</a></li>
        </ul>
<div class="board">
            <h3>REVIEW</h3>
            <p class="desc">상품의 사용후기를 적어주세요.</p>

            <p class="nodata" data-i18n="PRODUCT.BOARD_NODATA">게시물이 없습니다</p>
            <p class="ec-base-button typeBorder">
                <span class="gRight">
                    <a href="http://ecudemo200642.cafe24.com/board/product/write.html?board_no=4&product_no=40&cate_no=45&display_group=2" class="btnNormal">상품후기쓰기</a>
                    <a href="http://ecudemo200642.cafe24.com/board/product/list.html?board_no=4&link_product_no=40" class="btnNormal">모두 보기</a>
                </span>
            </p>

                    </div>
    </div>
<div id="prdQnA" class="ec-base-tab gFlex  ">
        <ul class="menu_detail">
<li><a href="#prdDetail">DETAIL</a></li>
            <li><a href="#prdInfo">GUIDE</a></li>
            <li><a href="#prdReview">REVIEW</a></li>
            <li class="selected"><a href="#prdQnA">Q&amp;A</a></li>
        </ul>
<div class="board">
            <h3>Q&amp;A</h3>
            <p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>

            <p class="nodata" data-i18n="PRODUCT.BOARD_NODATA">게시물이 없습니다</p>
            <p class="ec-base-button typeBorder">
                <span class="gRight">
                    <a href="http://ecudemo200642.cafe24.com/board/product/write.html?board_no=6&product_no=40&cate_no=45&display_group=2" class="btnNormal">상품문의하기</a>
                    <a href="http://ecudemo200642.cafe24.com/board/product/list.html?board_no=6&link_product_no=40" class="btnNormal">모두 보기</a>
                </span>
            </p>

                    </div>
    </div>
</div>


        </div><hr class="layout"/></div><hr class="layout"/>
        
 
        
        
        
        
    </div><!--#footer-->
    
    <div id="bottom"></div> 
</div><hr class="layout"/>
<%@include file="/include/footer.jsp"%>


<div id="multi_option" style="display:none;"></div>
<form id="frm_image_zoom" style="display:none;"></form>
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/ind-script/i18n.php?lang=ko_KR&domain=front&v=2112291285" charset="utf-8"></script>
<script src="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=zZlbU-s2EMffIa_9HO5pO52-klBOmYbCEE7PsyKv48WyVtWFYD591064NcQX2cx0mMQX9P9JXq12V06SUwnJl59skllRwpZskVhwFKyE5N4l-OU3Pbt3PyRt7QIaIYvk_p8Attoffp79OvtxoBIePVgtlNvfmEmiAmEsJVgV9QgzkLNMR0s1SdKZQumjEF9mv_BfVOf8X0_2P3Yzljasfze7qfDgkRuU3Er7BORVc_IdfX73dC68mJWoB3AUrlkFd3zerXLGovZZDzzJUA_rgmy5IO0tKQW2W3ejgjszZm4x3fQYT_CoultllhpLnThSrCB94smcKNRwshZa9xnXDiGpLEn3bf0oNK9Gza5tLPj-vTQ6D6VRPC8fi4QxyRWtUUFy-0a_G1-LVY7oSkoD33JbNMM6zIKWtUHrdmngZVMedeK-hJZBsKsm33ar5y1CiadKkUgHicrgRd3v9dqBfTg2OUfEhlSVoerteilkIihfm8CVwvp5i9fVjVY5mXcdXjSYP0UhKCnq7xt8BNW2Slowi8ZLvrU6yRGpA2FlPshWXmRZdRiThueE9QYb0f8jQ6UcL7VjB3JjSSAc6s1YSglepHX0H8YxKmyQw82DUMhyss-8lxszPhFuNLYesE7dIZ4Jhq0In9dDDsrApz9HLnR6kOKm7ICDFPJK-jQ-BzQ_mZkUScGRvqDuEPk6gqHR6BYysKAlLIKtj9WNRdkSD-ckbPqOw3dn6_ru8CDKuXlDtlqi84PFf8E2WWIBydzSlvPPQsgc4imLlrKkv_75iaI4t_CAsPVCFfvTBQXtByWK50lMHHdzao5PZS-93F-dZlyBitEjmQozpGCVFDgy7g9Rs7Jf4_duAv0HcaEnhT_XShdR2mvTFIe_P3orGlBz3VyuSKUU_NTYjhgSB70sxWZy6Dk63iJUyFuFCdGXjFtxQaJgBQqa2nz6gVsGz4UrYPLpuwg6PSinhmFfgCPi6iFKu0lAc9TpJKDzg2IxEvT3Ln_H-gl_bnZbv0ud0WDECp_ga8AURnY-Yq5fIWdyAjPcEafRszRdcQE1EnVbv1WShSvd2OJgDxyM2euSc96eoErmoS6S-WZJcZYSXAVfoYKYcDrHTe30S9qM9hVFvA1GM5Kzj4OhijVrfFp5HcSq9pCRjF0gGAm54GmdBHQLErQfCVm2vlTqnhpewFg_i-hR7pVC8zwmJQUHpxY3uR-oSa1o8emrXdO3Q93CWh1bBm97yX2p2Jb8JOAGdSBcpeXuO1pXQrlue0vWIb-2KVjZ5ggdgF2BMp5g2ivKXozO-NtBWTSbiDHP0hl1O_TnYMhhfP_f0eXtm-0eAHl8V9qDYDsCS4d8F5ea9L4YNY7Gs-MdCjRkONapl6IaMYavVqTxrnQWPPFmHGWD4Ti8jffqoDzekAkmHlHVddJLaTBmYt-hRjn7Eh9AoS7akmkfL_sD698lqwn8dU-6E-tJOPU2NdJCRvjckoLTHm8eu8zcWiF8IDYRcXyXB085YTc_ovwL&type=js&k=05e2b6e824f61581a91f1190236166c509903244&t=1640649769" ></script><script src="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=rdDBDcIwDAXQAcKVOVxViEWYIE2sxiWO0zgBdXtaVCYgp_9PT9-GIIyAzjTFontpHlnGYbjfRshtiuRMqBxBPRqPSnOCySrCosDiW0TIZU9Xf2mI7YyXRa_Qzy74Inx3Rtdk_xKj3aTVo5M7-G_5d6MTZkmdLj0Xro3c03T84Olyi5U0SH4EypnS3Jd3tuIsZdvVDw&type=js&k=fe7805c9b599e5a52b6315f1fd2bf5c17b8b655b&t=1635423561&user=T" ></script>
<script type="text/javascript">

</script></body></html>