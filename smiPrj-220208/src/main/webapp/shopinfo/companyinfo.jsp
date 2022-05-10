<%@page import="java.io.File"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no"/>
<meta http-equiv="imagetoolbar" content="no">
<meta name="HandheldFriendly" content="true">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta property="og:image" content="/images/kakao.jpg"> 
<link rel="shortcut icon" href="/images/fa.ico">
<title>내 손을 자바</title>
<link rel="stylesheet" href="http://vittz.in/css/common.css">
<link rel="stylesheet" href="http://vittz.in/js/font-awesome/css/font-awesome.min.css?ver=191202">
<link rel="stylesheet" href="http://vittz.in/css/reset.css">
<link rel="stylesheet" href="http://vittz.in/css/layout.css">
<link rel="stylesheet" href="http://vittz.in/css/font.css">
<link rel="stylesheet" href="http://vittz.in/css/layout_responsive.css">
<link rel="stylesheet" href="http://vittz.in/css/main.css">
<link rel="stylesheet" href="http://vittz.in/css/main_responsive.css">
<link rel="stylesheet" href="http://vittz.in/css/xeicon.min.css">
<link rel="stylesheet" href="http://vittz.in/css/default.css?ver=191202">
<link rel="stylesheet" href="http://vittz.in/css/slick.css">
<link rel="stylesheet" href="http://vittz.in/css/aos.css">
<link rel="stylesheet" href="http://vittz.in/css/content.css">
<link rel="stylesheet" href="http://vittz.in/css/content_responsive.css">
<!--[if lte IE 8]>
<script src="http://vittz.in/js/html5.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://vittz.in";
var g5_bbs_url   = "http://vittz.in/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://vittz.in/js/jquery-1.12.4.min.js?ver=191202"></script>
<script src="http://vittz.in/js/jquery-migrate-1.4.1.min.js?ver=191202"></script>
<script src="http://vittz.in/js/jquery.menu.js?ver=191202"></script>
<script src="http://vittz.in/js/common.js?ver=191202"></script>
<script src="http://vittz.in/js/wrest.js?ver=191202"></script>
<script src="http://vittz.in/js/placeholders.min.js?ver=191202"></script>
<script src="http://vittz.in/js/slick.js?ver=191202"></script>
<script src="http://vittz.in/js/common_new.js?ver=191202"></script>
<script src="http://vittz.in/js/jquery.easing.1.3.js?ver=191202"></script>
<script src="http://vittz.in/js/nav.js?ver=191202"></script>
<script src="http://vittz.in/js/main.js?ver=191202"></script>
<script src="http://vittz.in/js/aos.js?ver=191202"></script>
</head>
<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nZBBCgMhEATvste8Y9g8Ig9IXqDuJCvotIwjJL-P7CmXwOK16eqCph2Fab0qVcVLfSHlhq6RKbZGT4UYRZQCWUZwoTN9jq4hd0sQF_CeBLvZrDT7D-scaj5knkRRXU7CLniRv35fKz12VLr_rt2OtdHZerTzekFPLadt2Eo6zvoC&type=css&k=3df06214bd79ead54f47098c414ed652a4a124f1&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tdVBbsQgDAXQ_aTbnoPRqOoZuuiuJ3CMB1ABIzBV5_YlnVEvUHsVFEfP0Y8JLnIhR7jNQX2sxfRU-HI-v75cXJt7TrhFKdkNT5unkUJ1OwxyOIYr7Gcm1_q6orhCdTbATwj0tMrPTtHOaUjlXiD_j85w4ynHOuFvH-RSuCqj9xvKKOHpKJxmMoKFOUtqRnqkbEU_hsRKh5AqCFmlDruRvE8R9dH-w_nbLpBsFfZ6CI3oVaCu9t97tClz7cgRuX3E1FqqQbsBcv1aRuLaUN1emyZwv2m7g6BjfCPw-oFnDizc1F9ZVhaHfb2a0dVs-N7X4at-ot-_ogeBg_4B&type=css&k=28da6e78c4c0c58e2a092b5ef36cd6b28a600368&t=1636193578&user=T"  />
<hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="xans-element- xans-product xans-product-menupackage "><div class="xans-element- xans-product xans-product-headcategory path "><span>현재 위치</span>
</div>
<div class="xans-element- xans-product xans-product-headcategory title "><p class="banner"></p>
<h2><span><strong style="font-size: 25px;">회사&사업소개</strong></span></h2>
<span class="likeButton displaynone"><button type="button"><strong></strong></button></span>
</div>

<ul class="menuCategory">
						<li style="display:run-in;"
							 class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a
							href="<%=request.getContextPath()%>/shopinfo/company.jsp" style="font-size:16px; font-weight:bold;"  >회사소개<span
								class="count displaynone">()</span></a></li>

						<li style="display:run-in;"
							 class="xans-element- xans-product xans-product-displaycategory  xans-record-"><a
							href="<%=request.getContextPath()%>/shopinfo/companyinfo.jsp" style="font-size:16px; font-weight:bold;">사업소개<span
								class="count displaynone">()</span></a></li>
					</ul>
