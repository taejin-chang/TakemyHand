<%@page import="InteriorDTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head><script>
(function(i, s, o, g, r, a, m) {
	

    a = s.createElement(o);
    m = s.getElementsByTagName(o)[0];
    a.src = g;
    a.onload = function() {
        i[r].init('https://js-error-tracer-api.cafe24.com', {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJlY3VkZW1vMjAwNjQyLmNhZmUyNC5jb20iLCJhdWQiOiJqcy1lcnJvci10cmFjZXItYXBpLmNhZmUyNC5jb20iLCJtYWxsX2lkIjoiZWN1ZGVtbzIwMDY0MiIsInNob3Bfbm8iOjEsInBhdGhfcm9sZSI6Ik1BSU4iLCJsYW5ndWFnZV9jb2RlIjoia29fS1IiLCJjb3VudHJ5X2NvZGUiOiJLUiIsIm9yaWdpbiI6Imh0dHA6XC9cL2VjdWRlbW8yMDA2NDIuY2FmZTI0LmNvbSIsImlzX2NvbnRhaW5lciI6ZmFsc2UsImhvc3RuYW1lIjoidWRtcC0xMTUifQ.-UsITad_RMV-4yogRvkh5ixAvVf6CSm8G1lQ3Lp57D4","collectWindowErrors":true,"preventDuplicateReport":true,"storageKeyPrefix":"EC_JET.MAIN"});
    };
    m.parentNode.insertBefore(a, m);
}(window, document, 'script', '/ind-script/optimizer.php?filename=08_Iz03VNzQq0i8oyk8vSszVLy8v18_MS-EqTi7KLCjRz0oFY57czDyerGIA&type=js&k=f8c449ff82a3977059c3195db755507c2666c339&t=1625595405', 'EC_JET'));
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="index2.jsp" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="website" />
<link rel="shortcut icon" href="web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>
<script type="text/javascript">
window.CAFE24 = window.CAFE24 || {};
CAFE24.MANIFEST_CACHE_REVISION = '2112291285';
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
CAFE24.FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = {"common_member_id_crypt":""};
var EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = CAFE24.getDeprecatedNamespace('EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA');
CAFE24.SDE_SHOP_NUM = 1;CAFE24.SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },getDateFormat: function() { return "Y-m-d" },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },getCountryAndLangMap : function() { return {
"KR": "ko_KR",
"US": "en_US",
"JP": "ja_JP",
"CN": "zh_CN",
"TW": "zh_TW",
"VN": "vi_VN",
"PH": "en_PH"
}},isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return false; },getModeName : function() {return false; },isMobileAdmin : function() {return false; },isExperienceMall : function() { return false; },getAdminID : function() {return ''},getMallID : function() {return 'ecudemo200642'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
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
<%--
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
--%> 
return oBankInfo; }};            var EC_SDE_SHOP_NUM = CAFE24.SDE_SHOP_NUM;
var SHOP = CAFE24.getDeprecatedNamespace('SHOP'); 
var EC_COMMON_UTIL = CAFE24.getDeprecatedNamespace('EC_COMMON_UTIL');
var EC_SHOP_LIB_INFO = CAFE24.getDeprecatedNamespace('EC_SHOP_LIB_INFO');
var EC_CURRENCY_INFO = CAFE24.getDeprecatedNamespace('EC_CURRENCY_INFO');
CAFE24.ROOT_DOMAIN = "itwill3.com";
CAFE24.API_DOMAIN = "itwill3.com.com";
CAFE24.TRANSLATE_LOG_STATUS = "F";
CAFE24.GLOBAL_INFO = (function() {
var oData = {"base_domain":"itwill3.cafe24.com","root_domain":"itwill3.com","api_domain":"itwill3.com","is_global":false,"is_global_standard":false,"country_code":"KR","language_code":"ko_KR","admin_language_code":"ko_KR"};
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
typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
</script>

<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nZBBCgMhEATvste8Y9g8Ig9IXqDuJCvotIwjJL-P7CmXwOK16eqCph2Fab0qVcVLfSHlhq6RKbZGT4UYRZQCWUZwoTN9jq4hd0sQF_CeBLvZrDT7D-scaj5knkRRXU7CLniRv35fKz12VLr_rt2OtdHZerTzekFPLadt2Eo6zvoC&type=css&k=3df06214bd79ead54f47098c414ed652a4a124f1&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tdWxbgMhDAbgPde1z-EorfoMHbr1CTjjgCXA6DBR8_b1NVGWjoENnU8f1i_LQJRMQLj0RluzQ_eU5XQ8fryfoPY1MS5Rc4LmafHUOBRYXSPA1iCL74kguat0BXRKQbbri5VeYZzbyG0YP8l52kbbSYKo1OEtq2Wx2-fzNLqMlnNPyi1K_eKmz-F30c6Mfzeh5Pxsx__Q24fBKOFhLxw6T4JVxHKuk_RIaRZdNxsXnJV3dYGLjfas1N06SV676vDRfuDyMy-QNCts-wmHbaf72EGyrZQdl-VtUtdWGP_APJbqd-RauYTRF6CUixkspY7P_Pb0eqdup38B&type=css&k=fe04e60c9d7bd9f0d26679cab135b8957108d03d&t=1636193578&user=T"  />
<style type="text/css">

</style>
<title>일픽셀디자인 ● S337 산책 ● 카페24 쇼핑몰디자인 제작 1pixel.co.kr</title>
<meta name="path_role" content="MAIN" />
<meta name="keywords" content="쇼핑몰 이름" /></head><body id="main"><div id="skipNavigation">
    <p><a href="#category">전체상품목록 바로가기</a></p>
    <p><a href="#contents">본문 바로가기</a></p>
</div >
<div id="wrap">
    <div id="header">
    <div class="inner">
        <div class="topArea">
            
            <div class="topArea_in">
                
                
                 <div class="top_menu_community">

                
                
                        
                    <div class="top_pop">
                    <% if(loginMember==null) { %>
                        <ul><li class="top_pop_m"><a href="<%=request.getContextPath()%>/member/login.jsp"><img src="<%=request.getContextPath()%>/web/images/etc/icon_user.png"/></a>
                                <div class="sub">
                                    <ul module="Layout_BoardInfo---" class="sub">
                                    	<li><a href="<%=request.getContextPath()%>/member/login.jsp">마이쇼핑</a></li>
                                        <li><a href="<%=request.getContextPath()%>/member/login.jsp">주문조회</a></li>
                                        <li><a href="<%=request.getContextPath()%>/member/login.jsp">장바구니</a></li>
                                     <%--   <li><a href="myshop/wish_list.html">관심상품</a></li> --%>
                                     <%--  <li><a href="myshop/mileage/historyList.html">적립금 내역</a></li>--%>
                                     <%--    <li><a href="myshop/coupon/coupon.html">쿠폰 내역</a></li> --%>
                                     <%--   <li><a href="product/recent_view_product.html">최근본 상품</a></li> --%>
                                    </ul></div>
                            </li>
                            <li>
                                <div class="search_box search_menu">
                                <a href="#none"><img src="<%=request.getContextPath()%>/web/images/etc/btn_search.png" style="   padding:-0px 0 0 4px;"/>  </a>
                                    <div class="search_over">
                                        <div class="search_over_in">
                                            <form id="searchBarForm" name="" action="product/search.jsp" method="get" target="_self"  >
<input id="banner_action" name="banner_action" value="" type="hidden"/>
<div class="xans-element- xans-layout xans-layout-searchheader "><!--
                                                $product_page=/product/detail.html
                                                $category_page=/product/list.html
                                                -->
<h2>검색하실 상품명을 입력하세요 :)</h2>
<fieldset>
<legend>검색</legend>
<input id="keyword" name="keyword" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"  /><input type="image" src="<%=request.getContextPath()%>/web/images/etc/btn_search.png" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;"/><%-- <ul class="autoDrop" id=""></ul>--%>
</fieldset>
</div>
</form> 
                                            <div class="search_btn"><img src="<%=request.getContextPath()%>/web/images/etc/btn_close.png"/></div>
                                        </div>
                                    </div><!-- search_over -->            
                                </div><!-- search_box -->                              
                         </li>   
                         <li class="xans-element- xans-layout xans-layout-statelogoff basket_t ">
                         
                         <a href="<%=request.getContextPath()%>/member/login.jsp"><img src="<%=request.getContextPath()%>/web/images/etc//btn_basket.png" style="top:10px;"/></a>
						</li>
                        </ul>
                        
                        <% } else { %>
                        
                        <ul><li class="top_pop_m"><a href="myshop/index.html"><img src="<%=request.getContextPath()%>/web/images/etc/icon_user.png"/></a>
                                <div class="sub">
                                    <ul module="Layout_BoardInfo---" class="sub"><li><a href="<%=request.getContextPath()%>/myshop/index.html">마이쇼핑</a></li>
                                        <li><a href="<%=request.getContextPath()%>/myshop/order/list.html">주문조회</a></li>
                                        <li><a href="<%=request.getContextPath()%>/order/basket.jsp">장바구니</a></li>
                                     <%--   <li><a href="myshop/wish_list.html">관심상품</a></li> --%>
                                     <%--  <li><a href="myshop/mileage/historyList.html">적립금 내역</a></li>--%>
                                     <%--    <li><a href="myshop/coupon/coupon.html">쿠폰 내역</a></li> --%>
                                     <%--   <li><a href="product/recent_view_product.html">최근본 상품</a></li> --%>
                                    </ul></div>
                            </li>
                            <li>
                                <div class="search_box search_menu">
                                <a href="#none"><img src="<%=request.getContextPath()%>/web/images/etc/btn_search.png" style="   padding:-0px 0 0 4px;"/>  </a>
                                    <div class="search_over">
                                        <div class="search_over_in">
                                            <form id="searchBarForm" name="" action="product/search.jsp" method="get" target="_self"  >
<input id="banner_action" name="banner_action" value="" type="hidden"/>
<div class="xans-element- xans-layout xans-layout-searchheader "><!--
                                                $product_page=/product/detail.html
                                                $category_page=/product/list.html
                                                -->
<h2>검색하실 상품명을 입력하세요 :)</h2>
<fieldset>
<legend>검색</legend>
<input id="keyword" name="keyword" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"  /><input type="image" src="<%=request.getContextPath()%>/web/images/etc/btn_search.png" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;"/><%-- <ul class="autoDrop" id=""></ul>--%>
</fieldset>
</div>
</form> 
                                            <div class="search_btn"><img src="<%=request.getContextPath()%>/web/images/etc/btn_close.png"/></div>
                                        </div>
                                    </div><!-- search_over -->            
                                </div><!-- search_box -->                              
                         </li>   
                         <li class="xans-element- xans-layout xans-layout-statelogoff basket_t "><a href="order/basket.html"><img src="<%=request.getContextPath()%>/web/images/etc//btn_basket.png" style="top:10px;"/></a>
</li>
                        </ul>
                        <% } %>
                        </div><!--top_pop-->                             
                                        
                          
                       
                </div>    
                  
                <h1 class="xans-element- xans-layout xans-layout-logotop "><a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/web/upload/logo/logo2.png" alt="쇼핑몰 이름"/></a>
