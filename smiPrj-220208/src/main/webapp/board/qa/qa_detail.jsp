<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDAO.QuestionDAO"%>
<%@page import="InteriorDTO.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>

<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("q_no")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/error/error400.jsp';");
		out.println("</script>");
		return;	
	}

	//전달값을 반환받아 저장
	int q_no=Integer.parseInt(request.getParameter("q_no"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//글번호를 전달받아 BOARD 테이블에 저장된 해당 글번호의 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	QuestionDTO qa=QuestionDAO.getDAO().selectQna(q_no);
	
	//검색된 게시글이 없거나 삭제글인 경우 => 비정상적인 요청에 대한 응답 처리
	if(qa==null || qa.getQ_status()=="0") {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/error/error400.jsp';");
		out.println("</script>");
		return;	
	}
	
	//검색된 게시글이 비밀글인 경우
	if(qa.getQ_status()=="2") {
		//비로그인 사용자이거나 로그인 사용자가 작성자 또는 관리자가 아닌 경우
		// => 비정상적인 요청에 대한 응답 처리
		if(loginMember==null || 
			!loginMember.getM_userid().equals(qa.getM_userid()) && loginMember.getM_grade()!=9) {
			out.println("<script type='text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/error/error400.jsp';");
			out.println("</script>");
			return;	
		}
	}
	
	//글번호를 전달받아 BOARD 테이블에 저장된 해당 글번호의 게시글에 조회수를 증가하는 DAO 클래스의 메소드 호출
	QuestionDAO.getDAO().updateCount(q_no);
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head><script>
(function(i, s, o, g, r, a, m) {
    a = s.createElement(o);
    m = s.getElementsByTagName(o)[0];
    a.src = g;
    a.onload = function() {
        i[r].init('https://js-error-tracer-api.cafe24.com', {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJlY3VkZW1vMjAwNjQyLmNhZmUyNC5jb20iLCJhdWQiOiJqcy1lcnJvci10cmFjZXItYXBpLmNhZmUyNC5jb20iLCJtYWxsX2lkIjoiZWN1ZGVtbzIwMDY0MiIsInNob3Bfbm8iOjEsInBhdGhfcm9sZSI6IkJPQVJEX1BST0RVQ1RfREVUQUlMIiwibGFuZ3VhZ2VfY29kZSI6ImtvX0tSIiwiY291bnRyeV9jb2RlIjoiS1IiLCJvcmlnaW4iOiJodHRwOlwvXC9lY3VkZW1vMjAwNjQyLmNhZmUyNC5jb20iLCJpc19jb250YWluZXIiOmZhbHNlLCJob3N0bmFtZSI6InVkbXAtMTE1In0.VhBC35HDypJsBR5r1Ce-obSE4DOnvMFOFxT3O0G-ZfA","collectWindowErrors":true,"preventDuplicateReport":true,"storageKeyPrefix":"EC_JET.BOARD_PRODUCT_DETAIL"});
    };
    m.parentNode.insertBefore(a, m);
}(window, document, 'script', '/ind-script/optimizer.php?filename=08_Iz03VNzQq0i8oyk8vSszVLy8v18_MS-EqTi7KLCjRz0oFY57czDyerGIA&type=js&k=f8c449ff82a3977059c3195db755507c2666c339&t=1625595405', 'EC_JET'));
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="http://ecudemo200642.cafe24.com/article/상품-qa/6/14/" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/article/상품-qa/6/14/" />
<meta property="og:title" content="asd상품 Q&amp;A - 쇼핑몰 이름" />
<meta property="og:description" content="상품 Q&amp;A입니다." />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="article" />
<link rel="shortcut icon" href="/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=6120d0d12e728bf508ae0605bb43635b"></script>
<script type="text/javascript">
window.CAFE24 = window.CAFE24 || {};
CAFE24.MANIFEST_CACHE_REVISION = '2201261295';
CAFE24.getDeprecatedNamespace = function(sDeprecatedNamespace, sSupersededNamespace) {
var sNamespace = sSupersededNamespace 
? sSupersededNamespace 
: sDeprecatedNamespace.replace(/^EC_/, '');
return CAFE24[sNamespace];
}
CAFE24.MOBILE = false;
CAFE24.MOBILE_DEVICE = false;
CAFE24.MOBILE_USE = false;
var EC_MOBILE = CAFE24.MOBILE;
var EC_MOBILE_DEVICE = CAFE24.MOBILE_DEVICE;
var EC_MOBILE_USE = CAFE24.MOBILE_USE;
CAFE24.SKIN_CODE = "base";
CAFE24.FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = {"common_member_id_crypt":"1a02d5235451c9c13e3be4421d21ad7ccfba725c2f87320de4e91facaedda3c5"};
var EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = CAFE24.getDeprecatedNamespace('EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA');
CAFE24.SDE_SHOP_NUM = 1;CAFE24.SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },getDateFormat: function() { return "Y-m-d" },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },getCountryAndLangMap : function() { return {
"KR": "ko_KR",
"US": "en_US",
"JP": "ja_JP",
"CN": "zh_CN",
"TW": "zh_TW",
"VN": "vi_VN",
"PH": "en_PH"
}},isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return false; },getModeName : function() {return false; },isMobileAdmin : function() {return false; },isExperienceMall : function() { return false; },getAdminID : function() {return 'asdf12'},getMallID : function() {return 'ecudemo200642'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
sPriceTxt = String(sPriceTxt);
var aCurrencySymbol = ["","\uc6d0",false];
if (typeof CAFE24.SHOP_PRICE !== 'undefined' && isNaN(sPriceTxt.replace(/[,]/gi, '')) === false && bIsNumberFormat === true) {
// bIsNumberFormat 사용하려면 Ui(':libUipackCurrency')->plugin('Currency') 화폐 라이브러리 추가 필요
sPriceTxt = CAFE24.SHOP_PRICE.toShopPrice(sPriceTxt.replace(/[,]/gi, ''), true, CAFE24.SDE_SHOP_NUM);
}
try {
var sPlusMinusSign = (sPriceTxt.toString()).substr(0, 1);
if (sPlusMinusSign === '-' || sPlusMinusSign === '+') {
sPriceTxt = (sPriceTxt.toString()).substr(1);
return sPlusMinusSign + aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
} else {
return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
}
} catch (e) {
return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
}
}};CAFE24.CURRENCY_INFO = {getOriginReferenceCurrency : function() {return 'USD'},getCurrencyList : function(sCurrencyCode) { var aCurrencyList = {"JPY":{"currency_symbol":"&yen;","decimal_place":0,"round_method_type":"F"},"VND":{"currency_symbol":"&#8363;","decimal_place":0,"round_method_type":"F"},"PHP":{"currency_symbol":"&#8369;","decimal_place":2,"round_method_type":"R"},"USD":{"currency_symbol":"$","decimal_place":2,"round_method_type":"R"},"CNY":{"currency_symbol":"&yen;","decimal_place":2,"round_method_type":"R"},"TWD":{"currency_symbol":"NT$","decimal_place":0,"round_method_type":"F"},"EUR":{"currency_symbol":"\u20ac","decimal_place":2,"round_method_type":"R"},"BRL":{"currency_symbol":"R$","decimal_place":2,"round_method_type":"R"},"AUD":{"currency_symbol":"A$","decimal_place":2,"round_method_type":"R"},"BHD":{"currency_symbol":".&#1583;.&#1576;","decimal_place":3,"round_method_type":"R"},"BDT":{"currency_symbol":"&#2547;","decimal_place":2,"round_method_type":"R"},"GBP":{"currency_symbol":"&pound;","decimal_place":2,"round_method_type":"R"},"CAD":{"currency_symbol":"C$","decimal_place":2,"round_method_type":"R"},"CZK":{"currency_symbol":"K&#269;","decimal_place":2,"round_method_type":"R"},"DKK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"HKD":{"currency_symbol":"HK$","decimal_place":2,"round_method_type":"R"},"HUF":{"currency_symbol":"Ft","decimal_place":2,"round_method_type":"R"},"INR":{"currency_symbol":"&#8377;","decimal_place":2,"round_method_type":"R"},"IDR":{"currency_symbol":"Rp","decimal_place":2,"round_method_type":"R"},"ILS":{"currency_symbol":"&#8362;","decimal_place":2,"round_method_type":"R"},"JOD":{"currency_symbol":" &#1583;&#1610;&#1606;&#1575;&#1585;","decimal_place":3,"round_method_type":"R"},"KWD":{"currency_symbol":"&#1583;&#1610;&#1606;&#1575;&#1585;","decimal_place":3,"round_method_type":"R"},"MYR":{"currency_symbol":"RM","decimal_place":2,"round_method_type":"R"},"MXN":{"currency_symbol":"Mex$","decimal_place":2,"round_method_type":"R"},"NZD":{"currency_symbol":"NZ$","decimal_place":2,"round_method_type":"R"},"NOK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"PKR":{"currency_symbol":"&#8360;","decimal_place":2,"round_method_type":"R"},"PLN":{"currency_symbol":"z\u0142","decimal_place":2,"round_method_type":"R"},"RUB":{"currency_symbol":"\u0440\u0443\u0431","decimal_place":2,"round_method_type":"R"},"SAR":{"currency_symbol":"&#65020;","decimal_place":2,"round_method_type":"R"},"SGD":{"currency_symbol":"S$","decimal_place":2,"round_method_type":"R"},"ZAR":{"currency_symbol":"R","decimal_place":2,"round_method_type":"R"},"SEK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"CHF":{"currency_symbol":"Fr","decimal_place":2,"round_method_type":"R"},"THB":{"currency_symbol":"&#3647;","decimal_place":2,"round_method_type":"R"},"TRY":{"currency_symbol":"TL","decimal_place":2,"round_method_type":"R"},"AED":{"currency_symbol":"&#1601;&#1604;&#1587;","decimal_place":2,"round_method_type":"R"}}; return aCurrencyList[sCurrencyCode] },isUseReferenceCurrency : function() {return false }};CAFE24.COMMON_UTIL = {convertSslForString : function(sString) { return sString.replace(/http:/gi, '');},convertSslForHtml : function(sHtml) { return sHtml.replace(/((?:src|href)\s*=\s*['"])http:(\/\/(?:[a-z0-9\-_\.]+)\/)/ig, '$1$2');},getProtocol : function() { return 'http'; },moveSsl : function() { if (CAFE24.COMMON_UTIL.getProtocol() === 'http') { var oLocation = jQuery(window.location); var sUrl = 'https://' + oLocation.attr('host') + oLocation.attr('pathname') + oLocation.attr('search'); window.location.replace(sUrl); } },setEcCookie : function(sKey, sValue, iExpire) {var exdate = new Date();exdate.setDate(exdate.getDate() + iExpire);var setValue = escape(sValue) + "; domain=." + CAFE24.GLOBAL_INFO.getBaseDomain() + "; path=/;expires=" + exdate.toUTCString();document.cookie = sKey + "=" + setValue;}};CAFE24.SHOP_LIB_INFO = {getBankInfo : function() { 
var oBankInfo = "";
$.ajax({
type: "GET",
url: "/exec/front/Shop/Bankinfo",
dataType: "json",
async: false,
success: function(oResponse) {
oBankInfo = oResponse;
}
});
return oBankInfo; }};            var EC_SDE_SHOP_NUM = CAFE24.SDE_SHOP_NUM;
var SHOP = CAFE24.getDeprecatedNamespace('SHOP');
var EC_COMMON_UTIL = CAFE24.getDeprecatedNamespace('EC_COMMON_UTIL');
var EC_SHOP_LIB_INFO = CAFE24.getDeprecatedNamespace('EC_SHOP_LIB_INFO');
var EC_CURRENCY_INFO = CAFE24.getDeprecatedNamespace('EC_CURRENCY_INFO');
CAFE24.ROOT_DOMAIN = "cafe24.com";
CAFE24.API_DOMAIN = "cafe24api.com";
CAFE24.TRANSLATE_LOG_STATUS = "F";
CAFE24.GLOBAL_INFO = (function() {
var oData = {"base_domain":"ecudemo200642.cafe24.com","root_domain":"cafe24.com","api_domain":"cafe24api.com","is_global":false,"is_global_standard":false,"country_code":"KR","language_code":"ko_KR","admin_language_code":"ko_KR"};
return {
getBaseDomain: function() {
return oData['base_domain'];
},
getRootDomain: function() {
return oData['root_domain'];
},
getApiDomain: function() {
return oData['api_domain'];
},
isGlobal: function() {
return oData['is_global'];
},
isGlobalStandard: function() {
return oData['is_global_standard'];
},
getCountryCode: function() {
return oData['country_code'];
},
getLanguageCode: function() {
return oData['language_code'];
},
getAdminLanguageCode: function() {
return oData['admin_language_code'];
}
};
})();
var EC_ROOT_DOMAIN = CAFE24.ROOT_DOMAIN;
var EC_API_DOMAIN = CAFE24.API_DOMAIN;
var EC_TRANSLATE_LOG_STATUS = CAFE24.TRANSLATE_LOG_STATUS;
var EC_GLOBAL_INFO = CAFE24.getDeprecatedNamespace('EC_GLOBAL_INFO');
CAFE24.AVAILABLE_LANGUAGE = ["ko_KR","zh_CN","en_US","zh_TW","es_ES","pt_PT","vi_VN","ja_JP","en_PH"];
CAFE24.AVAILABLE_LANGUAGE_CODES = {"ko_KR":"KOR","zh_CN":"CHN","en_US":"ENG","zh_TW":"TWN","es_ES":"ESP","pt_PT":"PRT","vi_VN":"VNM","ja_JP":"JPN","en_PH":"PHL"};
var EC_AVAILABLE_LANGUAGE = CAFE24.AVAILABLE_LANGUAGE;
var EC_AVAILABLE_LANGUAGE_CODES = CAFE24.AVAILABLE_LANGUAGE_CODES;
CAFE24.GLOBAL_PRODUCT_LANGUAGE_CODES = {  
sClearanceCategoryCode: '',
sManualLink: '//serviceguide.cafe24shop.com/ko_KR/PR.PD.GA.html',
sHsCodePopupLink: 'https://www.wcotradetools.org/en/harmonized-system',
aCustomRegex: '"PHL" : "^[0-9]{8}[A-Z]?$"',
sCountryCodeData: 'kor',
sEnglishExampleURlForGlobal: '',
aReverseAddressCountryCode: ["VNM","PHL"],
aSizeGuideCountryAlign: '["US","UK","EU","KR","JP","CN"]',
aIsSupportTran: ["ja_JP","zh_CN","zh_TW","en_US","vi_VN","en_PH","pt_PT","es_ES"]
};
var EC_GLOBAL_PRODUCT_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_PRODUCT_LANGUAGE_CODES');
CAFE24.GLOBAL_ORDER_LANGUAGE_CODES = {
aModifyOrderLanguage: {"KR":"ko_KR","JP":"ja_JP","CN":"zh_CN","TW":"zh_TW","VN":"vi_VN","PH":"en_PH"},
aUseIdCardKeyCountry: ["CN","TW"],
aLanguageWithCountryCode: {"zh_CN":["CN","CHN","HK","HNK"],"ja_JP":["JP","JPN"],"zh_TW":["TW","TWN"],"ko_KR":["KR","KOR"],"vi_VN":["VN","VNM"],"en_PH":["PH","PHL"]},
aCheckDisplayRequiredIcon: ["ja_JP","zh_CN","zh_TW","en_US","vi_VN","en_PH"],
aSetReceiverName: {"zh_CN":{"sCountry":"CN","bUseLastName":true},"zh_TW":{"sCountry":"TW","bUseLastName":false},"ja_JP":{"sCountry":"JP","bUseLastName":true}},
aSetDeferPaymethodLanguage: {"ja_JP":"\uc77c\ubcf8","zh_CN":"\uc911\uad6d"},
aUseDeferPaymethod: ["ja_JP","zh_CN"],
aCheckShippingCompanyAndPaymethod: ["ja_JP","zh_CN"],
aSetDeferPaymethodLanguageForShipping: {"ja_JP":"\u65e5\u672c","zh_CN":"\uc911\uad6d"},
aCheckStoreByPaymethod: ["ja_JP","zh_CN"],
aCheckIsEmailRequiredForJs: ["en_US","zh_CN","zh_TW","ja_JP","vi_VN","en_PH"],
aSetIdCardKeyCountryLanguage: {"CN":"\uc911\uad6d\uc758","TW":"\ub300\ub9cc\uc758"},
aReverseGlobalAddress: ["en_PH","vi_VN","PHL","VNM","VN","PH"],
aNoCheckZipCode: ["KOR","JPN"],
aNotPostCodeAPICountryList: ["en_US","es_ES","pt_PT","en_PH"],
aEnableSearchExchangeAddr: ["KR","JP","CN","VN","TW","PH"],
aDuplicatedBaseAddr: ["TW","JP"],
aReverseAddressCountryCode: ["VN","PH"],
aCheckZipCode: ["PHL","en_PH","PH"]
};
var EC_GLOBAL_ORDER_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_ORDER_LANGUAGE_CODES');
CAFE24.GLOBAL_MEMBER_LANGUAGE_CODES = {  
sAdminWebEditorLanguageCode: 'ko' ,
oNotAvailDecimalPointLanguages: ["ko_KR","ja_JP","zh_TW","vi_VN"],
oAddressCountryCode: {"KOR":"ko_KR","JPN":"ja_JP","CHN":"zh_CN","TWN":"zh_TW","VNM":"vi_VN","PHL":"en_PH"},
};
var EC_GLOBAL_MEMBER_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_MEMBER_LANGUAGE_CODES');
CAFE24.GLOBAL_BOARD_LANGUAGE_CODES = {  
bUseLegacyBoard: true
};
var EC_GLOBAL_BOARD_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_BOARD_LANGUAGE_CODES');
CAFE24.GLOBAL_MALL_LANGUAGE_CODES = {
oDesign: {
oDesignAddReplaceInfo: {"group_id":"SKIN.ADD.ADMIN.DESIGNDETAIL","replacement":{"KR":"KOREAN","US":"ENGLISH","JP":"JAPANESE","CN":"SIMPLIFIED.CHINESE","TW":"TRADITIONAL.CHINESE","ES":"SPANISH","PT":"PORTUGUESE","PH":"ENGLISH"}},
oDesignDetailLanguageCountryMap: {"KR":"ko_KR","JP":"ja_JP","CN":"zh_CN","TW":"zh_TW","US":"en_US","ES":"es_ES","PT":"pt_PT","PH":"en_PH"},
oSmartDesignSwitchTipLink: {"edibot":{"img":"\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/img_editor_dnd.png","link":"\/\/ecsupport.cafe24.com\/board\/free\/list.html?board_act=list&board_no=12&category_no=9&cate_no=9"},"smart":{"img":"\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/ko_KR\/img_editor_smart.png","link":"\/\/sdsupport.cafe24.com"}},
oSmartDesignDecoShopList: ["ko_KR","ja_JP","zh_CN","en_US","zh_TW","es_ES","pt_PT"],
oSmartDesignDecoMultilingual: {"list":{"ko_KR":"KOREAN","en_US":"ENGLISH","ja_JP":"JAPANESE","zh_CN":"SIMPLIFIED.CHINESE","zh_TW":"TRADITIONAL.CHINESE","es_ES":"SPANISH","pt_PT":"PORTUGUESE","vi_VN":"VIETNAMESE"},"group_id":"EDITOR.LAYER.EDITING.DECO"},
aSmartDesignModuleShopList: ["ko_KR","ja_JP","zh_CN","en_US","zh_TW","es_ES","pt_PT"]
},
oStore: {
oMultiShopCurrencyInfo: {"en_US":{"currency":"USD"},"zh_CN":{"currency":"USD","sub_currency":"CNY"},"ja_JP":{"currency":"JPY"},"zh_TW":{"currency":"TWD"},"es_ES":{"currency":"EUR"},"pt_PT":{"currency":"EUR"},"ko_KR":{"currency":"KRW"},"vi_VN":{"currency":"VND"},"en_PH":{"currency":"PHP"}},
oBrowserRedirectLanguage: {"ko":{"primary":"ko_KR","secondary":"en_US"},"en":{"detail":{"en-ph":{"primary":"en_PH","secondary":"en_US"},"en-us":{"primary":"en_US","secondary":"es_ES"},"default":{"primary":"en_US","secondary":"es_ES"}}},"ja":{"primary":"ja_JP","secondary":"en_US"},"zh":{"detail":{"zh-cn":{"primary":"zh_CN","secondary":"en_US"},"zh-tw":{"primary":"zh_TW","secondary":"zh_CN"},"default":{"primary":"en_US","secondary":"ko_KR"}}},"es":{"primary":"es_ES","secondary":"en_US"},"pt":{"primary":"pt_PT","secondary":"en_US"},"vi":{"primary":"vi_VN","secondary":"en_US"},"default":{"primary":"en_US","secondary":"ko_KR"}},
aChangeableLanguages: ["en_US","vi_VN","ja_JP","ko_KR","zh_TW","th_TH"],
aNoZipCodeLanguage: ["ko_KR","ja_JP"]
},
oMobile: {
sSmartWebAppFaqUrl: "https://ecsupport.cafe24.com/board/free/read.html?no=1832&board_no=5&category_no=13&cate_no=13&category_no=13&category_no=13",
sAmpFaqUrl: "https://ecsupport.cafe24.com/board/free/read.html?no=1864&board_no=5&category_no=13&cate_no=13&category_no=13&category_no=13",
},
oPromotion: {
bQrCodeAvailable: true,
bSnsMarketingAvailable: true
},
oShippingReverseAddressLanguage: ["vi_VN","en_PH"] ,
oGlobalStandardSwitchHelpCodeLink: {"SH.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/SH.DS.html"},"PR.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/PR.DS.html"},"OR.SM.BO":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/OR.SM.BO.html"},"CU.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/CU.DS.html"},"DE.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/DE.DS.html"},"MB.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/MB.DS.html"},"PM.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/PM.DS.html"}},
getAdminMainLocaleLanguage: function(sSkinLocaleCode) {
var oLocaleData = [];
var locale = "";
var shopLangName = ""; 
if (sSkinLocaleCode == "US") {
locale = "en_US";
shopLangName = "ENGLISH";
} else if (sSkinLocaleCode == "JP") {
locale = "ja_JP";
shopLangName = "JAPANESE";
} else if (sSkinLocaleCode == "CN") {
locale = "zh_CN";
shopLangName = "SIMPLIFIED.CHINESE";
} else if (sSkinLocaleCode == "TW") {
locale = "zh_TW";
shopLangName = "TRADITIONAL.CHINESE";
} else if (sSkinLocaleCode == "ES") {
locale = "es_ES";
shopLangName = "SPANISH";
} else if (sSkinLocaleCode == "PT") {
locale = "pt_PT";
shopLangName = "PORTUGUESE";
} else if (sSkinLocaleCode == "VN") {
locale = "vi_VN";
shopLangName = "VIETNAMESE";
} else if(sSkinLocaleCode == "PH") {
locale = "en_PH";
shopLangName = "ENGLISH.PH";
}
oLocaleData["locale"] = locale;
oLocaleData["shopLangName"] = shopLangName;
return oLocaleData;
}
};
var EC_GLOBAL_MALL_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_MALL_LANGUAGE_CODES');
CAFE24.GLOBAL_DATETIME_INFO = {
oConstants: {"STANDARD_DATE_REGEX":"\/([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))\/","IN_ZONE":"inZone","OUT_ZONE":"outZone","IN_FORMAT":"inFormat","OUT_FORMAT":"outFormat","IN_DATE_FORMAT":"inDateFormat","IN_TIME_FORMAT":"inTimeFormat","OUT_DATE_FORMAT":"outDateFormat","OUT_TIME_FORMAT":"outTimeFormat","IN_FORMAT_DATE_ONLY":1,"IN_FORMAT_TIME_ONLY":2,"IN_FORMAT_ALL":3,"OUT_FORMAT_DATE_ONLY":1,"OUT_FORMAT_TIME_ONLY":2,"OUT_FORMAT_ALL":3,"DATE_ONLY":"YYYY-MM-DD","TIME_ONLY":"HH:mm:ss","FULL_TIME":"YYYY-MM-DD HH:mm:ss","ISO_8601":"YYYY-MM-DD[T]HH:mm:ssZ","YEAR_ONLY":"YYYY","MONTH_ONLY":"MM","DAY_ONLY":"DD","WEEK_ONLY":"e","TIME_H_I_ONLY":"HH:mm","TIME_HOUR_ONLY":"HH","TIME_MINUTE_ONLY":"mm","POSTGRE_FULL_TIME":"YYYY-MM-DD HH24:MI:SS","POSTGRE_TIME_ONLY":" HH24:MI:SS","MICRO_SECOND_ONLY":"u","SEOUL":"Asia\/Seoul","TOKYO":"Asia\/Tokyo","SHANGHAI":"Asia\/Shanghai","TAIPEI":"Asia\/Taipei","HANOI":"Asia\/Bangkok","LOS_ANGELES":"America\/Los_Angeles","LISBON":"Europe\/Lisbon","MADRID":"Europe\/Madrid","SINGAPORE":"Asia\/Singapore","UTC":"Etc\/UTC","MAX_DATETIME":"9999-12-31 23:59:59"},
oOptions: {"inZone":"Asia\/Seoul","inFormat":"YYYY-MM-DD HH:mm:ss","inDateFormat":"YYYY-MM-DD","inTimeFormat":"HH:mm:ss","outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"},
oPolicies: {"shop":{"outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"}},
sOverrideTimezone: '',
sMomentNamespace: 'EC_GLOBAL_MOMENT'
};
CAFE24.FRONT_JS_CONFIG_MANAGE = {"sSmartBannerScriptUrl":"https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206","sMallId":"ecudemo200642","sDefaultAppDomain":"https:\/\/app4you.cafe24.com","sWebLogOffFlag":"F"};
var EC_FRONT_JS_CONFIG_MANAGE = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
CAFE24.FRONT_JS_CONFIG_MEMBER = {"sAuthUrl":"https:\/\/i-pin.cafe24.com\/certify\/1.0\/?action=auth"};
var EC_FRONT_JS_CONFIG_MEMBER = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MEMBER');
CAFE24.FRONT_JS_ARTICLES = {"14":{"no":14,"ucc_url":""}};
var EC_FRONT_JS_ARTICLES = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_ARTICLES');
CAFE24.FRONT_JS_CONFIG_BOARD = {"iBoardNo":6,"sCommentWriterType":"N","sCommentUseId":"F"};
var EC_FRONT_JS_CONFIG_BOARD = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_BOARD');
typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
</script>
<style type="text/css">

