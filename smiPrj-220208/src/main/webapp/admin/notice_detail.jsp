<%@page import="InteriorDAO.NoticeDAO"%>
<%@page import="InteriorDTO.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%
	int n_no=Integer.parseInt(request.getParameter("n_no"));
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
<div id="product">
	<h2 style="font-size: 20px; font-weight: bold;" align="center">공지사항 상세페이지</h2>
	<div id="form" align="center">
	<br>
	<table>
		<tr>
			<td>글번호</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=notice.getN_no()%>">
			 </div>
			</td>
		</tr>
		<tr>
	    	<td>작성자</td>
		    <td>
		    <div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=notice.getM_userid() %>">
			 </div>
		    </td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=notice.getN_title() %>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=notice.getN_content()%>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=notice.getN_regdate() %>">
			 </div>			
			</td>
		</tr>
	</table>
	<br>
	<table align="center">	
		<tr>
		<td id="btnDiv">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="listBtn" onclick="location.href='<%=request.getContextPath()%>/admin/notice_manager.jsp'">공지사항리스트</button>
			</div>
		</td>
		<td id="btnDiv">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn" onclick="location.href='<%=request.getContextPath()%>/admin/notice_modify.jsp?n_no=<%=notice.getN_no()%>'">수정</button>
			</div>
		</td>
		<td>
		</td>
		<td>
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"  id="removeBtn">삭제</button>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">공지사항 삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      정말로 공지사항을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/admin_remove_action.jsp?n_no=<%=notice.getN_no()%>'">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			</div>
		</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
</div>