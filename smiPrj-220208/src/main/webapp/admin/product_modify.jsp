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
	<h2 style="font-size: 20px; font-weight: bold;" align="center">상품 수정페이지</h2>
	<div id="form" align="center">
	<form class="needs-validation" name="productForm" method="post" enctype="multipart/form-data" id="productForm" novalidate>
	<br>
	<table>
		<tr>
			<td>상품<br>대표이미지</td>
			<td width="500" height="300">
			<img src="<%=request.getContextPath()%>/web/images/<%=product.getP_kinds()%>/<%=product.getP_imgsrc()%>" width="100%" height="100%">
			<input type="hidden" class="form-control" name="image" id="image" value="<%=product.getP_imgsrc()%>">
			<div class="col-sm-10">
			<input type="file" class="form-control" name="newimage" id="newimage">
			</div>
			</td>
		</tr>
		<tr>
			<td>상품분류</td>
			<td>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" name="kinds" id="kinds" value="<%=product.getP_kinds()%>">
			 </div>
			</td>
		</tr>
		<tr>
	    	<td>상품번호</td>
		    <td>
		    <div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext" id="num" name="num" value="<%=product.getP_no() %>">
			 </div>
		    </td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>
			<div class="col-sm-10">
			<input type="text" class="form-control" id="name" name="name" value="<%=product.getP_name() %>">
			 </div>
			</td>
		</tr>
		<tr>
			<td>상품수량</td>
			<td>
			<div class="col-sm-10">
			<input type="text" class="form-control" id="amount" name="amount" value="<%=product.getP_amount() %>">
			 </div>			
			</td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td>
			<div class="col-sm-10">
			<input type="text" class="form-control" id="price" name="price" value="<%=product.getP_price() %>">
			 </div>
			</td>
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
	//var id=$(".kinds").attr("kinds")
	var value=$("#kinds").val();
	$("#productForm").attr("method", "post")
	$("#productForm").attr("action", "<%=request.getContextPath()%>/admin/product_modify_action.jsp?kinds="+value);
	$("#productForm").submit();
});

</script>