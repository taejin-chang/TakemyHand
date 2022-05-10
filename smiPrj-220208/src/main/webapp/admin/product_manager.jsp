<%@page import="InteriorDAO.HomegalleryDAO"%>
<%@page import="InteriorDAO.DecoDAO"%>
<%@page import="InteriorDTO.HomegalleryDTO"%>
<%@page import="InteriorDTO.DecoDTO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@page import="InteriorDTO.DlyDTO"%>
<%@page import="InteriorDAO.BookshelfDAO"%>
<%@page import="InteriorDTO.BookshelfDTO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="InteriorDAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/admin_header.jsp" %>  
<%	request.setCharacterEncoding("utf-8"); %>
<%
	String search=request.getParameter("search");
	if(search==null) {
		search="";
	}
	
	String keyword=request.getParameter("keyword");
	if(keyword==null) {
		keyword="";
	}
	
	int pageNum=1;
	
	if(request.getParameter("pageNum")!=null) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=10;
	
	int totalProduct=ProductDAO.getDAO().selectCountProduct(search,keyword);
	
	int totalPage=(int)Math.ceil((double)totalProduct/pageSize);
	
	//요청 페이지 번호에 대한 검증
	if (pageNum>totalPage || pageNum<=0) {
		pageNum=1;
	}
	//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
	//1p = 1, 2p=11, 3p=21
	int startRow=(pageNum-1)*pageSize+1;
	//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
	//1p = 10, 2p=20, 3p=30
	int endRow=pageNum*pageSize;
	//마지막 페이지에 대한 게시글 종료 행번호를 전달 게시글의 갯수로 변경
	if(endRow>totalProduct) {
		endRow=totalProduct;
	}
	
	List<ProductDTO> productList=ProductDAO.getDAO().selectProductList(startRow, endRow, search, keyword);
	//List<BookshelfDTO> productList=BookshelfDAO.getDAO().selectProductList(startRow, endRow, search, keyword);

	//요청 페이지에 대한 게시글 시작 행번호와 게시글 종료 행번호를 전달받아 BOARD 테이블에 저장된

	//요청 페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
	//500-(1-1)*10; 1p = 500/ 500-10 = 490
	
	int number=totalProduct-(pageNum-1)*pageSize;



%>
<style type="text/css">
#btnDiv {
		border: 0px bg;
		text-align: right;
}
table {
	width: 80%;
	border-collapse: collapse;
}
th {
	text-align: center;
	height: 30px;
}
td {
	text-align: center;
}
td a, td a:visited {
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
	color: blue;
}

</style>
<div id="content-wrapper" class="d-flex flex-column">
<div id="content">
	<br>
	<h2 style="font-size: 20px; font-weight: bold;" align="center">상품 리스트</h2>
	<div align="center">
	<table>	
		<tr>
		<td id="btnDiv">
		<button type="button" class="btn btn-primary" id="insertBtn" onclick="location.href='<%=request.getContextPath()%>/admin/product_add.jsp'">상품등록</button>
		<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="removeBtn">상품삭제</button> -->
			
		</td>
		</tr>
	</table>
	<br>
	<table> 
		<tr bgcolor="EcECEC">
			<th width="10%">상품번호</th>
			<th width="15%">상품이미지</th>
			<th width="10%">상품분류</th>
			<th width="20%">상품명</th>
			<th width="15%">가격</th>
			<th width="10%">수량</th>
			<th width="15%"></th>
		</tr>
		<% if(productList.isEmpty()) { %>
		<tr>
			<td colspan="6">등록된 제품이 없습니다.</td>	
		</tr>
		<% } else { %>
			<% for(ProductDTO product:productList) { %>
		<tr>
			<td width="10%">
			<input type="hidden" name="num" value="<%=number%>"><%=product.getP_no() %>
			</td>
			<td width="15%">
			<img src="<%=request.getContextPath()%>/web/images/<%=product.getP_kinds()%>/<%=product.getP_imgsrc()%>" width="100" height="100"></td>
			<td width="15%"><%=product.getP_kinds() %></td>
			<td width="25%">
			<a href="<%=request.getContextPath()%>/admin/product_detail.jsp?p_no=<%=product.getP_no()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>">
			<%=product.getP_name()%>
			</a>
			</td>
			<td width="15%"><%=product.getP_price() %></td>
			<td width="10%"><%=product.getP_amount() %></td>
			<td width="15%">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn" onclick="location.href='<%=request.getContextPath()%>/admin/product_modify.jsp?p_no=<%=product.getP_no()%>'">수정</button>
			
			</div>
			</td>
			<% number--; %>
			
			<% } %>
		<% } %>

	</table>

	<br>
	<form action="<%=request.getContextPath()%>/admin/product_manager.jsp" method="post">
	<table>
	<tr>
	<td>
		<div class="d-flex justify-content-end">
			<%-- select 태그에 의해 입력되어 전달되는 값은 비교 컬럼명과 동일하게 설정 --%>
		    <div class="p-2 bd-highlight">
				<select class="custom-select mr-sm-1" name="search" id="search">
				 	 <option value="p_name">상품명</option>
				 	 <option value="p_kinds">카테고리</option>
				</select>
			</div>
		    <div class="p-2 bd-highlight">
				<input class="form-control mr-sm-2" type="text" name="keyword" id="keyword">
			</div>
			<div class="p-2 bd-highlight">
				<button class="btn btn-primary" type="submit">검색</button>
			</div>
			</div>
			</td>
			</tr>
		</table>
		</form>
	<%
	//페이지 블럭에 출력될 페이지의 갯수 설정

	int blockSize=10;
	//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장

	int startblockPage=(pageNum-1)/blockSize*blockSize+1;
	//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
	//1block = 1->10 2block 11->20
	int endblockPage=(startblockPage-1)+blockSize;
	//마지막 페이지 불럭의 종료 페이지 번호 변경
	//1p(1~10) 2p(11~20) 3p(21~30)    end = 3p(30) total 29
	if(endblockPage>totalPage) {
		endblockPage=totalPage;
	}
	%>
	<br>

	<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  <% if(startblockPage>blockSize) { %> <%--11페이지가 되면   --%>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/product_manager.jsp?pageNum=1&search=<%=search%>&keyword=<%=keyword%>">처음</a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/product_manager.jsp?pageNum=<%=startblockPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>" tabindex="-1">이전</a>
	    </li>
	  <% } else { %>
	  	<li class="page-item disabled">
	      <a class="page-link" href="#">처음</a>
	    </li>
	    <li class="page-item disabled">
	      <a class="page-link" href="#" tabindex="-1">이전</a>
	    </li>
	  <% } %>
	    	
	    <%for(int i=startblockPage;i<=endblockPage;i++) { %>
	    	<% if(pageNum!=i) { %>
	    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/product_manager.jsp?pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i%></a></li>
	    	<% } else { %>
	    	<li class="page-item"><a class="page-link"><%=i %></a></li>
    		<% } %>
   		<% } %>
   		
   		<% if(endblockPage!=totalPage) { %>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/product_manager.jsp?pageNum=<%=startblockPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">다음</a>
	    </li>
	    <li class="page-item">	    
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/product_manager.jsp?pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">마지막</a>
	    </li>
	    <% } else { %>
	  	<li class="page-item disabled">
	      <a class="page-link" href="#">다음</a>
	    </li>
	    <li class="page-item disabled">
	      <a class="page-link" href="#">마지막</a>
	    </li>
	    <% } %>
	  </ul>
	</nav>
	</div>

		</div>

	</div>

	</div>

