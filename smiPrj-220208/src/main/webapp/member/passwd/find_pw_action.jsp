<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	String m_userid=request.getParameter("m_userid");
	String m_name=request.getParameter("m_name");
	String m_email=request.getParameter("m_email");
	String m_tel=request.getParameter("m_tel");
	
	System.out.println(m_tel);
	
	
	if(m_email==null) {m_email="";}
	if(m_tel==null) {m_tel="";}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
#search {
    display: flex;
    align-items: center;
	width: 500px;
	height: 400px;
	margin: 0 auto;
	text-align: center;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: 10px;
	font-size: 14px;
}


td { 
	border: 1px solid black; 
}

.zipcode { 
	width: 100px; 
}

.address {
	width: 400px;
	text-align: left;
	padding-left: 2px;
}
</style>


</head>
<body>
	<div id="search" >
	
		
		
		
		<form id="pwUpdate" name="pwUpdate" method="post">
		<input name="m_userid" type="hidden" value="<%=m_userid%>"/>
		<input name="m_tel" type="hidden" value="<%=m_tel%>"/>
		<input name="m_email" type="hidden" value="<%=m_email%>"/>
		<input name="m_name" type="hidden" value="<%=m_name%>"/>
		<div>
			<p> 비밀번호 변경 페이지 입니다</p>
			<p> 변경할 비밀번호를 입력해주세요.</p>
		
		</div>
		
		
		
        <input id="passwd" name="passwd" type="password"/>                        
        <div class="ec-base-tooltip typeUpper">
            <div class="content">
                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                <ul class="ec-base-help typeDash gBlank10 txtWarn">
                                    
                - 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자<br>
                - 입력 가능 특수문자 <br>
                &nbsp;&nbsp;&nbsp;  ~ ` ! @ # $ % ^ ( ) _ - = { } [ ] | ; : < > , . ? /<br>
                - 공백 입력 불가능                                </ul>
			</div>
			</div>
		</form>
	</div>	
		<div class="ec-base-button" align="center">
        <button type="button" class="btnSubmitFix sizeM" onclick="pwUpdateAction()">비밀번호 변경</button>
    </div>
</body>
<script type="text/javascript">
function pwUpdateAction(){

	if(pwUpdate.passwd.value=="") {
		alert("비밀번호를 입력해 주세요.");
		joinForm.passwd.focus();
		return false;
	}
	
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{6,20}$/g;
	if(!passwdReg.test(pwUpdate.passwd.value)) {
		alert("비밀번호를 형식에 맞게 입력해 주세요.");
		joinForm.passwd.focus();
		return false;
	}

	pwUpdate.action="<%=request.getContextPath()%>/member/passwd/passwd_update.jsp"
	pwUpdate.submit();
	//window.close();
}
</script>
</html>
