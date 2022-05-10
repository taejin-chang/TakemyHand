<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%
	String message=(String)session.getAttribute("message");
	
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

%>

<style type="text/css">
td {
	font-size: 15px;
}
</style>
<div id="content-wrapper" class="d-flex flex-column">
<div id="content">
	<br>
<div id="product">
	<h2 style="font-size: 20px; font-weight: bold;" align="center">공지사항 등록</h2>
	<div id="form">
	<form class="needs-validation" name="noticeForm" method="post" id="noticeForm" novalidate>
	<br>
	<table align="center">
		<tr>
			<td>제목</td>
			<td>
			<div class="col-auto">
		      <input type="text" class="form-control" name="n_title" id="n_title" placeholder="글제목을 입력해주세요" required>
				<div class="invalid-feedback">
				제목을 입력해주세요!
		        </div>
		    </div>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="n_content" id="n_content" placeholder="내용을 입력해주세요" required>
				<div class="invalid-feedback">
		         내용을 입력해주세요!
		        </div>
		    </div>
			</td>
		</tr>
	</table>
	<br>
	<table align="center">
			<div class="form-group" align="center"><button type="submit" class="btn btn-primary" id="inputBtn" value="abc123">공지사항 등록</button></div>
	</table>
	</form>
	</div>
	</div>
	</div>
</div>

<script>
//Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();


$("#inputBtn").click(function() {
	var value=$("#inputBtn").val();
	$("#noticeForm").attr("method", "post")
	$("#noticeForm").attr("action", "<%=request.getContextPath()%>/admin/notice_add_action.jsp?id="+value);
	$("#noticeForm").submit(function() {
		if($("#n_title").val()=="") {
			return false;
		}		
		if($("#n_content").val()=="") {
			return false;
		}		
	});
});

</script>