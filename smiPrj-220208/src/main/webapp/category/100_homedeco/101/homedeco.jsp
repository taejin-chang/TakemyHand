<%@page import="InteriorDAO.OrdersDAO"%>
<%@page import="Util.PageIndex"%>
<%@page import="InteriorDAO.HomegalleryDAO"%>
<%@page import="InteriorDTO.HomegalleryDTO"%>
<%@page import="InteriorDAO.DecoDAO"%>
<%@page import="InteriorDTO.DecoDTO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@page import="InteriorDTO.DlyDTO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="InteriorDAO.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="index.html" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/category/outer/45/" />
<meta property="og:title" content="OUTER - OUTER" />
<meta property="og:description" content="OUTER" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="product.group" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>

<style>	
.prdImg{
	float: left;
}
</style>
<%
request.setCharacterEncoding("utf-8");
List<DlyDTO> dlylist = null;
List<DecoDTO> decolist = null;
List<HomegalleryDTO> homelist = null;

int totcount1 = DlyDAO.getDAO().DlyCount();
int totcount2 = DecoDAO.getDAO().DecoCount();
int totcount3 = HomegalleryDAO.getDAO().HomegalleryCount();
int totcount =  totcount1+totcount2+totcount3;

 String s_query="";
String search="";
String keyword="";
String url="homedeco.jsp"; 

//검색이 있을경우
if(request.getParameter("keyword")!=null){
	keyword = request.getParameter("keyword");
	search = request.getParameter("search");


}

if(keyword.equals("")){
	totcount =  totcount1+totcount2+totcount3;
	dlylist = DlyDAO.getDAO().ListSelectProduct();
	decolist = DecoDAO.getDAO().ListSelectProduct();
	homelist = HomegalleryDAO.getDAO().ListSelectProduct();
}
int nowpage = 1; // 현재페이지;
int maxlist = 5; // 페이지당 글수초기화
int totpage = 1; //총페이지 초기화

if(totcount % maxlist == 0){
	totpage = totcount / maxlist;
}else{
	totpage = totcount / maxlist+1;
}

if(totpage==0){
	totpage=1;
}

if(request.getParameter("page")!=null){
	nowpage = Integer.parseInt(request.getParameter("page"));
}

if(nowpage>totpage) {
	nowpage = totpage;
}

int startpage = (nowpage-1)*maxlist+1; //현재페이지 시작번호
int endpage = nowpage * maxlist;
int listcount = totcount-((nowpage-1)*maxlist);

	if(keyword.equals("")){
		dlylist = DlyDAO.getDAO().DlySearchList(startpage, endpage);
		decolist = DecoDAO.getDAO().DecoSearchList(startpage, endpage);
		homelist = HomegalleryDAO.getDAO().HomegallerySearchList(startpage, endpage);
}
	
//페이지스킵 처리
String pageSkip="";
if(keyword.equals("")){
	pageSkip=PageIndex.pageList(nowpage, totpage, url, "");	
}
  


%>

</head>
<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nZBBCgMhEATvste8Y9g8Ig9IXqDuJCvotIwjJL-P7CmXwOK16eqCph2Fab0qVcVLfSHlhq6RKbZGT4UYRZQCWUZwoTN9jq4hd0sQF_CeBLvZrDT7D-scaj5knkRRXU7CLniRv35fKz12VLr_rt2OtdHZerTzekFPLadt2Eo6zvoC&type=css&k=3df06214bd79ead54f47098c414ed652a4a124f1&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tdVBbsQgDAXQ_aTbnoPRqOoZuuiuJ3CMB1ABIzBV5_YlnVEvUHsVFEfP0Y8JLnIhR7jNQX2sxfRU-HI-v75cXJt7TrhFKdkNT5unkUJ1OwxyOIYr7Gcm1_q6orhCdTbATwj0tMrPTtHOaUjlXiD_j85w4ynHOuFvH-RSuCqj9xvKKOHpKJxmMoKFOUtqRnqkbEU_hsRKh5AqCFmlDruRvE8R9dH-w_nbLpBsFfZ6CI3oVaCu9t97tClz7cgRuX3E1FqqQbsBcv1aRuLaUN1emyZwv2m7g6BjfCPw-oFnDizc1F9ZVhaHfb2a0dVs-N7X4at-ot-_ogeBg_4B&type=css&k=28da6e78c4c0c58e2a092b5ef36cd6b28a600368&t=1636193578&user=T"  />
<hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="xans-element- xans-product xans-product-menupackage "><div class="xans-element- xans-product xans-product-headcategory path "><span>현재 위치</span>
</div>
<div class="xans-element- xans-product xans-product-headcategory title "><p class="banner"></p>
<h2><span><strong style="font-size: 25px;">홈데코&장식품</strong></span></h2>
<span class="likeButton displaynone"><button type="button"><strong></strong></button></span>
</div>