</h1>
   
 
                 
                <div class="top_menu_log">
 
                   <%--   
                    <div class="link">
                        <a module="Layout_bookmark--" href="link/bookmark.html" target="_blank" onclick="winPop(this.href); return false;" class="bookmark"><span></span></a>
                     </div>   
                   --%>
                     <div class="xans-element- xans-layout xans-layout-statelogoff ">
                     <% if(loginMember==null) { %>
                     	<a href="<%=request.getContextPath()%>/member/login.jsp" class="log" style="font-size: 15px;">LOGIN</a>
					 	<a href="<%=request.getContextPath()%>/member/join.jsp" style="font-size: 15px;">JOIN</a>
					 <% } else {  %>
					 	<a href="<%=request.getContextPath()%>/member/logout_action.jsp" class="log" style="font-size: 15px;">LOGOUT</a>
					 	<p>&nbsp;&nbsp;</p>
					 	<% if(loginMember.getM_grade()==9) { %>
					 	<a href="<%=request.getContextPath()%>/admin/admin.jsp" class="log" style="font-size: 15px;">관리자</a>
					 	<% } %>
					 <% } %>
					 <div id="point_Box">
<%-- <p id="join_Point">+2,000P</p> --%>
<div class="updown"></div>
</div></a>
</div>
                    <div class="top_pop_co">
                        <ul><li class="top_pop_co_m"><a href="myshop/index.html" style="font-size: 15px;">COMMUNITY<img src="<%=request.getContextPath()%>/web/images/etc/btn_top_pop.png"/></a>
                                <div class="sub">
                                    <ul class="xans-element- xans-layout xans-layout-boardinfo sub">
                                    <% if(loginMember!=null) { %>
	                                    <li class="xans-record-">
											<a href="<%=request.getContextPath()%>/board/notice/notice.jsp" style="font-size:13px;">공지사항</a> </li>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/board/review/review.jsp" style="font-size:13px;">사용후기</a> </li>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/board/qa/qa.jsp" style="font-size:13px;">상품 Q&A</a> </li>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/board/freeboard/freeboard.jsp" style="font-size:13px;">자유게시판</a> </li>
									<% } else { %>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/member/login.jsp" style="font-size:13px;">공지사항</a> </li>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/member/login.jsp" style="font-size:13px;">사용후기</a> </li>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/member/login.jsp" style="font-size:13px;">상품 Q&A</a> </li>
										<li class="xans-record-">
											<a href="<%=request.getContextPath()%>/member/login.jsp" style="font-size:13px;">자유게시판</a> </li>
									<% } %>
									</ul>
						</div>
                            </li>

                        </ul></div><!--top_pop_co-->               
              
           

                
				</div>           
            
 

            


       		</div><!--topArea_in -->
           


                 <div style="clear:both; "></div>               
                 <div class="p_category"><div class="top_fix_bg"></div>
                    <div class="category_box">
                        
                        
                        <ul class="xans-element- xans-layout xans-layout-category">
<li class="xans-record-" ><a href="<%=request.getContextPath()%>/category/companyinfo/info.jsp" style="font: 20px bold;">회사&사업소개</a></li>
<li class="xans-record-"><a href="<%=request.getContextPath()%>/category/100_homedeco/101/homedeco.jsp" style="font: 20px bold;">홈데코&장식품</a></li>
<li class="xans-record-"><a href="<%=request.getContextPath()%>/category/200_light/201/light.jsp" style="font: 20px bold;">조명</a></li>
<li class="xans-record-"><a href="<%=request.getContextPath()%>/category/300_organize/301/organize.jsp" style="font: 20px bold;">수납&정리</a></li>
<li class="xans-record-"><a href="<%=request.getContextPath()%>/category/400_furniture/401/furniture.jsp" style="font:20px bold;" >가구</a></li>
<%-- <li class="xans-record-"><a href="category/sale/51/index.html">SALE</a></li> --%>
</ul>
</div><!-- category_box -->     
                </div><!-- p_category -->             
            
    	</div><!--topArea -->
    
            


    
    
    <div class="topArea_in">






        
        

    </div><!--topArea_in -->



    
    
    
 </div><!--inner -->
</div>
</div>

</body>
</html>
