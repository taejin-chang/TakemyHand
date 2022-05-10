<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="InteriorDAO.MemberDAO"%>
<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDTO.QuestionDTO"%>
<%@page import="InteriorDAO.QuestionDAO"%>
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
	
	String p_no=request.getParameter("p_no");
	if(p_no==null) {
		p_no="";
	}
	
	String m_userid=request.getParameter("m_userid");
	
	int pageNum=1;
	
	if(request.getParameter("pageNum")!=null) {
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=10;
	
	int totalQuestion=QuestionDAO.getDAO().selectCountQna(search, keyword);
	
	int totalPage=(int)Math.ceil((double)totalQuestion/pageSize);
	
	if (pageNum>totalPage || pageNum<=0) {
		pageNum=1;
	}
	int startRow=(pageNum-1)*pageSize+1;
	
	int endRow=pageNum*pageSize;
	
	if(endRow>totalQuestion) {
		endRow=totalQuestion;
	}
	
	List<QuestionDTO> qaList=QuestionDAO.getDAO().selectqnaList(startRow, endRow, search, keyword);
	
	//MemberDTO member=MemberDAO.getDAO().memberSelect(m_userid);

	ProductDTO product=ProductDAO.getDAO().searchProduct(p_no);

	int number=totalQuestion-(pageNum-1)*pageSize;
	

	int blockSize=10;

	int startblockPage=(pageNum-1)/blockSize*blockSize+1;
	
	int endblockPage=(startblockPage-1)+blockSize;
	
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
	<h2 style="font-size: 20px; font-weight: bold;" align="center">Q&A</h2>
	<div align="center">
	<table>	
		<tr>
		<td id="btnDiv">
		<button type="button" class="btn btn-primary" id="insertBtn" onclick="location.href='<%=request.getContextPath()%>/admin/qna_add.jsp'">Q&A 등록</button>
			
		</td>
		</tr>
	</table>
	<br>
	<table> 
		<tr bgcolor="EcECEC">
			<th width="5%">번호</th>
			<th width="10%">작성자</th>
			<th width="20%">제목</th>
			<th width="30%">내용</th>
			<th width="15%">작성일</th>
			<th width="5%">조회수</th>
			<th width="10%"></th>
		</tr>
		<% if(qaList.isEmpty()) { %>
		<tr>
			<td colspan="7">등록된 Q&A가 없습니다.</td>	
		</tr>
		<% } else { %>
			<% for(QuestionDTO qa:qaList) { %>
		<tr>
			<td width="5%">
			<input type="hidden" name="num" value="<%=number %>"><%=qa.getQ_no()%>
			</td>
			<td width="10%" ><input type="hidden" name="m_userid" value="<%=qa.getM_userid()%>"><%=qa.getM_userid()%></td>
			<td class="subject left txtBreak" width="20%">
			<% if(qa.getReStep()!=0) { %>
			<span style="margin-left: <%=qa.getReLevel()*40%>px;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="ec-common-rwd-image" /></span>
			<% } %>
			<a href="<%=request.getContextPath()%>/admin/qna_detail.jsp?q_no=<%=qa.getQ_no()%>&pageNum=<%=pageNum %>&search=<%=search%>&keyword=<%=keyword%>" style="color:#555555;">
			<%=qa.getQ_title()%></a></td>
			<td width="30%">
			<%=qa.getQ_content()%></td>
			<td width="15%"><%=qa.getQ_date()%></td>
			<td width="5%"><%=qa.getQ_count()%></td>
			<td width="10%">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn" onclick="location.href='<%=request.getContextPath()%>/admin/qna_modify.jsp?q_no=<%=qa.getQ_no()%>'">수정</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="removeBtn" data-whatever="<%=qa.getQ_no()%>">삭제</button>
			<% number--; %>
			<!-- Modal -->
			</div>
			</td>
			<% } %>
		<% } %>

	</table>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Q&A 삭제</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      <h1 class="form-control-plaintext" id="q_no"></h1>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" id="removeBtn2">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
	<br>
	<form action="<%=request.getContextPath()%>/admin/qna_manager.jsp" method="post">
	<table>
	<tr>
	<td>
		<div class="d-flex justify-content-end">
			<%-- select 태그에 의해 입력되어 전달되는 값은 비교 컬럼명과 동일하게 설정 --%>
		    <div class="p-2 bd-highlight">
				<select class="custom-select mr-sm-1" name="search" id="search">
				 	 <option value="q_title">제목</option>
				 	 <option value="q_content">내용</option>
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
	<%

	%>
	<br>

	<div class="d-flex justify-content-center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  <% if(startblockPage>blockSize) { %> <%--11페이지가 되면   --%>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/qna_manager.jsp?pageNum=1&search=<%=search%>&keyword=<%=keyword%>">처음</a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/qna_manager.jsp?pageNum=<%=startblockPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>" tabindex="-1">이전</a>
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
	    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/qna_manager.jsp?pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i%></a></li>
	    	<% } else { %>
	    	<li class="page-item"><a class="page-link"><%=i %></a></li>
    		<% } %>
   		<% } %>
   		
   		<% if(endblockPage!=totalPage) { %>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/qna_manager.jsp?pageNum=<%=startblockPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">다음</a>
	    </li>
	    <li class="page-item">	    
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/qna_manager.jsp?pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">마지막</a>
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
	  var q_no = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-body').text(q_no + '번 게시글을 삭제 하시겠습니까?')
	  $('#removeBtn2').click(function() {
		  location.href="qna_remove_action.jsp?q_no="+q_no
	  })
	})
</script>