#count {
margin:0 px; 
padding:0 px;
float: left;
margin-right: 30px;
}

</style>
<link rel="stylesheet" type="text/css" href="../include/froala_style_ec.min.css" charset="utf-8"/>

<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=nZBBCkIxEEP3xa3nCHoEj-ANpnXUD-2kTKegt9edbgTpNuTlQXBnUxyOju68uTS4Dk4vijIGrk4LFLZG272DPf7pa0mDdcZGS5mPRXBGrEqrPNXX0JBcdRFlT3UzTVnMfvqld5wofsH5e-7z8Qs&type=css&k=a052fbc291df183c9caddf6aefc2c6be24ab00a6&t=1635315871"  />
<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=tdVBTkQhDAbg_Yxbz8FkYjyDCxcmnoDX1wdEoATKxLm9RY0XsN2RV_L15U8BF6mgQzjPgX3IYu5Y6Hq5PD9dXZtbTnCOXLIbO553HClUt_mBDsZwhfaZ0W3k--46-v3Nw4cP-CDFR6cmA5WClW3wQjdcujKb0-AROs2mDB-zAieq_2Ozv9PktU7w3WNlrI7-fFBGEU6rcJrJCGaizKkZ6RGzFd26DApY5d18SNUzWqXuNyN5m8zqo_2H06ddINkqbNkERrQUsKvdeb9typQTOSK195haSzVoNwCqNzHkXm2gbsuhCdTv2u5A3yG-yLOrH3imQExN_ZdZslj2cZjR1Wz4XuVNX_gX&type=css&k=ca5a8efa60dea5a1d9ae71ee6ed19c649fdbcf8b&t=1643183260&user=T"  />

<hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="xans-element- xans-board xans-board-readpackage-4 xans-board-readpackage xans-board-4 "><div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><div class="path">
            <span>현재 위치</span>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>상품 Q&A</strong></li>
            </ol>
</div>
<div class="titleArea">
            <h2><font color="333333">상품 Q&A</font> </h2>
            <p>상품 Q&A입니다.</p>
        </div>
</div>
<!--
<div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ec-base-box typeProduct ">
<p class="thumbnail"><a href="/product/sample-product-06/41/">
<img src="//ecudemo200642.cafe24.com/web/product/tiny/202110/f0abcaa83ab93c2f8e70d7701e74c6a2.jpg" alt="" onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'"/>
</a></p>
  
<div class="information">
            <h3><a href="/product/sample-product-06/41/">sample product 06</a></h3>
            <p class="price">62,000원 <span id="sPrdTaxText"></span></p>
            <p class="button"><a href="/product/sample-product-06/41/" class="btnEm" title="새창으로 이동">상품 상세보기</a></p>
        </div>
       
</div>
 -->
<form id="BoardDelForm" name="BoardDelForm" method="post" >
<input id="no" name="no" value="14" type="hidden"  />
<input id="bulletin_no" name="bulletin_no" value="1016" type="hidden"  />
<input id="board_no" name="board_no" value="6" type="hidden"  />
<input id="member_id" name="member_id" value="asdf12" type="hidden"  />
<input id="list_url" name="list_url" value="/board/product/list.html?board_no=6" type="hidden"  />
<input id="bdf_modify_url" name="bdf_modify_url" value="/board/product/modify.html?board_act=edit&amp;no=14&amp;board_no=6" type="hidden"  />
<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/6" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  />
<div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4"><!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/product/list.html
        -->
