<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%
	String m_userid=request.getParameter("m_userid");
	MemberDTO member=MemberDAO.getDAO().memberSelect(m_userid,"");
	
%>
<style type="text/css">
table {
	align: center;
}

td {
	font-size: 15px;
}

input {
	text-align: center;
}
</style>
<div id="content-wrapper" class="d-flex flex-column">
<div id="content">
	<br>
<div id="member">
	<h2 style="font-size: 20px; font-weight: bold;" align="center">회원정보 수정페이지</h2>
	<div id="form" align="center">
	<form class="needs-validation" name="memberForm" method="post" id="memberForm" novalidate>
	<br>
	<table>
		<tr>
			<td>아이디</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="m_userid" id="m_userid" value="<%=member.getM_userid()%>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="m_name" id="m_name" value="<%=member.getM_name()%>">
			 </div>
			</td>
		</tr>
		<tr>
	    	<td>연락처</td>
		    <td>
		    <div class="col-sm-10">
				<input type="text" class="form-control" id="m_tel" name="m_tel" value="<%=member.getM_tel()%>">
			 </div>
		    </td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="m_email" name="m_email" value="<%=member.getM_email()%>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" id="m_addr" name="m_addr" value="[<%=member.getM_zipcode()%>]&nbsp;&nbsp;<%=member.getM_add1() %>&nbsp;&nbsp;<%=member.getM_add2() %>">
			 </div>			
			</td>
		</tr>
		<tr>
			<td>등급</td>
			<td>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="m_grade" name="m_grade" value="<%=member.getM_grade()%>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>마지막로그인</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" id="m_last_login" name="m_last_login" value="<%=member.getM_last_login()%>">
			 </div>
			</td>
		</tr>
	</table>
	<br>
	<table align="center">	
		<tr>
		<td id="btnDiv">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn">수정완료</button>
			</div>
		</td>
		<td>
		</td>
		</tr>
	</table>
	</form>
	</div>
	</div>
	</div>
</div>

<script>
$("#modBtn").click(function() {
	var value=$("#m_userid").val();
	$("#memberForm").attr("method", "post")
	$("#memberForm").attr("action", "<%=request.getContextPath()%>/admin/member_modify_action.jsp?m_userid="+value);
	$("#memberForm").submit();
});

</script>