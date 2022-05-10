<%@page import="InteriorDTO.NoticeDTO"%>
<%@page import="InteriorDAO.NoticeDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/include/admin_header.jsp" %>  

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
	
	int totalNotice=NoticeDAO.getDAO().selectCountNotice(search, keyword);
	
	int totalPage=(int)Math.ceil((double)totalNotice/pageSize);
	
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
	if(endRow>totalNotice) {
		endRow=totalNotice;
	}
	
	List<NoticeDTO> noticeList=NoticeDAO.getDAO().selectNoticeList(startRow, endRow, search, keyword);
	//요청 페이지에 대한 게시글 시작 행번호와 게시글 종료 행번호를 전달받아 BOARD 테이블에 저장된

	//요청 페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
	//500-(1-1)*10; 1p = 500/ 500-10 = 490
	int number=totalNotice-(pageNum-1)*pageSize;
	
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
	<h2 style="font-size: 20px; font-weight: bold;" align="center">공지사항</h2>
	<div align="center">
	<table>	
		<tr>
		<td id="btnDiv">
		<button type="button" class="btn btn-primary" id="insertBtn" onclick="location.href='<%=request.getContextPath()%>/admin/notice_add.jsp'">공지사항 등록</button>
			
		</td>
		</tr>
	</table>
	<br>
	<table> 
		<tr bgcolor="EcECEC">
			<th width="5%">글번호</th>
			<th width="10%">작성자</th>
			<th width="20%">제목</th>
			<th width="30%">내용</th>
			<th width="15%">작성일</th>
			<th width="5%">조회수</th>
			<th width="10%"></th>
		</tr>
		<% if(noticeList.isEmpty()) { %>
		<tr>
			<td colspan="7">등록된 공지사항이 없습니다.</td>	
		</tr>
		<% } else { %>
			<% for(NoticeDTO notice:noticeList) { %>
		<tr>
			<td width="5%">
			<input type="hidden" name="num" value="<%=number %>"><%=notice.getN_no()%>
			</td>
			<td width="10%"><%=notice.getM_userid()%></td>
			<td width="20%">
			<a href="<%=request.getContextPath()%>/admin/notice_detail.jsp?n_no=<%=notice.getN_no()%>&pageNum=<%=pageNum %>&search=<%=search%>&keyword=<%=keyword%>">
			<%=notice.getN_title()%></a></td>
			<td width="30%"><%=notice.getN_content()%></td>
			<td width="15%"><%=notice.getN_regdate()%></td>
			<td width="5%"><%=notice.getN_count()%></td>
			<td width="10%">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn" onclick="location.href='<%=request.getContextPath()%>/admin/notice_modify.jsp?n_no=<%=notice.getN_no()%>'">수정</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="removeBtn" data-whatever="<%=notice.getN_no()%>">삭제</button>
			<% number--; %>
			<!-- Modal -->
			
			</div>
			</td>
		</tr>
			<% } %>
		<% } %>

	</table>
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
			      <h1 class="form-control-plaintext" id="n_no"></h1>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" id="removeBtn2">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
	<br>
	<form action="<%=request.getContextPath()%>/admin/notice_manager.jsp" method="post">
	<table>
	<tr>
	<td>
		<div class="d-flex justify-content-end">
			<%-- select 태그에 의해 입력되어 전달되는 값은 비교 컬럼명과 동일하게 설정 --%>
		    <div class="p-2 bd-highlight">
				<select class="custom-select mr-sm-1" name="search" id="search">
				 	 <option value="n_title">제목</option>
				 	 <option value="n_content">내용</option>
				</select>
			</div>
		    <div class="p-2 bd-highlight">
				<input class="form-control mr-sm-2" type="text" name="keyword">
			</div>
			<div class="p-2 bd-highlight">
				<button class="btn btn-primary" type="submit">검색</button>
			</div>
			</div>
			</td>
			</tr>
		</table>
		</form>
	<br>

	<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  <% if(startblockPage>blockSize) { %> <%--11페이지가 되면   --%>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/notice_manager.jsp?pageNum=1&search=<%=search%>&keyword=<%=keyword%>">처음</a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/notice_manager.jsp?pageNum=<%=startblockPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>" tabindex="-1">이전</a>
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
	    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/notice_manager.jsp?pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i%></a></li>
	    	<% } else { %>
	    	<li class="page-item"><a class="page-link"><%=i %></a></li>
    		<% } %>
   		<% } %>
   		
   		<% if(endblockPage!=totalPage) { %>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/notice_manager.jsp?pageNum=<%=startblockPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">다음</a>
	    </li>
	    <li class="page-item">	    
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/notice_manager.jsp?pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">마지막</a>
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

<script>

$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var n_no = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-body').text(n_no + '번 공지사항을 삭제 하시겠습니까?')
	  $('#removeBtn2').click(function() {
		  location.href="notice_remove_action.jsp?n_no="+n_no
	  })
	})
</script>

