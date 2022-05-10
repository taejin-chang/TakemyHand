<%@page import="InteriorDTO.NoticeDTO"%>
<%@page import="InteriorDAO.NoticeDAO"%>
<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%
	int n_no=Integer.parseInt(request.getParameter("n_no"));
	String m_userid=request.getParameter("id");
	MemberDTO member=MemberDAO.getDAO().memberSelect(m_userid,"");
	NoticeDTO notice=NoticeDAO.getDAO().selectNotice(n_no);
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
<div id="notice">
	<h2 style="font-size: 20px; font-weight: bold;" align="center">공지사항 수정페이지</h2>
	<div id="form" align="center">
	<form class="needs-validation" name="noticeForm" method="post" id="noticeForm" novalidate>
	<br>
	<table>
		<tr>
			<td>글 번호</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="n_no" id="n_no" value="<%=notice.getN_no()%>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>관리자아이디</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="m_userid" id="m_userid" value="<%=notice.getM_userid()%>">
			 </div>
			</td>
		</tr>
		<tr>
	    	<td>제목</td>
		    <td>
		    <div class="col-sm-10">
				<input type="text" class="form-control" id="n_title" name="n_title" value="<%=notice.getN_title()%>">
			 </div>
		    </td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="n_content" name="n_content" value="<%=notice.getN_content()%>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" id="n_regdate" name="n_regdate"  value="<%=notice.getN_regdate()%>">
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
	var value=$("#n_no").val();
	$("#noticeForm").attr("method", "post")
	$("#noticeForm").attr("action", "<%=request.getContextPath()%>/admin/notice_modify_action.jsp?n_no="+value);
	$("#noticeForm").submit();
});

</script>