<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>상품 게시판 상세</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<input type="hidden" id="q_no" value="<%=qa.getQ_no()%>"/>
<tr>
<th scope="row">제목</th>
                    <td><%=qa.getQ_title() %></td>
                </tr>
<tr>
<th scope="row">작성자</th>
                    <td>
                    <% MemberDTO member=MemberDAO.getDAO().memberSelect(qa.getM_userid(),"");%>
                    <%=member.getM_name()%>
                    <span class="displaynone">(ip:)</span> </td>
                </tr>
<tr>
<td colspan="2">
    <ul class="etcArea">
        <li id="count">
            <strong>작성일</strong> <span class="txtNum"><%=qa.getQ_date() %></span>
        </li>
        <li id="count">
            <strong>조회수</strong> <span class="txtNum"><%=qa.getQ_count()+1 %></span>
        </li>
    </ul>
    <br></br>
    <br></br>
    <br></br>
<div class="detail"><div class="fr-view fr-view-article"><p><%=qa.getQ_content()%></p>    <br></br>
    <br></br></div></div>
                    </td>
                </tr>

</tbody>
</table>
</div>

<%-- [글삭제]와 [글변경]을 클릭한 경우 요청 JSP 문서에 전달되는 값 --%>
<input type="hidden" name="q_no" value="<%=qa.getQ_no()%>"/>

