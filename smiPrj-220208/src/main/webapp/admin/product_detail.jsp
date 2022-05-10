<%@page import="java.util.List"%>
<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%
	String p_no=request.getParameter("p_no");
	ProductDTO product=ProductDAO.getDAO().searchProduct(p_no);
	
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
	<h2 style="font-size: 20px; font-weight: bold;" align="center">상품 상세페이지</h2>
	<div id="form" align="center">
	<br>
	<table>
		<tr>
			<td>상품<br>대표이미지</td>
			<td width="500" height="300">
			<img src="<%=request.getContextPath()%>/web/images/<%=product.getP_kinds()%>/<%=product.getP_imgsrc()%>" width="100%" height="100%">
			</td>
		</tr>
		<tr>
			<td>상품분류</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=product.getP_kinds()%>">
			 </div>
			</td>
		</tr>
		<tr>
	    	<td>상품번호</td>
		    <td>
		    <div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=product.getP_no() %>">
			 </div>
		    </td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=product.getP_name() %>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>상품수량</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=product.getP_amount() %>">
			 </div>			
			</td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td>
			<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="<%=product.getP_price() %>">
			 </div>
			</td>
	</table>
	<br>
	<table align="center">	
		<tr>
		<td id="btnDiv">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="listBtn" onclick="location.href='<%=request.getContextPath()%>/admin/product_manager.jsp'">상품리스트</button>
			</div>
		</td>
		<td id="btnDiv">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn" onclick="location.href='<%=request.getContextPath()%>/admin/product_modify.jsp?p_no=<%=product.getP_no()%>'">상품수정</button>
			</div>
		</td>
		<td>
		</td>
		<td>
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"  id="removeBtn">상품삭제</button>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">상품 삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      정말로 상품을 삭제하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/admin/product_remove_action.jsp?p_no=<%=product.getP_no()%>&p_kinds=<%=product.getP_kinds()%>'">삭제</button>
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