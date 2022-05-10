<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file="/include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    
    
<%-- 회원정보변경 또는 회원탈퇴를 위해 비밀번호를 입력하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 비정상적인 요청이므로 에러페이지로 이동 --%>
<%-- => 전달값에 비교하여 form 태그의 요청 JSP 문서를 구분 --%>
<%
	
	String message=(String)session.getAttribute("message");

	//전달값이 없거나 비정상적인 값이 전달된 경우 에러페이지로 이동
	if(loginMember==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/error/error400.jsp';");
		out.println("</script>");
		return;
	}
	
	if(message==null) {
		message="";
	}
	
%>
<div align="center">
<form name="passwordForm" method="post">

		<p>비밀번호를 입력해주세요.	</p>
		<br>
		<input type="password" name="passwd" id="passwd">
		<br>
		<br>
		<p id="message" style="color: red;"><%=message%></p>
		
		<br>
		<br>
		<button type="button" class="btnSubmitFix sizeM" onclick="submitCheck();">입력완료</button>
</form>
</div>

<script type="text/javascript">
passwordForm.passwd.focus();

function submitCheck() {
	if(passwordForm.passwd.value=="") {
		document.getElementById("message").innerHTML="비밀번호를 반드시 입력해 주세요.";
		passwordForm.passwd.focus();
		return;
	}
		
	var value=$("#passwd").val();
	passwordForm.action="<%=request.getContextPath()%>/member/modify.jsp?passwd="+value;
	
	passwordForm.submit();
}
</script>


<%@include file="/include/footer.jsp"%>