<%-- [답글쓰기]를 클릭한 경우 요청 JSP 문서에 전달되는 값 --%>
<input type="hidden" name="ref" value="<%=qa.getRef()%>"/>
<input type="hidden" name="reStep" value="<%=qa.getReStep()%>"/>
<input type="hidden" name="reLevel" value="<%=qa.getReLevel()%>"/>

<%-- [글목록]을 클릭한 경우 요청 JSP 문서에 전달되는 값 --%>
<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
<input type="hidden" name="search" value="<%=search%>"/>
<input type="hidden" name="keyword" value="<%=keyword%>"/>

<div class="ec-base-button ">
            <span class="gLeft">
                <a href="<%=request.getContextPath()%>/board/qa/qa.jsp" class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gRight">
                <button type="submit" class="btnNormalFix sizeS" id="removeBtn" >삭제</button>
                <button type="submit" class="btnEmFix sizeS" id="modBtn" >수정</button>
                <button type="submit" class="btnSubmitFix sizeS" id="replyBtn" >답변</button>
                
                <!-- <a href="<%=request.getContextPath()%>/board/qa/qa_add.jsp" id="replyBtn" class="btnSubmitFix sizeS ">답변</a>-->
            </span>
        </div>
</div>
</form></div>
<!-- 
<div class="xans-element- xans-board xans-board-listsgroup-4 xans-board-listsgroup xans-board-4"><h3>관련 글 보기</h3>
<div class="ec-base-table typeList gBorder">
        <table border="1" summary="">
