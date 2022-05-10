<%@page import="InteriorDAO.FurnitureDAO"%>
<%@page import="InteriorDAO.DrawerDAO"%>
<%@page import="InteriorDTO.FurnitureDTO"%>
<%@page import="InteriorDTO.DrawerDTO"%>
<%@page import="InteriorDAO.BookshelfDAO"%>
<%@page import="InteriorDTO.BookshelfDTO"%>
<%@page import="InteriorDAO.PtlightDAO"%>
<%@page import="InteriorDAO.LightDAO"%>
<%@page import="InteriorDAO.HomegalleryDAO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@page import="InteriorDAO.DecoDAO"%>
<%@page import="InteriorDTO.PtlightDTO"%>
<%@page import="InteriorDTO.LightDTO"%>
<%@page import="InteriorDTO.HomegalleryDTO"%>
<%@page import="InteriorDTO.DecoDTO"%>
<%@page import="InteriorDTO.DlyDTO"%>
<%@page import="java.util.List"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");
List<DlyDTO> dlylist = DlyDAO.getDAO().ListSelectProduct();
List<DecoDTO> decolist = DecoDAO.getDAO().ListSelectProduct();
List<HomegalleryDTO> homelist = HomegalleryDAO.getDAO().ListSelectProduct();
List<LightDTO> lilist = LightDAO.getDAO().ListSelectLight();
List<PtlightDTO> ptlist = PtlightDAO.getDAO().ListSelectProduct();
List<BookshelfDTO> booklist= BookshelfDAO.getDAO().ListSelectProduct();
List<DrawerDTO> drlist = DrawerDAO.getDAO().ListSelectProduct();
List<FurnitureDTO> furlist = FurnitureDAO.getDAO().ListSelectProduct();
%>

<script type="text/javascript">
window.CAFE24 = window.CAFE24 || {};
CAFE24.getDeprecatedNamespace = function(sDeprecatedNamespace, sSupersededNamespace) {
var sNamespace = sSupersededNamespace 
? sSupersededNamespace 
: sDeprecatedNamespace.replace(/^EC_/, '');
return CAFE24[sNamespace];
}
CAFE24.SDE_SHOP_NUM = 1;CAFE24.SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },getDateFormat: function() { return "Y-m-d" },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },getCountryAndLangMap : function() { return {
"KR": "ko_KR",
}},isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return false; },getModeName : function() {return false; },isMobileAdmin : function() {return false; },isExperienceMall : function() { return false; },getAdminID : function() {return ''},getMallID : function() {return 'ecudemo200642'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
sPriceTxt = String(sPriceTxt);
}};         
CAFE24.FRONT_JS_CONFIG_MANAGE = {"sSmartBannerScriptUrl":"https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206","sMallId":"ecudemo200642","sDefaultAppDomain":"https:\/\/app4you.cafe24.com","sWebLogOffFlag":"F"};
var EC_FRONT_JS_CONFIG_MANAGE = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
CAFE24.FRONT_JS_CONFIG_MEMBER = {"sAuthUrl":"https:\/\/i-pin.cafe24.com\/certify\/1.0\/?action=auth"};
typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
</script>
<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nZBBCgMhEATvste8Y9g8Ig9IXqDuJCvotIwjJL-P7CmXwOK16eqCph2Fab0qVcVLfSHlhq6RKbZGT4UYRZQCWUZwoTN9jq4hd0sQF_CeBLvZrDT7D-scaj5knkRRXU7CLniRv35fKz12VLr_rt2OtdHZerTzekFPLadt2Eo6zvoC&type=css&k=3df06214bd79ead54f47098c414ed652a4a124f1&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tdWxbgMhDAbgPde1z-EorfoMHbr1CTjjgCXA6DBR8_b1NVGWjoENnU8f1i_LQJRMQLj0RluzQ_eU5XQ8fryfoPY1MS5Rc4LmafHUOBRYXSPA1iCL74kguat0BXRKQbbri5VeYZzbyG0YP8l52kbbSYKo1OEtq2Wx2-fzNLqMlnNPyi1K_eKmz-F30c6Mfzeh5Pxsx__Q24fBKOFhLxw6T4JVxHKuk_RIaRZdNxsXnJV3dYGLjfas1N06SV676vDRfuDyMy-QNCts-wmHbaf72EGyrZQdl-VtUtdWGP_APJbqd-RauYTRF6CUixkspY7P_Pb0eqdup38B&type=css&k=fe04e60c9d7bd9f0d26679cab135b8957108d03d&t=1636193578&user=T"  />

