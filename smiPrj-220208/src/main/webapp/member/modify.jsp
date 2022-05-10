<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/header.jsp" %>
<%

String passwd=request.getParameter("passwd");

if(!loginMember.getM_passwd().equals(passwd)) {
	session.setAttribute("message", "비밀번호가 맞지 않습니다.");
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/member/password_confirm.jsp';");
	out.println("</script>");
	return;
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<script>
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="join.html" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/member/join.html" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="website" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>

<style type="text/css">
#address {
 vertical-align : middle;
}
</style>

<script type="text/javascript">
function memberEditAction(){
	
	if(editForm.passwd.value=="") {
		alert("비밀번호를 입력해 주세요.");
		editForm.passwd.focus();
		return false;
	}
	
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if(!passwdReg.test(editForm.passwd.value)) {
		alert("비밀번호를 형식에 맞게 입력해 주세요.");
		editForm.passwd.focus();
		return false;
	}
	
	if(editForm.passwd.value!=editForm.passwd_confirm.value) {
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
		editForm.passwd.focus();
		return false;
	}
	
	if(editForm.name.value=="") {
		alert("이름을 입력해 주세요.");
		editForm.name.focus();
		return false;
	}	
	
	if(editForm.zipcode.value=="") {
		alert("우편번호를 입력해 주세요.");
		editForm.zipcode.focus();
		return false;
	}
	
	if(editForm.add1.value=="") {
		alert("주소를 입력해 주세요.");
		editForm.add1.focus();
		return false;
	}
	
	if(editForm.mobile1.value=="") {
		alert("상세주소를 입력해 주세요.");
		editForm.mobile1.focus();
		return false;
	}
	
	if(editForm.mobile1.value=="") {
		alert("휴대폰 번호 첫 자리를 선택해 주세요.");
		editForm.mobile1.focus();
		return false;
	}
	
	if(editForm.mobile2.value=="") {
		alert("휴대폰 번호 가운데 자리를 입력해 주세요.");
		editForm.mobile2.focus();
		return false;
	}
	var mobile2Reg=/d{4}/;
	if(mobile2Reg.test(editForm.mobile2.value)) {
		alert("휴대폰 번호 가운데 자리를 형식에 맞게 입력해 주세요.");
		editForm.mobile2.focus();
		return false;
	}
	if(editForm.mobile3.value=="") {
		alert("휴대폰 번호 끝 자리를 입력해 주세요.");
		editForm.passwd.focus();
		return false;
	}
	var mobile3Reg=/d{4}/;
	if(mobile3Reg.test(editForm.mobile3.value)) {
		alert("휴대폰 번호 끝 자리를 형식에 맞게 입력해 주세요.");
		editForm.mobile3.focus();
		return false;
	}	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if(editForm.email.value=="") {
		alert("이메일을 입력해 주세요.");
		editForm.email.focus();
		return false;
	}
	if(!emailReg.test(editForm.email.value)) { 
		alert("이메일을 형식에 맞게 입력해 주세요.");
		editForm.email.focus();
		return false;
	}
	
	editForm.action="modify_action.jsp";
	editForm.submit();
}
//FormElement.onsubmit : 
editForm.id.onsubmit=function() {
	
	

}


</script>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1635315871"  /><link rel="stylesheet" type="text/css" href="http://ecudemo200642.cafe24.com/ind-script/optimizer.php?filename=tZTNTkQhDIX3c936HJ1MjM_gwp1PAKUXaoASfozz9nJHY2atdNe05DvNoS0ESQSE22hU2wyGoySX8_n56QJl2Mi4hZ4iNEebo8Y-gzWNAFuDJG5EgkTJUoV34fww04_wV2Y0Vxn9iBlvAigpyWrod2IxlPB0FE6DlcBdJHYuSvRAUQtd6pwS1PK7GM_ZdNJy3Vglsh29Lx_tX7h86hkStcyej1AJPQtU_8e-O3g_MmnMjWxBylvgUjj71QIo-WMyWHLBZey7a71NgZ1rWt73XEgv9bqa28hUDC9k3PrPjOKlS1necp9eHOx9V0NntcF-5XY73F8&type=css&k=c48ecd300d4fdffa9d1926f868f0befb92c76e66&t=1636193578&user=T"  />

<hr class="layout"/><div id="container">
        <div id="contents">
            
<div class="path">
    <span>현재 위치</span>
    <ol><li><a href="<%=request.getContextPath() %>/index.jsp2">홈</a></li>
        <li title="현재 위치"><strong>회원 정보 수정</strong></li>
    </ol></div>

