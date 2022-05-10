<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="InteriorDAO.OrdersDAO"%>
<%@page import="InteriorDTO.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<%
	OrdersDTO orders = OrdersDAO.getDAO().searchOrders(loginMember.getM_userid());
%>
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="index.html" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/myshop/index.html" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="website" />
<link rel="shortcut icon" href="../web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>
<script type="text/javascript">
</script>
<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tdVLbgMhDAbgfabbnoMoqnqGLrrLCcB4wApgxCPq3L6QVt11FbND49Hn0S_jUZ4jKoStVyx1HLrFyJfz-f3tonI3gWDzLQZVLW4WK7mkjK6ooFYV2faAKh7Vc1YGE-7UXkblVQmyOt0M803a5WKxXJtuKC1HTek5M-iDe5tngkcD4BhZGv15IIwinGbh1GkR3JhDo7xI9xhW0bmMKYFVeWftKD09zP-nrs0i2fTWxEf7D-evdYGEVWGPl2ARPQpYxBbeb5vYx42cq-_qKWdKTroBcLoPgzhlELfHpXFcDmm3oi7gP1Bb-cADO26cxT95_g2nve_L6LRs-D6pPpbrNw&type=css&k=3577b08abcd2e8578e38cb495856ce58c8eafd0c&t=1636193578&user=T"  />

<title>일픽셀디자인 ● S337 산책 ● 카페24 쇼핑몰디자인 제작 1pixel.co.kr</title>
<meta name="path_role" content="MYSHOP_MAIN" />
<meta name="keywords" content="쇼핑몰 이름" /></head><body><div id="skipNavigation">
    <p><a href="#category">전체상품목록 바로가기</a></p>
    <p><a href="#contents">본문 바로가기</a></p>
</div>
<div id="wrap">
 <hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="../index.html">홈</a></li>
        <li title="현재 위치">마이 쇼핑</li>
    </ol></div>

<div class="titleArea">
    <h2>마이 쇼핑</h2>
</div>

<div class="mypage_box">



<div class="xans-element- xans-myshop xans-myshop-orderstate "><div class="title">
        <h3>나의 주문처리 현황 <span class="desc">(최근 <em>3개월</em> 기준)</span>
</h3>
    </div>
<div class="state">
        <ul class="order" style="float: left;">
			 <%if(orders.getO_stat().equals("1")){%>
			<li> 
                <strong>입금전</strong>
                <a class="count"><span id="xans_myshop_orderstate_shppied_before_count"><%=orders.getO_stat() %></span></a>
            </li>
            <%} %>
            <li>
                <strong>배송준비중</strong>
                <a class="count"><span id="xans_myshop_orderstate_shppied_standby_count"></span>0</a>
            </li>
            
            <li>
                <strong>배송중</strong>
                <a class="count"><span id="xans_myshop_orderstate_shppied_begin_count">0</span></a>
            </li>
                 
            <li style="float: left;">
                <strong>배송완료</strong>
                <a class="count"><span id="xans_myshop_orderstate_shppied_complate_count">0</span></a>
            </li>
            
            
        </ul>
        

</div>
</div>

<div id="myshopMain" class="xans-element- xans-myshop xans-myshop-main"><ul>
<li class="shopMain order">
            <h3><a href="<%=request.getContextPath()%>/myshop/orderList.jsp"><strong>Order</strong><span>주문내역 조회</span></a></h3>
            <p><a href="order/list.html">고객님께서 주문하신 상품의<br/> 주문내역을 확인하실 수 있습니다.</a></p>
        </li>
        <li class="shopMain profile">
            <h3><a href="<%=request.getContextPath()%>/member/modify.jsp"><strong>Profile</strong><span>회원 정보</span></a></h3>
            <p><a href="../member/modify.html">회원이신 고객님의 개인정보를<br/> 관리하는 공간입니다.</a></p>
        </li>
        <li class="shopMain wishlist">
            <h3><a href="<%=request.getContextPath()%>/order/basket.jsp"><strong>Cart</strong><span>장바구니</span></a></h3>
            <p><a href="<%=request.getContextPath()%>/order/basket.jsp">장바구니에 담긴<br/>상품의 목록을 보여드립니다.</a></p>
        </li>


        <li class="shopMain consult displaynone">
            <h3><a href="../board/consult/list.html"><strong>Consult</strong><span>1:1 맞춤상담</span></a></h3>
            <p><a href="../board/consult/list.html">고객님의 궁금하신 문의사항에 대하여<br/> 1:1맞춤상담 내용을<br/> 확인하실 수 있습니다.</a></p>
        </li>

        <li class="shopMain board ">
            <h3><a href="board_list.jsp"><strong>Board</strong><span>게시물 관리</span></a></h3>
            <p><a href="board_list.jsp">고객님께서 작성하신 게시물을<br/> 관리하는 공간입니다.</a></p>
        </li>

    </ul>
</div>
    </div>
        </div>
        
     <hr class="layout"/></div><hr class="layout"></hr>
<%@include file="/include/footer.jsp"%>   
    <div id="bottom"></div> 
 
</div><hr class="layout"/><!-- 결제를 위한 필수 영역 --><div id="progressPaybar" style="display:none;">
    <div id="progressPaybarBackground" class="layerProgress"></div>
    <div id="progressPaybarView">
        <div class="box">
            <p class="graph">
                <span><img src="//img.echosting.cafe24.com/skin/base_ko_KR/layout/txt_progress.gif" alt="현재 결제가 진행중입니다."/></span>
                <span><img src="//img.echosting.cafe24.com/skin/base/layout/img_loading.gif" alt=""/></span>
            </p>
            <p class="txt">
                본 결제 창은 결제완료 후 자동으로 닫히며,결제 진행 중에 본 결제 창을 닫으시면<br/>
                주문이 되지 않으니 결제 완료 될 때 까지 닫지 마시기 바랍니다.
            </p>
        </div>
    </div>