<caption>관련글 모음</caption>
            <colgroup>
<col style="width:70px;"/>
<col style="width:134px;"/>
<col style="width:auto;"/>
<col style="width:84px;"/>
<col style="width:77px;" class=""/>
<col style="width:55px;" class=""/>
</colgroup>
<thead><tr>
<th scope="col">번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col" class="">작성일</th>
                    <th scope="col" class="">조회</th>
                </tr></thead>
<tbody class="center">
<tr class="xans-record-">
<td>14</td>
                    <td><span>sample product 06</span></td>
                    <td class="subject left txtBreak">
                         <a href="/article/상품-qa/6/14/">asd</a>                     </td>
                    <td>홍****</td>
                    <td class=""><span class="txtNum">2022-01-12 11:26:05</span></td>
                    <td class=""><span class="txtNum">9</span></td>
                </tr>
<tr class="xans-record-">
<td>18</td>
                    <td><span></span></td>
                    <td class="subject left txtBreak">
                        &nbsp;&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif"  alt="답변" class="ec-common-rwd-image" />  <a href="/article/상품-qa/6/18/">dd</a>                     </td>
                    <td>홍****</td>
                    <td class=""><span class="txtNum">2022-01-14 19:33:37</span></td>
                    <td class=""><span class="txtNum">1</span></td>
                </tr>