<div class="titleArea">
    <h2>회원 정보 수정</h2>
</div>

<form id="editForm" name="editForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=modify_action" method="post" target="_self">
<input type="hidden" name="idCheckResult" id="idCheckResult" value="0">

<div class="xans-element- xans-member xans-member-join">
<div class="ec-base-table typeWrite">
        <table border="1" summary="">
<caption>회원 정보 수정</caption>
        <colgroup>
<col style="width:150px;"/>
<col style="width:auto;"/>
</colgroup>

</table>
</div>
<h3 class="displaynone ">기본정보</h3>
<p class="required displaynone"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/> 필수입력사항</p>
<div class="ec-base-table typeWrite">
        <table border="1" summary="">
<caption>회원 기본정보</caption>
        <colgroup>
<col style="width:150px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody>
<tr>
<th scope="row">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td><input id="member_id" name="id" fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="" value="<%=loginMember.getM_userid() %>" type="text" readonly />
               </td>
                
            </tr>
<tr>

<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td>
                    <div class="eTooltip">
                        <input id="passwd" name="passwd" fw-filter="isFill&isMin[4]&isMax[16]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value="<%=loginMember.getM_passwd() %>" type="password"  />                        <div class="ec-base-tooltip typeUpper">
                            <div class="content">
                                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                                <ul class="ec-base-help typeDash gBlank10 txtWarn">
                                    
                - 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자<br>
                - 입력 가능 특수문자 <br>
                &nbsp;&nbsp;&nbsp;  ~ ` ! @ # $ % ^ ( ) _ - = { } [ ] | ; : < > , . ? /<br>
                - 공백 입력 불가능                                </ul>
</div>
                            <a href="#none" class="btnClose"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"/></a>
                            <span class="edge"></span>
                        </div>
                    </div>
                    (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)                </td>
            </tr>
<tr>
<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td><input id="passwd_confirm" name="passwd_confirm" fw-filter="isFill&isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled" value="<%=loginMember.getM_passwd() %>" type="password"  /> <span id="pwConfirmMsg"></span> </td>
            </tr>


<tr>
<th scope="row" id="nameTitle">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td>
                    <span id="nameContents"><input id="name" name="name" fw-filter="isFill&isMax[30]" fw-label="이름" fw-msg="" class="ec-member-name" placeholder="" maxlength="30" value="<%=loginMember.getM_name() %>" type="text"  /></span>
                    <span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span>
                </td>
            </tr>

<!-- <th scope="row">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="displaynone" alt="필수"/></th>
                <td><ul class="ec-address"> -->
        <th scope="row" style="height:50px">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td id="address" style="height:50px">

<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="<%=loginMember.getM_zipcode() %>">

<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"style="height:18px"><br>
<input type="text" id="add1"  name="add1" placeholder="주소" style="width:250px; height:18px" value="<%=loginMember.getM_add1() %>">
<input type="text" id="add2"  name="add2" placeholder="상세주소" style="width:300px; height:18px" value="<%=loginMember.getM_add2() %>">
<input type="hidden"  id="sample6_extraAddress" placeholder="참고항목" >

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
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
                
                

<tr class="">
<th scope="row">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td>
                    <select id="mobile1" name="mobile1" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" >
<option value="010">010</option>
</select>-<input id="mobile2" name="mobile2" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="<%=loginMember.getM_tel().substring(4, 8) %>" type="text"  />
-<input id="mobile3" name="mobile3" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="<%=loginMember.getM_tel().substring(9) %>" type="text"  /><button type="button" id="btn_action_verify_mobile" class="btnNormal displaynone" onclick="memberVerifyMobile.joinSendVerificationNumber(); return false;">인증번호받기</button>
 
<tr>
<th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"/></th>
                <td><input id="email" name="email" fw-filter="isFill&isEmail" fw-label="이메일" fw-alone="N" fw-msg="" value="<%=loginMember.getM_email()%>" type="text"  /> <span id="emailMsg"></span>
</td>
            </tr>

</tbody>
</table>
</div>

<div class="ec-base-button">
        <a href="#none" class="btnSubmitFix sizeM" onclick="memberEditAction()">수정</a>
        <a href="<%=request.getContextPath()%>/myshop/index.jsp" class="btnSubmitFix sizeM">취소</a>
    </div>

</div>
</form>        </div><hr class="layout"/></div><hr class="layout"/><div id="footer">

<%@include file="/include/footer.jsp"%>
</body></html>