<body>
<hr class="layout"/><div id="container">
        <div id="contents" style="padding:0px 0 0;">
		<div app4you-smart-banner="smart-banner-admin-PC00003" app4you-smart-banner-html="true" class="xans-element- xans-smart-banner-admin xans-smart-banner-admin-PC00003">
  <div data-slider="true" data-type="full" data-mode="fade" data-minslides="1" data-maxslides="10" data-controls="true" data-adaptiveheight="true" data-autohover="true" data-responsive="true" class="smart-banner-wrapper circle" data-pager="true" data-auto="true" data-speed="500" data-pause="2000" data-banner-size-width="1250" data-banner-size-height="640">
    <ul style="width: auto; position: relative; visibility:hidden" class="smart-banner-bxslider"><li><a href="<%=request.getContextPath()%>/index.jsp" target="_self" onclick="APP4YOU_SMART_BANNER.incrementBanner('361871')" style="cursor:pointer"><img src="https://file.cafe24cos.com/banner-admin-live/upload/ecudemo200642/3ff20798-d829-4741-d6c3-aae9e472e1a1.jpeg"/></a></li>
      <li><a href="<%=request.getContextPath()%>/index.jsp" target="_self" onclick="APP4YOU_SMART_BANNER.incrementBanner('361870')" style="cursor:pointer"><img src="https://file.cafe24cos.com/banner-admin-live/upload/ecudemo200642/1490437c-5b2c-4cb0-9fb7-8ac945a825a2.jpeg"/></a></li>
      <li><a href="<%=request.getContextPath()%>/index.jsp" target="_self" onclick="APP4YOU_SMART_BANNER.incrementBanner('361869')" style="cursor:pointer"><img src="https://file.cafe24cos.com/banner-admin-live/upload/ecudemo200642/133c8d90-6aac-4f80-b7c4-f438002861c3.jpeg"/></a></li>
      <li><a href="<%=request.getContextPath()%>/index.jsp" target="_self" onclick="APP4YOU_SMART_BANNER.incrementBanner('361868')" style="cursor:pointer"><img src="https://file.cafe24cos.com/banner-admin-live/upload/ecudemo200642/36e90d2b-760f-4c72-c2d4-2663db746695.jpeg"/></a></li>
    </ul></div>
</div>

                           
<div class="xans-element- xans-product xans-product-listmain-3 xans-product-listmain xans-product-3 ec-base-product"><!--
        $only_html = yes
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
<h2>WEEKLY BEST</h2>
<div class="tab_box">
        <ul class="tab_best">
<li class="tab_m01">홈데코&장식품</li>
            <li class="tab_m02" >조명</li>
            <li class="tab_m03">수납&정리</li>
            <li class="tab_m04">가구</li>
        </ul>
<div class="p_list" id="best01">    
            <ul class="prdList">