<ul class="menuCategory">
						<li style="display:run-in;"
							 class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a
							href="<%=request.getContextPath()%>/category/100_homedeco/110_DLY/111/dly.jsp" style="font-size:16px; font-weight:bold;"  >DLY 취미<span
								class="count displaynone">()</span></a></li>

						<li style="display:run-in;"
							 class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a
							href="<%=request.getContextPath()%>/category/100_homedeco/120_Interior/121/interior.jsp" style="font-size:16px; font-weight:bold;">인테리어 소품<span
								class="count displaynone">()</span></a></li>

						<li style="display:run-in;"
							 class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a
							href="<%=request.getContextPath()%>/category/100_homedeco/130_homegallery/131/homegallery.jsp" style="font-size:16px; font-weight:bold;">홈 갤러리<span
								class="count displaynone">()</span></a></li>
					</ul>
</div>

<div class="xans-element- xans-product xans-product-listrecommend ec-base-product"><!--
        $count = 4
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
<div class="title">
        <!--h3><span>in this category</span> BEST ITEM</h3-->
    </div>
<ul class="prdList grid4">
<li id="anchorBoxId_42" class="xans-record-">
            <div class="thumbnail">
<div class="label_best">
<span>BEST</span><span class="num">01</span>
</div> 
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(1).getP_no()%>&p_name=<%=dlylist.get(1).getP_name()%>&p_price=<%=dlylist.get(1).getP_price()%>&p_imgsrc=<%=dlylist.get(1).getP_imgsrc()%>&p_kinds=<%=dlylist.get(1).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/DLY1.JPG" id="eListPrdImage42_2" alt="샘플상품 07"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <span class="chk"><input type="checkbox" class="ProductCompareClass xECPCNO_42 displaynone"/></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/샘플상품-07/42/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=dlylist.get(1).getP_name() %></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=dlylist.get(1).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
        <li id="anchorBoxId_41" class="xans-record-">
            <div class="thumbnail">
<div class="label_best">
<span>BEST</span><span class="num">02</span>
</div>
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(3).getP_no()%>&p_name=<%=dlylist.get(3).getP_name()%>&p_price=<%=dlylist.get(3).getP_price()%>&p_imgsrc=<%=dlylist.get(3).getP_imgsrc()%>&p_kinds=<%=dlylist.get(3).getP_kinds()%>" name="anchorBoxName_41"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/DLY3.JPG" id="eListPrdImage41_2" alt="sample product 06"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <span class="chk"><input type="checkbox" class="ProductCompareClass xECPCNO_41 displaynone"/></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/sample-product-06/41/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=dlylist.get(3).getP_name() %></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=dlylist.get(3).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
        <li id="anchorBoxId_40" class="xans-record-">
            <div class="thumbnail">
<div class="label_best">
<span>BEST</span><span class="num">03</span>
</div>
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(1).getP_no()%>&p_name=<%=decolist.get(1).getP_name()%>&p_price=<%=decolist.get(1).getP_price()%>&p_imgsrc=<%=decolist.get(1).getP_imgsrc()%>&p_kinds=<%=decolist.get(1).getP_kinds()%>" name="anchorBoxName_40"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/DECO1.JPG" id="eListPrdImage40_2" alt="sample product 05"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <span class="chk"><input type="checkbox" class="ProductCompareClass xECPCNO_40 displaynone"/></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/sample-product-05/40/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=decolist.get(1).getP_name()%></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=decolist.get(1).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>          
        <li id="anchorBoxId_39" class="xans-record-">
            <div class="thumbnail">
<div class="label_best">
<span>BEST</span><span class="num">04</span>
</div>
                <div class="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=homelist.get(1).getP_no() %>&p_name=<%=homelist.get(1).getP_name()%>&p_price=<%=homelist.get(1).getP_price()%>&p_imgsrc=<%=homelist.get(1).getP_imgsrc()%>&p_kinds=<%=homelist.get(1).getP_kinds()%>" name="anchorBoxName_39"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/130_Homegallery/HG1.JPG" id="eListPrdImage39_2" alt="sample product 04"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    <div class="button">
                        <div class="likeButton displaynone"><button type="button"><strong></strong></button></div>
                        <div class="option"></div>
                    </div>
                </div>                
                <span class="chk"><input type="checkbox" class="ProductCompareClass xECPCNO_39 displaynone"/></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/sample-product-04/39/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=homelist.get(1).getP_name() %></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=homelist.get(1).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>   
                
    </ul>