<tr class="xans-record-">
<td>17</td>
                    <td><span></span></td>
                    <td class="subject left txtBreak">
                        &nbsp;&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif"  alt="답변" class="ec-common-rwd-image" />  <a href="/article/상품-qa/6/17/">asdASF</a>                     </td>
                    <td>홍****</td>
                    <td class=""><span class="txtNum">2022-01-14 19:33:17</span></td>
                    <td class=""><span class="txtNum">0</span></td>
                </tr>
</tbody>
</table>
</div>
</div>
-->

        </div><hr class="layout"/></div><hr class="layout"/><div id="footer">
<%@include file="/include/footer.jsp"%>
<script src="/ind-script/optimizer.php?filename=zVjfb9s2EH6P9bq_Q0tXFH1tXLQblqBGkqLPJ-okMSJ5LH8kUf_6nWR3S5ZJligHGAzIMs3vu-Px491JeUMa8_M3Lq8caHwg1-YOPUUnML_zuTx_b7I7_0s-NS9KC6LN775HdN3h67fsXfbrQiQ-BnQGlD8MZIKolbiWJTqVtIQMRVaZZKghQaZSUoQkivPsLX-SjPO_gdy_4mYd1Yx_trslBAySJ2ieZUKO4mq4-SZDc_vjIwTItDQLeJQsGIW3fH8c5a2TJlQz6EnE3q1P5PSWTHCkFLrjuJ2K_oO1F06W9Qx_YpDq-KzK0RCpM0-KEWTOAtkzJQ2eFWDMHL_2FIK0JjN39iMYPo2GpW0dhvlWBlxAbRXvy3-DwNr8igqpML9-gt_7NxGVEZymMvKQf5B2mcEqGtEHtJ9XRj42elTEcxkmnGCp5l_3p-cphYIfnSIoF4F0DNDb_VJ4dPdjmzMCtqS6SqrZ0iuxgqhCHwKvwYWLCdX1k24ass8Mfhpo_oQWKG_7604-opo6JRM020ElXydFMgL1CE40i2IVoKq6lzlpeU0oajmA_h8VquR8aTwLyK9lQvDS1GtZNAYo--y_jMeqWEtON_egJMPJ_eT7eyDjG_CraXuHTelf0jOD5Sji61loUFl89XU0YMoXJe6UBjhJST5Jr8bPCS2cLEyKBHCmb-l4ivzHg6XZ6BordGgEbqPrv7udk2IiH14QuPIZD49mRT-6PIlyba7JdZfShzSLUYg0oMOxWvc0rB9iaG5uLtNM9I0Ed2_HrWgwUPfNaPS4cbJulmJKB_VEw7Cf-tTJBywU1YtK0E955J73cmPHRTILLw6_NhX3thDWenIqmnmtcBO04o2VQaJfFHbwnRH7azJOoy6m2p4j8C-uRCdMSCa4AN9iWM9gp9PMLI7dod1NZdlS5LK5Zi1X3IpDnb6Oj2jJy3T736RvprPnDAJBcUUIHApcAb8e4LcUQG1X-TEoO11QaLCSa0V9Cd0KHz47KNOlxLWKOAdKMdBwxX1IVzU_Z8kd2WjTKbiot3g4oOs29hnVKrFfyntU0rRjrx_mqux32b9o6k6g1wPTLRQn4fkjoE6MkIXQOFK4mdFKHgvz6HuEEbBNyOP7OrjhNmZ4Kv4L&type=js&k=2068e553f43e44b28464332c01ded3b421fc3e93&t=1642753578" ></script><script src="/ind-script/optimizer.php?filename=rc8xDsIwDIXhA4SVc7iqEBfhBGliNS5xHOoY1NsTEAsrZfun7-lBEkbA4Exx1R4WkWUchvNphGpTpuBS4wwa0UVUmgtMXhEWBZZoGSH7TaxB8A1nWbfDokf4Vf1YvSm8Jt6xS-xIEGYpe5XvtzejcHV3wsd_XbbcSJPUS6JaqcydfwI&type=js&k=71cd2bc4b79ae956606c3df49463fd1b9b461e1b&t=1635423561&user=T" ></script>

