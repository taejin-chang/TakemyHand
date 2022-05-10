<%@page import="InteriorDAO.BoardDAO"%>
<%@page import="InteriorDTO.BoardDTO"%>
<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
<%
	String ref="0",reStep="0",reLevel="0";
	String pageNum="1";
	
	if(request.getParameter("ref")!=null) {
		 ref=request.getParameter("ref");
		 reStep=request.getParameter("restep");
		 reLevel=request.getParameter("relevel");
		 pageNum=request.getParameter("pageNum");
	}
	
	System.out.println(ref);
	System.out.println(reStep);
	System.out.println(reLevel);
	System.out.println(pageNum);
	
	int b_no=Integer.parseInt(request.getParameter("b_no"));
	
	BoardDTO board=BoardDAO.getDAO().selectNumBoard(b_no);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head><script>
(function(i, s, o, g, r, a, m) {
    a = s.createElement(o);
    m = s.getElementsByTagName(o)[0];
    a.src = g;
    a.onload = function() {
        i[r].init('https://js-error-tracer-api.cafe24.com', {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJlY3VkZW1vMjAwNjQyLmNhZmUyNC5jb20iLCJhdWQiOiJqcy1lcnJvci10cmFjZXItYXBpLmNhZmUyNC5jb20iLCJtYWxsX2lkIjoiZWN1ZGVtbzIwMDY0MiIsInNob3Bfbm8iOjEsInBhdGhfcm9sZSI6IkJPQVJEX1BST0RVQ1RfV1JJVEUiLCJsYW5ndWFnZV9jb2RlIjoia29fS1IiLCJjb3VudHJ5X2NvZGUiOiJLUiIsIm9yaWdpbiI6Imh0dHA6XC9cL2VjdWRlbW8yMDA2NDIuY2FmZTI0LmNvbSIsImlzX2NvbnRhaW5lciI6ZmFsc2UsImhvc3RuYW1lIjoidWRtcC0xMTUifQ.jzP_ek4TpPdaN3Uz23MHye3AsuNKpbjLEkTpwGN_6so","collectWindowErrors":true,"preventDuplicateReport":true,"storageKeyPrefix":"EC_JET.BOARD_PRODUCT_WRITE"});
    };
    m.parentNode.insertBefore(a, m);
}(window, document, 'script', '/ind-script/optimizer.php?filename=08_Iz03VNzQq0i8oyk8vSszVLy8v18_MS-EqTi7KLCjRz0oFY57czDyerGIA&type=js&k=f8c449ff82a3977059c3195db755507c2666c339&t=1625595405', 'EC_JET'));
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="http://ecudemo200642.cafe24.com/board/product/write.html" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/board/product/write.html" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="website" />
<link rel="shortcut icon" href="/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=4e883c730341687ae3ce60ab0681e02d"></script>
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
oPolicies: [],
sOverrideTimezone: '',
sMomentNamespace: 'EC_GLOBAL_MOMENT'
};
CAFE24.FRONT_JS_CONFIG_MANAGE = {"sSmartBannerScriptUrl":"https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206","sMallId":"ecudemo200642","sDefaultAppDomain":"https:\/\/app4you.cafe24.com","sWebLogOffFlag":"F"};
var EC_FRONT_JS_CONFIG_MANAGE = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
CAFE24.FRONT_JS_CONFIG_MEMBER = {"sAuthUrl":"https:\/\/i-pin.cafe24.com\/certify\/1.0\/?action=auth"};
var EC_FRONT_JS_CONFIG_MEMBER = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MEMBER');
typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
</script>


<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2201261295" charset="utf-8"/>

<link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=nZBBCkIxEEP3xa3nCHoEj-ANpnXUD-2kTKegt9edbgTpNuTlQXBnUxyOju68uTS4Dk4vijIGrk4LFLZG272DPf7pa0mDdcZGS5mPRXBGrEqrPNXX0JBcdRFlT3UzTVnMfvqld5wofsH5e-7z8Qs&type=css&k=a052fbc291df183c9caddf6aefc2c6be24ab00a6&t=1635315871"  /><link rel="stylesheet" type="text/css" href="/ind-script/optimizer.php?filename=tdRNToQhDAbg_XxuPQeTifEMLlyYeIJSOtAIlPAzOreXbzTGtdIdoeQpeVMwQRIZwm00qm0uhqMkp-Px8eFkyrCRcQs9RdMcbY4a-2wsNDLYmkniRiRjBaoz75U7vQC-gae7Wb03f6UjXGX0fc1464OSkuTF6NfGYpTwsBcOg5XgLhI7FyU9UNSiS53Dglp5F_CcoZNW6mCVZDt6Xz7aP7h86AUStcKeh1CJngWq_7N__XvfbdKYL7IFKa-BS-HsVzdAyZdpsOSCy-35aLzU62q3EVQMTwRufeBRvHQpy6_cZxa7fT6r0Vlt-J653T7XTw&type=css&k=98267b00b3f5a55405b612acde5e6cf5bf519a49&t=1643183260&user=T"  />

</div><hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 "><div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><div class="path">
            <span>현재 위치</span>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>자유게시판</strong></li>
            </ol>
</div>
<div class="titleArea">
<%if(ref.equals("0")) { %>
            <h2><font color="#555555">자유게시판</font></h2>
            <p>자유게시판입니다.</p>
            <% } else { %>
            <h2><font color="333333">자유게시판 답글</font></h2>
            <p>자유게시판 답글입니다.</p>
            <% } %>            
        </div>
</div>
<form id="boardModifyForm" name="boardModifyForm" action="<%=request.getContextPath() %>/board/freeboard/board_modify_action.jsp?b_no=<%=board.getB_no() %>" method="post" enctype="multipart/form-data">
<input id="board_no" name="board_no" value="4" type="hidden"  />
<input id="product_no" name="product_no" value="0" type="hidden"  />
<input id="move_write_after" name="move_write_after" value="/board/product/list.html?board_no=4" type="hidden"  />
<input id="cate_no" name="cate_no" value="" type="hidden"  />
<input id="bUsePassword" name="bUsePassword" value="" type="hidden"  />
<input id="order_id" name="order_id" value="" type="hidden"  />
<input id="is_post_checked" name="is_post_checked" value="" type="hidden"  />
<input id="13e73" name="13e73" value="4f43204de38551097cde0eb3af333ed1" type="hidden"  /><div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
<input type="hidden" name="ref" value="<%=ref%>"/>
<input type="hidden" name="restep" value="<%=reStep%>"/>
<input type="hidden" name="relevel" value="<%=reLevel%>"/>
<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
<!--
            $write_success_url = /board/product/list.html
            $product_select_url = /product/search_board_list.html
            $order_select_url = /order/search_board_list.html
            $login_page_url = /member/login.html
            $deny_access_url = /index.html
        -->
        
        
<div class="ec-base-box typeProduct  ">
            <p class="thumbnail"><a href=""><img id="iPrdImg" src="//ecudemo200642.cafe24.com/web/product/tiny/" onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'" alt=""/></a></p>
            <div class="information">
                <span id="sPrdCommonImg"></span>                <h3><a href="/product/detail.html?product_no=0" id="aPrdNameLink"><span id="sPrdName"></span></a></h3>
                <p class="price"><span id="sPrdPrice"></span> <span id="sPrdTaxText"></span></p>
                <p class="button">
                    <span id="iPrdView" class="displaynone"><a href="/product/detail.html?product_no=0" id="aPrdLink" class="btnEm" target="_blank">상품상세보기</a></span>
                    <span class=""><a href="#none" class="btnNormal" onclick="BOARD_WRITE.product_popup('/product/search_board_list.html')">상품정보선택</a></span>
                    <span class="displaynone"><a href="#none" class="btnNormal" onclick="BOARD_WRITE.product_popup('/order/search_board_list.html')">주문상품선택</a></span>
                </p>
            </div>
        </div>
<!-- form method="post" action="reveiw_write_action.jsp"> -->
<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>글쓰기 수정 폼</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<tr>
<th scope="row">제목</th>
                    <td> 
                    <input id="b_title" name="b_title" fw-filter="isFill" fw-label="제목" fw-msg="" class="inputTypeText" placeholder="" maxLength="125" value="<%=board.getB_title() %>" type="text"  />  </td>
                </tr>
<tr class="display">
<th scope="row">작성자</th>
                    <td><%=loginMember.getM_name()%></td>
                </tr>
<tr>
<td colspan="2" class="clear">
                        
            <!-- CSS -->
            <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2201261295">
            <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2201261295">

            <!-- HTML-->
            <textarea style="width: 100%;" name="content" id="content" class="ec-fr-never-be-duplicated"><%=board.getB_content() %></textarea>
                <input type="hidden" id="content" name="content" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE" />
                
            <!-- JavaScript -->
            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2201261295"></script>
            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2201261295"></script>
            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2201261295"></script>
        
            <!-- Run Froala Script -->
            <script>
              var EC_FROALA_ID = null;
              // isSimplexEditorFill 체크시에 필요함
              var EC_FROALA_INSTANCE = null;
              // scroll 버그 대응을 위해 필요.
              var fScrollPosition = 0;
              // 다중 이미지 삽입시 생기는 버그 대응
              var iCheckedImageListCount  = 0;
              var aCheckedImageList = [];
              var aInsertedImageList = [];
              
              (function() {
                var d = "";
                try {
                    var o = {"key":"DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==","toolbarSticky":false,"theme":"ec-froala","attribution":false,"htmlRemoveTags":["script"],"htmlAllowedEmptyTags":["*"],"iframe":true,"iframeStyle":".fr-view{font-size: 12px;}","iframeStyleFiles":["\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2201261295"],"heightMin":400,"language":"ko_KR","paragraphFormatSelection":true,"fontFamilySelection":true,"fontSize":["8","9","10","12","14","16","18","20","22","24","26","28","30"],"fontSizeSelection":true,"linkInsertButtons":["linkBack"],"quickInsertButtons":["ul","ol","hr"],"codeMirror":false,"entities":"&#60;&#62;","imageEditButtons":["imageAlign","imageRemove","|","imageLink","linkOpen","linkEdit","linkRemove","-","imageDisplay","imageStyle","imageAlt","imageSize"],"tableEditButtons":[],"tableInsertHelper":false,"imageDefaultMargin":0,"imageDefaultWidth":0,"imageUpload":false,"imageInsertButtons":["imageUpload"],"imageMaxSize":5242880,"filesManagerMaxSize":5242880,"toolbarButtons":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":5},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":5},"moreRich":{"buttons":["insertTable","insertLink","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsSM":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":4},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":2},"moreRich":{"buttons":["insertTable","insertLink","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsXS":{"moreText":{"buttons":["paragraphFormat","textColor","backgroundColor","bold","italic","underline","strikeThrough"],"buttonsVisible":1},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight"],"buttonsVisible":0},"moreRich":{"buttons":["insertLink"]},"moreMisc":{"buttons":["undo","redo","html"],"buttonsVisible":0,"align":"right"}},"htmlDoNotWrapTags":["script","style","meta","link"],"htmlAllowedStyleProps":[".*"],"htmlAllowedTags":[".*"],"htmlAllowedAttrs":[".*"],"fontFamily":{"Dotum,sans-serif":"Dotum","Gulim,sans-serif":"Gulim","Batang,sans-serif":"Batang","Gungsuh,sans-serif":"Gungsuh","Arial,Helvetica,sans-serif":"Arial","Tahoma,Geneva,sans-serif":"Tahoma","Verdana,Geneva,sans-serif":"Verdana","Fixedsys,sans-serif":"Fixedsys","'Times New Roman',Times,serif":"Times New Roman","helvetica,sans-serif":"Helvetica","sans-serif":"Sans-serif","palatino,sans-serif":"Palatino","'Comic Sans MS',sans-serif":"Comic Sans MS","sand,sans-serif":"Sand","'Courier New',sans-serif":"Courier New","courier,sans-serif":"Courier","monospace,sans-serif":"Monospace","Georgia,serif":"Georgia","SimSun,sans-serif":"SimSun","SimHei,sans-serif":"SimHei","'MS PGothic',sans-serif":"MS PGothic","'MS PMincho',sans-serif":"MS PMincho","'MS UI PGothic',sans-serif":"MS UI PGothic","Meiryo,sans-serif":"Meiryo"},"colorsText":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"colorsBackground":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"docId":"content"};
                    // IE tableEditbuttons 이슈
                    o["tableEditButtons"] = FroalaEditor.DEFAULTS.tableEditButtons.filter(function(tableEditButtonName) {
                        return tableEditButtonName.indexOf("Style") === -1;
                    });

                    o["events"] = {
                        "filesManager.beforeUpload": function(files) {
                            this.opts.filesManagerUploadURL = getConvertUrlBeforeUpload(this.opts.filesManagerUploadURL);
                        },
                        "image.beforeUpload": function(images) {
                            this.opts.imageUploadURL = getConvertUrlBeforeUpload(this.opts.imageUploadURL);
                        },

                        "image.inserted": function(oImage, response) {
                            if (iCheckedImageListCount >= 0) {
                                iCheckedImageListCount++;
                                aInsertedImageList.push(oImage);
                                
                                if (aCheckedImageList.length === iCheckedImageListCount || aCheckedImageList.length === 0) {
                                    // 마지막 이미지
                                    for (var i = 0; i < aInsertedImageList.length; i++) {
                                        aInsertedImageList[i].after("<br>");
                                    }
                                    
                                    // 리셋
                                    iCheckedImageListCount = 0;
                                    aCheckedImageList = [];
                                    aInsertedImageList = [];
                                }
                            }
                        },
                        "image.error": function (error, response) {
                            if (typeof JSON != "undefined") {
                                r = JSON.parse(response);
                                alert(r["error"]);
                            }
                        },
                        "image.loaded": function($img) {
                            // IE에서 이미지 로드 후, 커서 위치 재조정
                            if (/(trident).+rv[:\s]([\w\.]{1,9}).+like\sgecko/i.test(navigator.userAgent)) {
                                var _this = this;
                                var _img = $img[0];
                                setTimeout(function() {
                                  _this.selection.setAfter(_img);
                                  _this.selection.restore();
                                }, 300);
                            }
                        },
                        "filesManager.error": function (error, response) {
                            if (typeof JSON != "undefined") {
                                r = JSON.parse(response);
                                alert(r["error"]);
                            }
                        },
                        "commands.before": function(sCommand) {
                            // 코드뷰 토글시
                            if (sCommand === "html") {
                                var sContent = this.el.innerHTML;
                                sContent = sContent.replace(/<\/?null>/gi, "");
                                this.el.innerHTML = getReplaceZeroWidthSpace(sContent);
                                replaceToFroalaNewLine(this);
                            }
                            
                            // 전체화면 모드 켜기
                            if (sCommand === "fullscreen" && !this.fullscreen.isActive()) {
                                this.$box[0].setAttribute("data-window-scroll-y", window.scrollY || window.pageYOffset);
                            }
                            // 다중 이미지 삽입
                            if (sCommand === "insertAll") {
                                var popup = this.popups.get("filesManager.insert");
                                aCheckedImageList = popup.find(".fr-files-checkbox .fr-file-insert-check:checked")
                            }
                        },
                        "commands.after": function(sCommand) {
                            if (sCommand === "html") {
                                removeFroalaNewLine(this);
                            }
                            
                            if (sCommand === "insertFiles") {
                                var enableButton= document.querySelector(".fr-trim-button.fr-plugins-enable");
                                if (enableButton) enableButton.click();
                            }
                            
                            if (sCommand === "selectAll") {
                                this.el.focus();
                            }
                            
                            // 전체 화면 토글시에 컨텐츠 높이를 정상적으로 반영하지못하는 이슈 대응
                            if (sCommand === "fullscreen") {
                                var _this = this;
                                setTimeout(function() {
                                    _this.size.syncIframe();
                                }, 300);
                                
                                if (this.fullscreen.isActive() === false) {
                                    window.scrollTo(0, this.$box[0].getAttribute("data-window-scroll-y"));
                                }
                            }
                        },
                        "focus": function() {
                            if (this.iframe_document) {
                                var iframeHeight = this.iframe_document.body.scrollHeight;
                                this.$iframe[0].style.height = iframeHeight + "px";
                            }
                            
                            this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
                        },

                        "image.beforeRemove": function(aImage) {
                            var cursorPoint = aImage[0].offsetTop; // 제거 대상 이미지의 offsetTop 값으로 정의
                            setScrollPosition(this, cursorPoint);
                        },
                        "image.removed": function() {
                            this.$wp.get(0).scrollTop = fScrollPosition; // 에디터 자체 버그동작이 수행 된 후 계산 해 둔 값으로 스크롤 위치를 이동
                        },
                        "keydown": function(e) {
                            if (isScrollFix(this, e) === true) {
                                setScrollPosition(this, getIframeCursorPoint(this));
                            }
                        },
                        "keyup": function(e) {
                            if (isScrollFix(this, e) === true) {
                                this.$wp.get(0).scrollTop = fScrollPosition;
                            }
                        },
                        "paste.before": function() {
                            if (this.fullscreen.isActive() === false) {
                                setScrollPosition(this, getIframeCursorPoint(this));
                            } 
                        },
                        "paste.after": function(e) {
                            if (this.fullscreen.isActive() === false) {
                                this.$wp.get(0).scrollTop = fScrollPosition;
                            } 
                        },
                        "codeView.update": function() {
                            this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
                            this.el.innerHTML = getRemoveEncodeString(this.el.innerHTML);
                        }
                    };

                    EC_FROALA_INSTANCE = new FroalaEditor("textarea#content.ec-fr-never-be-duplicated", o, function() {
                        EC_FROALA_ID = this.id;
                        if (d != "") {
                            this.el.innerHTML = this.clean.html(d);
                            // 타겟 textarea 태그에 change 트리거링
                            this.undo.saveStep();
                        }
                        var script = document.createElement("script");
                        script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2201261295";
                        this.$iframe.get(0).contentWindow.document.head.appendChild(script);
                        if (this.el.innerHTML === "<br>") {
                            this.el.innerHTML = "<p><br></p>";
                        }
                    });

                    EC_FROALA_INSTANCE.$iframe[0].setAttribute("id", "content" + "_IFRAME");
                    EC_FROALA_INSTANCE.$iframe[0].contentWindow.document.body.setAttribute("id", "content" + "_BODY");

                    EC_FROALA_INSTANCE.isEmptyContent = function () {
                        var c = getContentFromFroala(this.id);
                        // 스페이스바만 입력 저장시, validation을 위해 처리
                        var val = c.replace(/\<br\/?\>|\<\/?p\>|\s|&nbsp;/gi, "");
                        if ("" == val) return true;
                        return false;
                    };

                    EC_FROALA_INSTANCE.getContentFromFroala = function() {
                        return getContentFromFroala(this.id);
                    };

                    EC_FROALA_INSTANCE.applyContentToFroala = function(content) {
                        return applyContentToFroala(content, this.id);
                    };

                    EC_FROALA_INSTANCE.setValueBeforeSubmit = function(sSection) {
                        return setValueBeforeSubmit(sSection, this.id);
                    };

                    if (typeof $Editor ===  "undefined") {
                        $Editor = {};
                    }
                    $Editor["content"] = EC_FROALA_INSTANCE;
                } catch (e) {
                    document.getElementById("content").value = d;
                    console.error(e);
                } finally {
                }
              })();
               
              // url에 (공백, :) 포함 되었을떄 인코딩되는 문자열 치환
              function getRemoveEncodeString(sContent) {
                   sContent = sContent.replace(/(src=["']?|href=["']?)+(?:\%20)+/g, "$1");
                   sContent = sContent.replace(/(https?|javascript)+%3A/g, "$1:");
                   
                   return sContent;
              }

              //플로알라 에디터 내용 조회
              function getContentFromFroala(id) {
                  try {
                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
                      return instance.id === sFroalaId;
                    });
                    if (oEditor[0].codeView.isActive()) {
                      oEditor[0].codeView.toggle();
                    }

                    oEditor[0].el.innerHTML = getRemoveEncodeString(oEditor[0].el.innerHTML);
                    
                    return oEditor[0].el.innerHTML;

                  } catch (e) {
                    console.error(e);
                    return false;
                  }
              }

              //플로알라 에디터 내용 적용
              function applyContentToFroala(content, id) {
                  try {
                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
                      return instance.id === sFroalaId;
                    });

                    oEditor[0].el.innerHTML = oEditor[0].clean.html(content);

                    // textarea 태그에 change 트리거링
                    oEditor[0].undo.saveStep();
                    return true;
                  } catch (e) {
                    console.error(e);
                    return false;
                  }
              }

              // useclasses 옵션 사용시, froala 커스텀 속성값 (fr-draggable) 제거
              function setValueBeforeSubmit(sSection, id) {
                try {
                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
                      return instance.id === sFroalaId;
                    });

                    var contents = oEditor[0].el.innerHTML;
                    document.getElementById(sSection).value = contents.replace(/\sclass=("|')fr-draggable("|')|\s?fr-draggable\s?|<\/?null>/gi, "");

                    return true;
                  } catch (e) {
                    console.error(e);
                    return false;
                  }
              }

              //플로알라 front reset CSS 가져오기
              //Deprecated
              function getFroalaResetCSS() {
                return "//img.echosting.cafe24.com/editors/froala/css/froala_editor_reset.css?vs=2201261295;"
              }

              //플로알라 front style CSS 가져오기
              function getFroalaStyleCSS() {
                return "//img.echosting.cafe24.com/editors/froala/css/froala_style.min.css?vs=2201261295";
              }

              //플로알라 front style EC CSS 가져오기
              function getFroalaECStyleCSS() {
                return "//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2201261295";
              }

              // 파일 업로드시 랜덤한 파라미터 값 추가
              function getConvertUrlBeforeUpload(sUploadUrl) {
                var aSplitUrl = sUploadUrl.split("?");
                var oParam = getParameterUploadUrl(aSplitUrl[1]);

                return decodeURIComponent(aSplitUrl[0] + "?" + "uploadPath=" + oParam["uploadPath"] + "&uploadId=" + Math.floor((Math.random() * 100000)).toString());
              }

             function getParameterUploadUrl(sQueryString) {
                var aParam = {};

                if (sQueryString) {
                    var aFields = sQueryString.split("&");
                    var aField  = [];
                    for (var i=0; i<aFields.length; i++) {
                        aField = aFields[i].split("=");
                        aParam[aField[0]] = aField[1];
                    }
                }
                return aParam;
            }

            // 스크롤 위치 수정해야하는지 확인
            function isScrollFix (oEditor, event) {
                if (oEditor.fullscreen.isActive() === true) {
                    return false;
                }
                var sKey = event.key.toUpperCase();
                var bResult = false;
                if (sKey === "ENTER") {
                    // 구문의 중간 지점의 엔터 입력만 요구 조건에 해당함
                    bResult = oEditor.selection.get().focusNode !== oEditor.$el.get(0);
                } else if (sKey === "BACKSPACE" || sKey === "DELETE") {
                    bResult = true;
                }
                return bResult;
            }
            
            // 스크롤 위치 수정
            function setScrollPosition (oEditor, fCursorPoint) {
                var oContentWrapper = oEditor.$wp.get(0); // 에디터 편집 영역 컨테이너
                var fStartPoint = oContentWrapper.scrollTop; // 보여지는 편집 영역의 시작 지점
                var fEndPoint = oContentWrapper.scrollTop + (oContentWrapper.clientHeight - 20); // 보여지는 편집 영역의 끝 지점 (여백 포함)
 
                if (fCursorPoint > 0 && fCursorPoint < fStartPoint) {
                    // 커서가 보여지는 영역보다 위에 위치
                    fScrollPosition = fCursorPoint;
                } else if (fCursorPoint > 0 && fCursorPoint > fEndPoint) {
                    // 커서가 보여지는 영역보다 아래에 위치
                    fScrollPosition = fCursorPoint - (oContentWrapper.clientHeight - 20); // 여백 포함
                } else {
                    // 값이 0 이라서 무효화 됐거나, 보여지는 영역에 있는 경우 - 위치를 그대로 유지
                    fScrollPosition = fStartPoint;
                }
            }
            
            // 커서 포인트 반환
            function getIframeCursorPoint(editor) {
                var iframeDocument = editor.$iframe.get(0).contentDocument;
                var anchorNode = iframeDocument.getSelection().anchorNode;
                var iframeRange = iframeDocument.createRange();
                iframeRange.selectNode(anchorNode);
                return iframeRange.getBoundingClientRect().top;
            }
   
            // 폭없는 공백에서 폭과 줄바꿈 없는 공백으로 치환 (폭없는 공백은 플로알라버그로인해 지원하지않음)
            function getReplaceZeroWidthSpace(sContent) {
                return sContent.replace(/\u200B/g, "&#65279;");
            }
            
            // \n 제거되는 사양에대한 대응 : 플로알라에서 코드뷰 토글시 줄바꿈되는 태그로 변경
            function replaceToFroalaNewLine(oEditor) {
                if (oEditor.codeView.isActive() === true) {
                    return;
                }
                
                var oWhiteSpacePreElements = oEditor.$el.get(0).querySelectorAll('*[style*="white-space: pre"], *[style*="white-space:pre"]');
                oWhiteSpacePreElements.forEach(function(element) {
                    element.innerHTML = element.innerHTML.replace(/\n/g, '<span class="fr-newline"></span>');
                });
            }            
            
            // \n 제거되는 사양에대한 대응 : 코드뷰 토글시 줄바꿈 태그 \n으로 변경
            function removeFroalaNewLine(oEditor) {
                if (oEditor.codeView.isActive() === false) {
                    return;
                }
                
                var sCodeViewValue;
                if (typeof oEditor.opts.codeMirror === "function") {
                    // 상품 등록/수정 에디터는 코드미러를 사용하기때문에 분기처리
                    sCodeViewValue = oEditor.$wp.get(0).querySelector(".CodeMirror").CodeMirror.getValue();
                    oEditor.$wp.get(0).querySelector(".CodeMirror").CodeMirror.setValue(sCodeViewValue.replace(/<span class=[',"]fr-newline[',"]><\/span>/g, '\n'));
                } else {
                    sCodeViewValue = oEditor.$wp.get(0).querySelector(".fr-code").value;
                    oEditor.$wp.get(0).querySelector(".fr-code").value = sCodeViewValue.replace(/<span class=[',"]fr-newline[',"]><\/span>/g, '\n');
                }
            }
            
            </script>                    </td>
                </tr>
</tbody>

<tbody class="">
<tr>
<th scope="row">첨부파일1</th>
                    <td><img src="<%=request.getContextPath()%>/web/images/board-img/<%=board.getB_img()%>" width="100" height="100">
                    
                    <input name="img1" type="file"  /></td>
                </tr>
</tbody>

</table>
</div>

<div class="ec-base-button ">
            <span class="gLeft">
                <span class="displaynone"><a href="#none" class="btnNormal sizeS" onclick="">관리자 답변보기</a></span>
                <a href="<%=request.getContextPath() %>/board/board/board.jsp"  class="btnNormalFix sizeS">목록</a>
            </span>
            <span class="gRight">
              <!-- <a href="<%=request.getContextPath() %>/board/review/review_write_action.jsp" class="btnSubmitFix sizeS" onclick="send();">등록</a>  -->
                <button id="modBtn" type="submit" class="btnSubmitFix sizeS">수정</button>
              <!-- <a href="javascript:history.back();" class="btnBasicFix sizeS">취소</a> -->
            	<a href="<%=request.getContextPath()%>/board/board/board.jsp" class="btnBasicFix sizeS">취소</a>
            </span>
        </div>
</div>
</form></div>
<div id="message" style="color: red;"></div>

        </div><hr class="layout"/></div><hr class="layout"/><div id="footer">

<script>


$("#modBtn").click(function() {
	
	$("#boardModifyForm").submit(function() {
		if($("#b_title").val()=="") {
			$("#message").text("제목을 입력해 주세요.");
			return false;
		}
		
		if($("#content").val()=="") {
			$("#message").text("내용을 입력해 주세요.");
			return false;
		}
	});
});
</script>
        
<%@include file="/include/footer.jsp"%>

</script></body></html>