</div>
<!-- // 결제를 위한 필수 영역 -->


<script type="text/javascript" src="http://ecudemo200642.cafe24.com/ind-script/i18n.php?lang=ko_KR&domain=front&v=2112291285" charset="utf-8"></script>

<script src="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=zVjbbtQwEH3v5pXvCAWEeKVbFRCtuipFPE-cSeLG9hhf2oavZ5JdoKUkm8tWQislWe-c4_HkeGa8aUUa0-NXLi0caLwjV6cOPUUnML3xqTx-Z5Ib_yIdsovSgqjTm-8RXbO7vU7eJi8nIvE-oDOg_G4gEUS1xKUs0alZS0hQJIWZDTUkyBRKijCL4jh5w59Zk_OvgdxfcbOOSsY_ers5BAySDTRbmZCiuOgevslQXf84hQCJlmYCj5IZo_Can_ejvHXShGIEPYnYunVGTq_JBEdKoduP26jo31t74mRejvAnBqn2WxWOukgdeVKMIHMUyB4pafAoA2PG-LWlEKQ1mbHW92B4NxqWtnUYxs_S4QJqq_i9_BsE1qYXlEmF6dUD_Na_gaj04DTlkYf8nbTTJiyiEW1AW7s88rbRvSIeyzDgBEs1_brdPQ8pFPxoFEE-CaRjgHbey8yju-17OT1gS6oppBotvRwLiCq0IfAaXDgZUF1r9KUi-2jCs47mM9RAad1eN_Ie1dAuGaBZdyr5OiiSHqhHcKKaFKsARdE8zUnTa0JWyg70f1SonPOl8Swgv5QJwUtTLmXRGCBvs_80HqtiKTnd3IKSDCf3i-_3QMIP4BfTtg6b3D-lZwbLUcTnm6FCZfHZ11GByZ-UuENOwElK8k56Nn5OaOFgYVIkgDN9TftT5B8PpmajKyzQoRG4jq69NxsnxUA-PCFw-SMeHk2ydnR6EuXaXJJrzqUP-9eowUDZ9mzR48rJspqKyR2UA3V1a_rQyzvMFJWTMvWvKKael7yy_bEchRe7b6uCW0AISz05FM24jrEKWnH3KoNEPyns4BsjttfZOI06G-oO9sAvXY5OmDCb4AR8jWE5gx3ejaM4NruucC7LmiJXlyVrueCOFcr56zhFS17On_-b9FV_khlJICguCIFDgQvgVx38mgKo9SI_OmXPFxQaLORSUZ9Ds8CHDw7y-VJ6HwNxDpSio-HCdDdf1XwckRuy0c6n4NpX426DLnuxj6gWif1c3iIf7Ou-U_pYlX2U7f8xzQH0umO6huwgPJ8C6pkRshAqRwpXIzqufWHuPW73gO2MPL6tgytuY7rD408&type=js&k=bba33f0c111f7402e9d5add050656e0f54558c4d&t=1637625572" ></script><script src="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=rc8xDsIwDIXhA4SVc7iqEBfhBGliNS5xHOoY1NsTEAsrZfun7-lBEkbA4Exx1R4WkWUchvNphGpTpuBS4wwa0UVUmgtMXhEWBZZoGSH7TaxB8A1nWbfDokf4Vf1YvSm8Jt6xS-xIEGYpe5XvtzejcHV3wsd_XbbcSJPUS6JaqcydfwI&type=js&k=71cd2bc4b79ae956606c3df49463fd1b9b461e1b&t=1635423561&user=T" ></script>
<script type="text/javascript">
CAFE24.MOBILE_WEB = false; var mobileWeb = CAFE24.MOBILE_WEB;
var bUseElastic = false;
var sSearchBannerUseFlag = 'F';
EC$(function() {
var sLocation = location.search;
var sCheckUseModule = /toMoveLoginCheckModule/;
var sMatchModule = sLocation.match(sCheckUseModule);
if (sMatchModule) {
return false;
} else {
var sRegParam = /[?]/;
var sMatchParam = sTargetUrl.match(sRegParam);
var sParam = (sMatchParam) ? "&" : "?";
window.location.href = sTargetUrl+sParam+"toMoveLoginCheckModule";
}
});
var aLogData = {"log_server1":"eclog2-225.cafe24.com","log_server2":"elg-db-svcm-269.cafe24.com","mid":"ecudemo200642","stype":"e","domain":"","shop_no":1,"lang":"ko_KR","ver":2,"hash":"","ca":"cfa-js.cafe24.com\/cfa.js","etc":""};
var sMileageName = '적립금';
var sMileageUnit = '[:PRICE:]원';
var sDepositName = '예치금';
var sDepositUnit = '원';
CAFE24.SHOP_CURRENCY_INFO = {"1":{"aShopCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"aShopSubCurrencyInfo":null,"aBaseCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"fExchangeRate":1,"fExchangeSubRate":null,"aFrontCurrencyFormat":{"head":"","tail":"\uc6d0"},"aFrontSubCurrencyFormat":{"head":"","tail":""}}}; var SHOP_CURRENCY_INFO = CAFE24.SHOP_CURRENCY_INFO;
var EC_ASYNC_LIVELINKON_ID = '';
if (EC$('[async_section=before]').length > 0) {
EC$('[async_section=before]').addClass('displaynone');
}

</script></body></html>