<li id="anchorBoxId_11" class="first xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
               <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(1).getP_no()%>&p_name=<%=dlylist.get(1).getP_name()%>&p_price=<%=dlylist.get(1).getP_price()%>&p_imgsrc=<%=dlylist.get(1).getP_imgsrc()%>&p_kinds=<%=dlylist.get(1).getP_kinds()%>" name="anchorBoxName_42"> <img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=dlylist.get(1).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
               <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(1).getP_no()%>&p_name=<%=dlylist.get(1).getP_name()%>&p_price=<%=dlylist.get(1).getP_price()%>&p_imgsrc=<%=dlylist.get(1).getP_imgsrc()%>&p_kinds=<%=dlylist.get(1).getP_kinds()%>" name="anchorBoxName_42">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;"><%=dlylist.get(1).getP_name()%></span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">12,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('11', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_12" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
               <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(3).getP_no()%>&p_name=<%=dlylist.get(3).getP_name()%>&p_price=<%=dlylist.get(3).getP_price()%>&p_imgsrc=<%=dlylist.get(3).getP_imgsrc()%>&p_kinds=<%=dlylist.get(3).getP_kinds()%>" name="anchorBoxName_42"> <img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=dlylist.get(3).getP_imgsrc()%>" id="eListPrdImage12_4" alt="sample product 02"/></a>
                            </div>
                            <span class="wish"> </span>
               <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(3).getP_no()%>&p_name=<%=dlylist.get(3).getP_name()%>&p_price=<%=dlylist.get(3).getP_price()%>&p_imgsrc=<%=dlylist.get(3).getP_imgsrc()%>&p_kinds=<%=dlylist.get(3).getP_kinds()%>" name="anchorBoxName_42">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 02</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">22,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('12', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_13" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
			<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(5).getP_no()%>&p_name=<%=decolist.get(5).getP_name()%>&p_price=<%=decolist.get(5).getP_price()%>&p_imgsrc=<%=decolist.get(5).getP_imgsrc()%>&p_kinds=<%=decolist.get(5).getP_kinds()%>" name="anchorBoxName_13"> <img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=decolist.get(5).getP_imgsrc()%>" id="eListPrdImage13_4" alt="sample product 03"/></a>
                            </div>
                            <span class="wish"> </span>
			<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(5).getP_no()%>&p_name=<%=decolist.get(5).getP_name()%>&p_price=<%=decolist.get(5).getP_price()%>&p_imgsrc=<%=decolist.get(5).getP_imgsrc()%>&p_kinds=<%=decolist.get(5).getP_kinds()%>" name="anchorBoxName_13">                            
							<div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 03</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">32,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('13', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_14" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
				<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(7).getP_no()%>&p_name=<%=decolist.get(7).getP_name()%>&p_price=<%=decolist.get(7).getP_price()%>&p_imgsrc=<%=decolist.get(7).getP_imgsrc()%>&p_kinds=<%=decolist.get(7).getP_kinds()%>" name="anchorBoxName_13"> <img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=decolist.get(7).getP_imgsrc()%>" id="eListPrdImage14_4" alt="sample product 04"/></a>
                            </div>
                            <span class="wish"> </span>
				<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(7).getP_no()%>&p_name=<%=decolist.get(7).getP_name()%>&p_price=<%=decolist.get(7).getP_price()%>&p_imgsrc=<%=decolist.get(7).getP_imgsrc()%>&p_kinds=<%=decolist.get(7).getP_kinds()%>" name="anchorBoxName_13">                            
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 04</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">42,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('14', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>


            </ul>
</div>
        <div class="p_list" id="best02" style="display:none;">
            <ul class="prdList">
<li id="anchorBoxId_15" class="first xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
 		<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=lilist.get(3).getP_no()%>&p_name=<%=lilist.get(3).getP_name()%>&p_price=<%=lilist.get(3).getP_price()%>&p_imgsrc=<%=lilist.get(3).getP_imgsrc()%>&p_kinds=<%=lilist.get(3).getP_kinds()%>" name="anchorBoxName_41"> <img src="<%=request.getContextPath()%>/web/images/200_light/210_light/<%=lilist.get(3).getP_imgsrc()%>"  id="eListPrdImage15_4" alt="sample product 05"/></a>
                            </div>
                            
                            <span class="wish"> </span>
		<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=lilist.get(3).getP_no()%>&p_name=<%=lilist.get(3).getP_name()%>&p_price=<%=lilist.get(3).getP_price()%>&p_imgsrc=<%=lilist.get(3).getP_imgsrc()%>&p_kinds=<%=lilist.get(3).getP_kinds()%>" name="anchorBoxName_41">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 05</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">52,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('15', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_16" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
		<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=lilist.get(5).getP_no()%>&p_name=<%=lilist.get(5).getP_name()%>&p_price=<%=lilist.get(5).getP_price()%>&p_imgsrc=<%=lilist.get(5).getP_imgsrc()%>&p_kinds=<%=lilist.get(5).getP_kinds()%>" name="anchorBoxName_41"> <img src="<%=request.getContextPath()%>/web/images/200_light/210_light/<%=lilist.get(5).getP_imgsrc()%>" id="eListPrdImage16_4" alt="sample product 06"/></a>
                            </div>
                            <span class="wish"> </span>
		<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=lilist.get(5).getP_no()%>&p_name=<%=lilist.get(5).getP_name()%>&p_price=<%=lilist.get(5).getP_price()%>&p_imgsrc=<%=lilist.get(5).getP_imgsrc()%>&p_kinds=<%=lilist.get(5).getP_kinds()%>" name="anchorBoxName_41">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 06</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">62,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('16', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                
                <li id="anchorBoxId_17" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
 		<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=ptlist.get(1).getP_no()%>&p_name=<%=ptlist.get(1).getP_name()%>&p_price=<%=ptlist.get(1).getP_price()%>&p_imgsrc=<%=ptlist.get(1).getP_imgsrc()%>&p_kinds=<%=ptlist.get(1).getP_kinds()%>" name="anchorBoxName_41"> <img src="<%=request.getContextPath()%>/web/images/200_light/220_ptlight/<%=ptlist.get(1).getP_imgsrc()%>" id="eListPrdImage17_4" alt="샘플상품 07"/></a>
                            </div>
                            <span class="wish"> </span>
 		<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=ptlist.get(1).getP_no()%>&p_name=<%=ptlist.get(1).getP_name()%>&p_price=<%=ptlist.get(1).getP_price()%>&p_imgsrc=<%=ptlist.get(1).getP_imgsrc()%>&p_kinds=<%=ptlist.get(1).getP_kinds()%>" name="anchorBoxName_41">                           
 			 <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">샘플상품 07</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">72,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('17', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_18" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=ptlist.get(3).getP_no()%>&p_name=<%=ptlist.get(3).getP_name()%>&p_price=<%=ptlist.get(3).getP_price()%>&p_imgsrc=<%=ptlist.get(3).getP_imgsrc()%>&p_kinds=<%=ptlist.get(3).getP_kinds()%>" name="anchorBoxName_39"> <img src="<%=request.getContextPath()%>/web/images/200_light/220_ptlight/<%=ptlist.get(3).getP_imgsrc()%>" id="eListPrdImage18_4" alt="샘플상품 08"/></a>
                            </div>
                            <span class="wish"> </span>
    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=ptlist.get(3).getP_no()%>&p_name=<%=ptlist.get(3).getP_name()%>&p_price=<%=ptlist.get(3).getP_price()%>&p_imgsrc=<%=ptlist.get(3).getP_imgsrc()%>&p_kinds=<%=ptlist.get(3).getP_kinds()%>" name="anchorBoxName_39">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">샘플상품 08</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">82,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('18', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>

            </ul>
</div>  
        <div class="p_list" id="best03" style="display:none;">
            <ul class="prdList">
<li id="anchorBoxId_19" class="first xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/샘플상품-08/19/category/1/display/4/index.html" name="anchorBoxName_19"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(1).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
								<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=booklist.get(1).getP_no() %>&p_name=<%=booklist.get(1).getP_name()%>&p_price=<%=booklist.get(1).getP_price()%>&p_imgsrc=<%=booklist.get(1).getP_imgsrc()%>&p_kinds=<%=booklist.get(1).getP_kinds()%>" name="anchorBoxName_42">                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">샘플상품 08</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">82,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('19', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_20" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-01/20/category/1/display/4/index.html" name="anchorBoxName_20"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(2).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=booklist.get(2).getP_no() %>&p_name=<%=booklist.get(2).getP_name()%>&p_price=<%=booklist.get(2).getP_price()%>&p_imgsrc=<%=booklist.get(2).getP_imgsrc()%>&p_kinds=<%=booklist.get(2).getP_kinds()%>" name="anchorBoxName_41">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 01</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">12,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('20', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                
                <li id="anchorBoxId_21" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-02/21/category/1/display/4/index.html" name="anchorBoxName_21"><img src="<%=request.getContextPath()%>/web/images/300_organize/320_drawer/<%=drlist.get(2).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                 			<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=drlist.get(2).getP_no() %>&p_name=<%=drlist.get(2).getP_name()%>&p_price=<%=drlist.get(2).getP_price()%>&p_imgsrc=<%=drlist.get(2).getP_imgsrc()%>&p_kinds=<%=drlist.get(2).getP_kinds()%>" name="anchorBoxName_4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 02</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">22,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('21', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_22" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-03/22/category/1/display/4/index.html" name="anchorBoxName_22"><img src="<%=request.getContextPath()%>/web/images/300_organize/320_drawer/<%=drlist.get(4).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=drlist.get(4).getP_no() %>&p_name=<%=drlist.get(4).getP_name()%>&p_price=<%=drlist.get(4).getP_price()%>&p_imgsrc=<%=drlist.get(4).getP_imgsrc()%>&p_kinds=<%=drlist.get(4).getP_kinds()%>" name="anchorBoxName_40">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 03</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">32,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('22', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>

            </ul>
</div>   
        <div class="p_list" id="best04" style="display:none;">
            <ul class="prdList">
<li id="anchorBoxId_23" class="first xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-04/23/category/1/display/4/index.html" name="anchorBoxName_23"><img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=furlist.get(0).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=furlist.get(0).getP_no() %>&p_name=<%=furlist.get(0).getP_name()%>&p_price=<%=furlist.get(0).getP_price()%>&p_imgsrc=<%=furlist.get(0).getP_imgsrc()%>&p_kinds=<%=furlist.get(1).getP_kinds()%>" name="anchorBoxName_42">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 04</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">42,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('23', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_24" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-05/24/category/1/display/4/index.html" name="anchorBoxName_24"><img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=furlist.get(1).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=furlist.get(1).getP_no() %>&p_name=<%=furlist.get(1).getP_name()%>&p_price=<%=furlist.get(1).getP_price()%>&p_imgsrc=<%=furlist.get(1).getP_imgsrc()%>&p_kinds=<%=furlist.get(1).getP_kinds()%>" name="anchorBoxName_42">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 05</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">52,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('24', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_25" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-06/25/category/1/display/4/index.html" name="anchorBoxName_25"><img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=furlist.get(2).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=furlist.get(2).getP_no() %>&p_name=<%=furlist.get(2).getP_name()%>&p_price=<%=furlist.get(2).getP_price()%>&p_imgsrc=<%=furlist.get(2).getP_imgsrc()%>&p_kinds=<%=furlist.get(2).getP_kinds()%>" name="anchorBoxName_42">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 06</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">62,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('25', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                
                <li id="anchorBoxId_26" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/샘플상품-07/26/category/1/display/4/index.html" name="anchorBoxName_26"><img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=furlist.get(3).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=furlist.get(3).getP_no() %>&p_name=<%=furlist.get(3).getP_name()%>&p_price=<%=furlist.get(3).getP_price()%>&p_imgsrc=<%=furlist.get(3).getP_imgsrc()%>&p_kinds=<%=furlist.get(3).getP_kinds()%>" name="anchorBoxName_42">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">샘플상품 07</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">72,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('26', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>

            </ul>
</div>
        
        <div class="p_list" id="best05" style="display:none;">
            <ul class="prdList">
<li id="anchorBoxId_27" class="first xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/샘플상품-08/27/category/1/display/4/index.html" name="anchorBoxName_27"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/66623a68bee0691260882c4ac6dad56c.jpg" id="eListPrdImage27_4" alt="샘플상품 08"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=27&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">샘플상품 08</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">82,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('27', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>

                <li id="anchorBoxId_28" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-01/28/category/1/display/4/index.html" name="anchorBoxName_28"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/80984d4151c7613714d76de940f2a638.jpg" id="eListPrdImage28_4" alt="sample product 01"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=28&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 01</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">12,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('28', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_29" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-02/29/category/1/display/4/index.html" name="anchorBoxName_29"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/1fc8d547577d393226490653107b2cd1.jpg" id="eListPrdImage29_4" alt="sample product 02"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=29&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 02</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">22,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('29', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                
                <li id="anchorBoxId_30" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-03/30/category/1/display/4/index.html" name="anchorBoxName_30"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/e3fcbe6554a7d833790ae924f76bb8dc.jpg" id="eListPrdImage30_4" alt="sample product 03"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=30&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 03</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">32,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="4"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="4"></span></div></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('30', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>

            </ul>
</div>        
        
        <div class="p_list" id="best06" style="display:none;">
            <ul class="prdList">
<li id="anchorBoxId_31" class="first xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-04/31/category/1/display/4/index.html" name="anchorBoxName_31"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/3fa9de22432e687438c27d6618885ea6.jpg" id="eListPrdImage31_4" alt="sample product 04"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=31&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 04</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">42,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('31', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_32" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-05/32/category/1/display/4/index.html" name="anchorBoxName_32"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/30a3728facb2164bb332c92f3c106846.jpg" id="eListPrdImage32_4" alt="sample product 05"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=32&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 05</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">52,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('32', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                <li id="anchorBoxId_33" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/sample-product-06/33/category/1/display/4/index.html" name="anchorBoxName_33"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/3e2961b47f9f78ef9a67e1bb290aad5e.jpg" id="eListPrdImage33_4" alt="sample product 06"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=33&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">sample product 06</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">62,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('33', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>
                
                <li id="anchorBoxId_34" class="xans-record-">
                    <div class="prdbox">
                        <div class="prd_ov">
                            <div class="prdImg">
                            	<a href="product/샘플상품-07/34/category/1/display/4/index.html" name="anchorBoxName_34"><img src="//ecudemo200642.cafe24.com/web/product/medium/202110/8614d86c9cf54d8bf9d17497dc1b740d.jpg" id="eListPrdImage34_4" alt="샘플상품 07"/></a>
                            </div>
                            <span class="wish"> </span>
                            <a href="http://ecudemo200642.cafe24.com/product/detail.html?product_no=34&cate_no=1&display_group=4">
                            <div class="info">
                                <p class="name"><span style=""><span style="font-size:11px;color:#ffffff;">샘플상품 07</span></span></p>
                                <ul class="xans-element- xans-product xans-product-listitem-3 xans-product-listitem xans-product-3"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#ffffff;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#ffffff;">72,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
<div class="icon">
                                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                                    <div class="button">
                                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                                        <div class="option"></div>  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif"  onClick="zoom('34', '1', '4','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기" />                                    </div>
                                </div>                                  
                            </div>
                            </a>
                        </div>
                    </div>
                </li>

            </ul>
</div>


    </div>
</div>

            
            
            
            
            
    </div>     
</div>
            
            
<div class="container_w">         
<div class="contents">         
<div class="xans-element- xans-product xans-product-listmain-2 xans-product-listmain xans-product-2 ec-base-product"><!--
        $count = 3
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
<div class="title">
        <h2>
            <br/><br/><br/>NEW ARRIVALS<div class="line"></div>
            <span style="display: none;"><img src="index.html" alt="신상품"/></span>
        </h2>
    </div>
<ul class="prdList grid3">
<li id="anchorBoxId_11" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=booklist.get(5).getP_no() %>&p_name=<%=booklist.get(5).getP_name()%>&p_price=<%=booklist.get(5).getP_price()%>&p_imgsrc=<%=booklist.get(5).getP_imgsrc()%>&p_kinds=<%=booklist.get(5).getP_kinds()%>" name="anchorBoxName_41"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(5).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-01/11/category/1/display/3/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-2 xans-product-listitem xans-product-2 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">12,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="3"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="3"></span></div></li>
</ul>
</div>
        </li>
        <li id="anchorBoxId_12" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=booklist.get(4).getP_no() %>&p_name=<%=booklist.get(4).getP_name()%>&p_price=<%=booklist.get(4).getP_price()%>&p_imgsrc=<%=booklist.get(4).getP_imgsrc()%>&p_kinds=<%=booklist.get(4).getP_kinds()%>" name="anchorBoxName_41"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(4).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-02/12/category/1/display/3/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 02</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-2 xans-product-listitem xans-product-2 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">22,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="3"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="3"></span></div></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_13" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                   <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=booklist.get(3).getP_no() %>&p_name=<%=booklist.get(3).getP_name()%>&p_price=<%=booklist.get(3).getP_price()%>&p_imgsrc=<%=booklist.get(3).getP_imgsrc()%>&p_kinds=<%=booklist.get(3).getP_kinds()%>" name="anchorBoxName_41"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(3).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-03/13/category/1/display/3/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 03</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-2 xans-product-listitem xans-product-2 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">32,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="3"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="3"></span></div></li>
</ul>
</div>
        </li>
    </ul>
</div>
<br/><br/></div><!--content-->
</div><!--container-->
    
    
        <div class="container">        

            
<!--edibot_skin_data:{"width":1014,"mo_width":640}-->

<div class="xans-element- xans-product xans-product-listmain-1 xans-product-listmain xans-product-1 ec-base-product"><!--
        $count = 12
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
<div class="title">
        <h2>
            BEST ITEMS<div class="line"></div>
            <span style="display: none;"><img src="index.html" alt="추천상품"/></span>
        </h2>
    </div>
<ul class="prdList grid4">
<li id="anchorBoxId_12" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(11).getP_no()%>&p_name=<%=dlylist.get(11).getP_name()%>&p_price=<%=dlylist.get(11).getP_price()%>&p_imgsrc=<%=dlylist.get(11).getP_imgsrc()%>&p_kinds=<%=dlylist.get(11).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=dlylist.get(11).getP_imgsrc()%>" id="eListPrdImage21_4" alt="sample product 02"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-02/12/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 02</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">22,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="2"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="2"></span></div></li>
</ul>
</div>
        </li>
        <li id="anchorBoxId_13" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(9).getP_no()%>&p_name=<%=decolist.get(9).getP_name()%>&p_price=<%=decolist.get(9).getP_price()%>&p_imgsrc=<%=decolist.get(9).getP_imgsrc()%>&p_kinds=<%=decolist.get(9).getP_kinds()%>" name="anchorBoxName_13"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=decolist.get(9).getP_imgsrc()%>" id="eListPrdImage13_2" alt="sample product 03"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-03/13/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 03</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">32,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="2"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="2"></span></div></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_11" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(11).getP_no()%>&p_name=<%=decolist.get(11).getP_name()%>&p_price=<%=decolist.get(11).getP_price()%>&p_imgsrc=<%=decolist.get(11).getP_imgsrc()%>&p_kinds=<%=decolist.get(11).getP_kinds()%>" name="anchorBoxName_11"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=decolist.get(11).getP_imgsrc()%>" id="eListPrdImage11_2" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-01/11/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 01</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">12,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="2"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="2"></span></div></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_14" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=lilist.get(11).getP_no()%>&p_name=<%=lilist.get(11).getP_name()%>&p_price=<%=lilist.get(11).getP_price()%>&p_imgsrc=<%=lilist.get(11).getP_imgsrc()%>&p_kinds=<%=lilist.get(11).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/200_light/210_light/<%=lilist.get(11).getP_imgsrc()%>" alt="sample product 04"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-04/14/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 04</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">42,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_15" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
   			<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=ptlist.get(8).getP_no()%>&p_name=<%=ptlist.get(8).getP_name()%>&p_price=<%=ptlist.get(8).getP_price()%>&p_imgsrc=<%=ptlist.get(8).getP_imgsrc()%>&p_kinds=<%=ptlist.get(8).getP_kinds()%>" name="anchorBoxName_39"><img src="<%=request.getContextPath()%>/web/images/200_light/220_ptlight/<%=ptlist.get(8).getP_imgsrc()%>" id="eListPrdImage15_2" alt="sample product 05"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-05/15/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 05</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">52,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_16" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
   			<a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=ptlist.get(11).getP_no()%>&p_name=<%=ptlist.get(11).getP_name()%>&p_price=<%=ptlist.get(11).getP_price()%>&p_imgsrc=<%=ptlist.get(11).getP_imgsrc()%>&p_kinds=<%=ptlist.get(11).getP_kinds()%>" name="anchorBoxName_39"><img src="<%=request.getContextPath()%>/web/images/200_light/220_ptlight/<%=ptlist.get(11).getP_imgsrc()%>" id="eListPrdImage16_2" alt="sample product 06"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-06/16/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 06</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">62,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_17" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp??p_no=<%=booklist.get(6).getP_no()%>&p_name=<%=booklist.get(6).getP_name()%>&p_price=<%=booklist.get(6).getP_price()%>&p_imgsrc=<%=booklist.get(6).getP_imgsrc()%>&p_kinds=<%=booklist.get(6).getP_kinds()%>" name="anchorBoxName_17"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(6).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/샘플상품-07/17/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">샘플상품 07</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">72,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_18" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=booklist.get(7).getP_no() %>&p_name=<%=booklist.get(7).getP_name()%>&p_price=<%=booklist.get(7).getP_price()%>&p_imgsrc=<%=booklist.get(7).getP_imgsrc()%>&p_kinds=<%=booklist.get(7).getP_kinds()%>" name="anchorBoxName_41"><img src="<%=request.getContextPath()%>/web/images/300_organize/310_bookshelf/<%=booklist.get(7).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/샘플상품-08/18/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">샘플상품 08</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">82,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_19" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=drlist.get(5).getP_no() %>&p_name=<%=drlist.get(5).getP_name()%>&p_price=<%=drlist.get(5).getP_price()%>&p_imgsrc=<%=drlist.get(5).getP_imgsrc()%>&p_kinds=<%=drlist.get(5).getP_kinds()%>" name="anchorBoxName_40"><img src="<%=request.getContextPath()%>/web/images/300_organize/320_drawer/<%=drlist.get(5).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/샘플상품-08/19/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">샘플상품 08</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">82,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_20" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=drlist.get(7).getP_no() %>&p_name=<%=drlist.get(7).getP_name()%>&p_price=<%=drlist.get(7).getP_price()%>&p_imgsrc=<%=drlist.get(7).getP_imgsrc()%>&p_kinds=<%=drlist.get(7).getP_kinds()%>" name="anchorBoxName_40"><img src="<%=request.getContextPath()%>/web/images/300_organize/320_drawer/<%=drlist.get(7).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-01/20/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 01</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">12,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="2"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="2"></span></div></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_21" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=furlist.get(6).getP_no() %>&p_name=<%=furlist.get(6).getP_name()%>&p_price=<%=furlist.get(6).getP_price()%>&p_imgsrc=<%=furlist.get(6).getP_imgsrc()%>&p_kinds=<%=furlist.get(6).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=furlist.get(6).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <strong class="name"><a href="product/sample-product-02/21/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 02</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">22,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="2"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="2"></span></div></li>
</ul>
</div>
        </li>
<li id="anchorBoxId_22" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=furlist.get(7).getP_no() %>&p_name=<%=furlist.get(7).getP_name()%>&p_price=<%=furlist.get(7).getP_price()%>&p_imgsrc=<%=furlist.get(7).getP_imgsrc()%>&p_kinds=<%=furlist.get(7).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/400_furniture/<%=furlist.get(7).getP_imgsrc()%>" id="eListPrdImage11_4" alt="sample product 01"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>              
                <strong class="name"><a href="product/sample-product-03/22/category/1/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;">sample product 03</span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#aaaaaa;" data-i18n=PRODUCT.PRD_INFO_SUMMARY_DESC>상품요약정보</span> :</strong> <span style="font-size:11px;color:#aaaaaa;">상품 요약설명을 넣으실 수 있어요^^</span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;">32,000원</span><span id="span_product_tax_type_text" style=""> </span></li>
<li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:12px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_OPTION_COLORCHIP>상품색상</span> :</strong> <div class="color"><span class="chips" title="#000000" style="background-color:#000000" color_no="" displayGroup="2"></span><span class="chips" title="#FFFFFF" style="background-color:#FFFFFF" color_no="" displayGroup="2"></span></div></li>
</ul>
</div>
        </li>
    </ul>
</div>
<br/><br/><br/><br/><div app4you-smart-banner="smart-banner-admin-PC00002" app4you-smart-banner-html="true" class="xans-element- xans-smart-banner-admin xans-smart-banner-admin-PC00002">
  <div data-slider="true" data-type="full" data-mode="fade" data-minslides="1" data-maxslides="10" data-controls="true" data-adaptiveheight="true" data-autohover="true" data-responsive="true" class="smart-banner-wrapper circle" data-pager="true" data-auto="true" data-speed="500" data-pause="2000" data-banner-size-width="1250" data-banner-size-height="340">
    <ul style="width: auto; position: relative; visibility:hidden" class="smart-banner-bxslider"><li><a href="<%=request.getContextPath()%>/index.jsp" target="_self" onclick="APP4YOU_SMART_BANNER.incrementBanner('361872')" style="cursor:pointer"><img src="https://file.cafe24cos.com/banner-admin-live/upload/ecudemo200642/44b3205f-f49f-4233-bcf3-066fc02907c1.jpeg"/></a></li>
      <li><a href="<%=request.getContextPath()%>/index.jsp" target="_self" onclick="APP4YOU_SMART_BANNER.incrementBanner('361867')" style="cursor:pointer"><img src="https://file.cafe24cos.com/banner-admin-live/upload/ecudemo200642/bff35afe-e4e4-4402-e9ec-32178dab6b46.jpeg"/></a></li>
    </ul></div>
</div>
<br/><br/><br/></div></body>
<%@include file="/include/footer.jsp"%>