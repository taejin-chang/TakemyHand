<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%
	String message=(String)session.getAttribute("message");
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
	<h2 style="font-size: 20px; font-weight: bold;" align="center">제품등록</h2>
	<div id="form">
	<form class="needs-validation" name="productForm" method="post" enctype="multipart/form-data" id="productForm" novalidate>
	<br>
	<table align="center">
		<tr>
			<td>상품분류</td>
			<td>
			    <div class="col-auto">
				<select class="form-control form-control" name="kinds" id="kinds" required>
				  <option selected></option>
				  <option value="100_homedeco/110_DLY">homedeco_DIY</option>
				  <option value="100_homedeco/120_interior">homedeco_interior</option>
				  <option value="100_homedeco/130_Homegallery">homedeco_Homegallery</option>
				  <option value="200_light/210_light">light_light</option>
				  <option value="200_light/220_ptlight">light_ptlight</option>
				  <option value="300_organize/310_bookshelf">organize_bookshelf</option>
				  <option value="300_organize/320_drawer">organize_drawer</option>
				  <option value="400_furniture">furniture</option>
				</select>
				<div class="invalid-feedback">
		         상품분류를 선택해주세요!
		        </div>
				</div>
			</td>
		</tr>
		<tr>
	    	<td>상품번호</td>
		    <td>
		    <div class="col-auto">
				<%if(message==null) { %>
		      <input type="text" class="form-control" name="num" id="num" placeholder="상품번호를 입력해주세요" required>
				<div class="invalid-feedback" id="message">
				상품번호를 입력해주세요!
		        </div>
		        <% } else { %>
		      <input type="text" class="form-control is-invalid" name="num" id="num" placeholder="상품번호를 입력해주세요" required>
              <div class="invalid-feedback" id="message">
				이미 사용중인 상품번호 입니다.
		      </div>
		      	<% } %>
		    </div>
		    </td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>
			<div class="col-auto">
		      <input type="text" class="form-control" name="name" id="name" placeholder="상품명을 입력해주세요" required>
				<div class="invalid-feedback">
				상품명을 입력해주세요!
		        </div>
		    </div>
			</td>
		</tr>
		<tr>
			<td>상품대표이미지</td>
			<td>
			<div class="col-auto">
			  <input type="file" class="form-control" name="image" id="image" required>
				<div class="invalid-feedback">
		         상품이미지를 업로드 해주세요!
		        </div>
			</div>
			</td>
		</tr>
		<tr>
			<td>상품수량</td>
			<td>
		    <div class="col-auto">
		      <input type="text" class="form-control" name="amount" id="amount" placeholder="상품수량을 입력해주세요" required>
				<div class="invalid-feedback">
		         상품수량을 입력해주세요!
		        </div>
		    </div>
			</td>
		</tr>
		<tr>
			<td>상품가격</td>
			<td>
			<div class="col-auto">
		      <input type="text" class="form-control" name="price" id="price" placeholder="상품가격을 입력해주세요" required>
				<div class="invalid-feedback">
		         상품가격을 입력해주세요!
		        </div>
		    </div>
			</td>
		
	</table>
	<br>
	<table align="center">
			<div class="form-group" align="center"><button type="submit" class="btn btn-primary" id="inputBtn">상품등록</button></div>
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
	//var id=$(".kinds").attr("kinds")
	var value=$("#kinds").val();
	$("#productForm").attr("method", "post")
	$("#productForm").attr("action", "<%=request.getContextPath()%>/admin/product_add_action.jsp?kinds="+value);
	$("#productForm").submit(function() {
		if($("#name").val()=="") {
			return false;
		}		
		if($("#kinds").val()=="") {
			return false;
		}		
		if($("#num").val()=="") {
			return false;
		}
		if($("#name").val()=="") {
			return false;
		}		
		if($("#image").val()=="") {
			return false;
		}		
		if($("#amount").val()=="") {
			return false;
		}		
		if($("#price").val()=="") {
			return false;
		}
	});
});

</script>