</div>
<body>

<!-- 상단 시작 { -->
	<!-- //header -->
   <script src="/js/TweenMax.min.js"></script>

<section id="aboutVisual">
  <div class="about-visual-con">
    <div class="about-visual-item "><!-- 디폴트 이미지-->
      <div class="about-visual-pc-img visual04"></div>
      <div class="about-visual-txt-con">
        <div class="about-visual-txt-inner area">
          <p class="about-visual-txt"><strong>모두의 인테리어, 내 손을 자바</strong><br/>
            <span>내 손을 자바는 가구부터 조명까지 인테리어의 전문성과 노하우로<br>
            늘 고객님이 더 쉽고 친근하게 다가갈 수 있도록 도와드립니다.</span></p>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="business01" class="business clearfix"  data-aos="fade-up"     data-aos-duration="1000">
  <article class="area">
  <div class="fl_r">
      <h3>조명</h3>
      <p>내 손을 자바 조명은 2022년 론칭한 이후 온라인 쇼핑몰을 통해<br>
        다양한 조명을 선보이고 있습니다.가장 쉽고 편리하게 <br>
         경험할 수 있도록 고객의 마인드로 생각하는 <br>
         내 손을 자바 안심케어, 평생 수리 서비스 <br>
        내 손을 자바 딜리버리 서비스 등을 제공하도록 약속드립니다. </p>
      <p class="m_hidden"><a href="http://www.vittz.co.kr" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p>
    </div>
    <div class="fl_l cm-ac">
    <p class="m_view"><a href="http://www.vittz.co.kr" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p></div>
    
  </article>
</section>
<section id="business02" class="business clearfix"  data-aos="fade-up"     data-aos-duration="1000">
  <article class="area">
  <div class="fl_l">
      <h3>홈데코 & 장식품</h3>
      <p>인테리어 전문성과 노하우를 바탕으로 꼼꼼하게 직접 <br>
       선별한 내 손을 자바의 홈데코 / 장식품입니다. <br/>
       고객님들이 보다 쉬운 선택을 하실 수 있도록 <br>
       무료 실측/출장 컨설팅을 시행하고 있습니다.</p>
      <p class="m_hidden"><a href="https://www.vittz.co.kr/shop/page.html?id=38" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p>
    </div>
    <div class="fl_r cm-ac"><img src="" /> 
    <p class="m_view"><a href="https://www.vittz.co.kr/shop/page.html?id=38" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p></div>
    
  </article>
</section>
<section id="business03" class="business clearfix"  data-aos="fade-up"     data-aos-duration="1000">
  <article class="area">
  <div class="fl_r">
      <h3>수납 & 정리</h3>
      <p>직접 사입하여 보다 다양한 제품을 합리적인 가격으로 <br>
		선보이는 내 손을 자바의 수납 / 정리함입니다. <br>
		수납함 및 정리함의  무료 실측/출장 컨설팅 서비스를<br>
		통하여 고객 만족 서비스를 제공하고 있습니다. </p>
      <p class="m_hidden"><a href="https://www.vittz.co.kr/shop/page.html?id=35" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p>
    </div>
    <div class="fl_l cm-ac"><img src="" /> 
    <p class="m_view"><a href="https://www.vittz.co.kr/shop/page.html?id=35" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p></div>
    
  </article>
</section>
<section id="business04" class="business clearfix"  data-aos="fade-up"     data-aos-duration="1000">
  <article class="area">
  <div class="fl_l">
      <h3>가구</h3>
      <p>주문 한 번에 끝내실 수 있도록 인테리어에 <br>
         필요한 다양한 가구 제품들이 준비되어 있습니다. <br/>
         안전성과 실용성의 검증을 거친 제품들을 제공합니다.<br>
		 셀프 설치 가이드를 제공하고 있어 누구나 <br>
		 쉽게 인테리어를 시작하실 수 있습니다. </p>
      <p class="m_hidden"><a href="https://www.vittz.co.kr/shop/page.html?id=37" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p>
    </div>
    <div class="fl_r cm-ac"><img src="" /> 
    <p class="m_view"><a href="https://www.vittz.co.kr/shop/page.html?id=37" target="_blank"><img src="" /></a> <a href="https://apps.apple.com/kr/app/%EB%AA%A8%EB%91%90%EC%9D%98-%EC%9D%B8%ED%85%8C%EB%A6%AC%EC%96%B4-vittz/id919376551" target="_blank"><img src="" /></a> <a href="https://play.google.com/store/apps/details?id=com.looket.vittz" target="_blank"><img src="" /></a></p></div>
    
  </article>
</section>
﻿






<!-- } 하단 끝 -->


		<script>
			AOS.init();
		</script>



<%@include file="/include/footer.jsp"%>