<script>
$("#replyBtn").click(function() {
	$("#BoardDelForm").attr("action", "<%=request.getContextPath()%>/board/qa/qa_add.jsp");
	$("#BoardDelForm").submit();
});
$("#modBtn").click(function() {
	var value=$("#q_no").val();
	$("#BoardDelForm").attr("action", "<%=request.getContextPath()%>/board/qa/qa_modify.jsp?q_no="+value);
	$("#BoardDelForm").submit();
});
$("#removeBtn").click(function() {
	var value=$("#q_no").val();
	$("#BoardDelForm").attr("action", "<%=request.getContextPath()%>/board/qa/qa_remove_action.jsp?q_no="+value);
	$("#BoardDelForm").submit();
});
</script>



<script type="text/javascript">
CAFE24.MOBILE_WEB = false; var mobileWeb = CAFE24.MOBILE_WEB;
var bUseElastic = false;
var sSearchBannerUseFlag = 'F';
EC$(function() {
try{
var ifame_width = parent.EC$('#blog_14').parent().width();
parent.EC$('#blog_14').contents().find('body').css( 'min-width', ifame_width);
parent.EC$('#blog_14').css('width', ifame_width);
if (parseInt(parent.EC$('#blog_14').css('height')) < (document.body.scrollHeight + 70)) {
parent.EC$('#blog_14').css('height', document.body.scrollHeight + 70);
}
}catch(e){};
});
EC$(function(){
FwValidator.bind("BoardDelForm", false);
});
var sFormId = 'BoardDelForm'
var sEleId = ["BoardDelForm::password"]
AuthSSL.Bind(sFormId, sEleId);
EC$(function(){
FwValidator.bind("commentForm", false);
});
EC$(function() {
EC$('#commentForm').css('display', 'none');
});
EC$(function(){
FwValidator.bind("commentSecretForm", false);
});
EC$(function() {
EC$('#commentSecretForm').css('display', 'none');
});
EC$(function(){
FwValidator.bind("commentWriteForm", false);
});
EC$(function() {
BOARD_COMMENT.setCmtData();
});
var aLogData = {"log_server1":"eclog2-225.cafe24.com","log_server2":"elg-db-svcm-269.cafe24.com","mid":"ecudemo200642","stype":"e","domain":"","shop_no":1,"lang":"ko_KR","ver":2,"hash":"a01c4b76cd299ce7a6c0b41cbccd84d9","ca":"cfa-js.cafe24.com\/cfa.js","etc":""};
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