</div>


<div class="xans-element- xans-product xans-product-normalpackage "><div class="xans-element- xans-product xans-product-normalmenu "><!--
            $compare_page = /product/compare.html
        -->
<div class="function" id="Product_ListMenu">
            <p class="prdCount" style="font-size: 15px;">Total : <strong style="font-size: 15px;"><%=totcount%></strong> items</p>
            <ul id="type" class="xans-element- xans-product xans-product-orderby">

</ul>
        </div>
</div>
<div class="xans-element- xans-product xans-product-listrecommend ec-base-product"><!--
        $count = 4
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
<div class="title">
        <!--h3><span>in this category</span> BEST ITEM</h3-->
    </div>
<ul class="prdList grid4">


<% for(int i=0; i<dlylist.size(); i++){%>
<li id="anchorBoxId_42" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg" id="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=dlylist.get(i).getP_no()%>&p_name=<%=dlylist.get(i).getP_name()%>&p_price=<%=dlylist.get(i).getP_price()%>&p_imgsrc=<%=dlylist.get(i).getP_imgsrc()%>&p_kinds=<%=dlylist.get(i).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/110_DLY/<%=dlylist.get(i).getP_imgsrc()%>"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" /></div>
                    
                </div>                
                <span class="chk"></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/샘플상품-07/42/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=dlylist.get(i).getP_name() %></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=dlylist.get(i).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
	

<%} %>





<% for(int i=0; i<decolist.size(); i++){%>
	

<li id="anchorBoxId_42" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg" id="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=decolist.get(i).getP_no()%>&p_name=<%=decolist.get(i).getP_name()%>&p_price=<%=decolist.get(i).getP_price()%>&p_imgsrc=<%=decolist.get(i).getP_imgsrc()%>&p_kinds=<%=decolist.get(i).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/120_interior/<%=decolist.get(i).getP_imgsrc()%>"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    
                </div>                
                <span class="chk"></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/샘플상품-07/42/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=decolist.get(i).getP_name() %></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=decolist.get(i).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>

<%} %>

<% for(int i=0; i<homelist.size(); i++){%>
<li id="anchorBoxId_42" class="xans-record-">
            <div class="thumbnail">
                <div class="prdImg" id="prdImg">
                    <a href="<%=request.getContextPath()%>/product_detail/product_detail01.jsp?p_no=<%=homelist.get(i).getP_no() %>&p_name=<%=homelist.get(i).getP_name()%>&p_price=<%=homelist.get(i).getP_price()%>&p_imgsrc=<%=homelist.get(i).getP_imgsrc()%>&p_kinds=<%=homelist.get(i).getP_kinds()%>" name="anchorBoxName_42"><img src="<%=request.getContextPath()%>/web/images/100_homedeco/130_Homegallery/<%=homelist.get(i).getP_imgsrc()%>"/></a>
                    <span class="wish"> </span>
                </div>
            </div>
            <div class="description">
                <div class="icon">
                    <div class="promotion">  <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330066300.gif"  class="icon_img" alt="추천" /> <img src="<%=request.getContextPath()%>/web/upload/icon_202110282330129000.gif"  class="icon_img" alt="New" />    </div>
                    
                </div>                
                <span class="chk"></span>
                <strong class="name"><a href="<%=request.getContextPath()%>/product/샘플상품-07/42/category/45/display/2/index.html" class=""><span class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_NAME>상품명</span> :</span> <span style="font-size:11px;color:#555555;"><%=homelist.get(i).getP_name() %></span></a></strong>
                <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
<strong class="title displaynone"><span style="font-size:11px;color:#555555;" data-i18n=PRODUCT.PRD_INFO_PRODUCT_PRICE>판매가</span> :</strong> <span style="font-size:11px;color:#555555;"><%=homelist.get(i).getP_price()%>원</span><span id="span_product_tax_type_text" style=""> </span></li>
</ul>
</div>
        </li>
	
	
<%} %>


        </div>
        			<%=pageSkip %>
      <div id="gotop" style="display:block;">
            <a href="#header"><img src="<%=request.getContextPath()%>/web/images/etc/go_top.png" alt="맨위로"/></a>
            <a href="#bottom"><img src="<%=request.getContextPath()%>/web/images/etc/go_down.png" alt="맨아래로"/></a>
        </div>


</div><hr class="layout"/></div></div></div>
<%@include file="/include/footer.jsp"%>
</script></body></html>