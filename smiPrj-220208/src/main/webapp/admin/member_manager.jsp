<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.MemberDAO"%>
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
	
	int totalMember=MemberDAO.getDAO().selectCountMember(search, keyword);
	
	int totalPage=(int)Math.ceil((double)totalMember/pageSize);
	
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
	if(endRow>totalMember) {
		endRow=totalMember;
	}
	
	List<MemberDTO> memberList=MemberDAO.getDAO().selectMemberList(startRow, endRow, search, keyword);
	//요청 페이지에 대한 게시글 시작 행번호와 게시글 종료 행번호를 전달받아 BOARD 테이블에 저장된

	//요청 페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
	//500-(1-1)*10; 1p = 500/ 500-10 = 490
	int number=totalMember-(pageNum-1)*pageSize;

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
	<h2 style="font-size: 20px; font-weight: bold;" align="center">회원 리스트</h2>

	
	
	<div align="center">
	<br>
	<table> 
		<tr bgcolor="EcECEC">
			<th width="10%">아이디</th>
			<th width="10%">이름</th>
			<th width="10%">연락처</th>
			<th width="10%">이메일</th>
			<th width="25%">주소</th>
			<th width="10%">등급</th>
			<th width="10%">마지막로그인</th>
			<th width="15%"></th>
		</tr>
		<% if(memberList.isEmpty()) { %>
		<tr>
			<td colspan="4">등록된 회원이 없습니다.</td>	
		</tr>
		<% } else { %>
			<% for(MemberDTO member:memberList) { %>
		<tr>
			<td width="10%">
			<input type="hidden" name="num" value="<%=number %>"><%=member.getM_userid()%>
			</td>
			<td width="10%"><%=member.getM_name()%></td>
			<td width="10%"><%=member.getM_tel()%></td>
			<td width="10%"><%=member.getM_email()%></td>
			<td width="25%">[<%=member.getM_zipcode()%>]&nbsp;&nbsp;<%=member.getM_add1() %>&nbsp;&nbsp;<%=member.getM_add2() %></td>
			<td width="10%"><%=member.getM_grade()%></td>
			<td width="10%"><%=member.getM_last_login() %></td>
			<td width="15%">
			<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="modBtn" onclick="location.href='<%=request.getContextPath()%>/admin/member_modify.jsp?m_userid=<%=member.getM_userid()%>'">수정</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="removeBtn" data-whatever="<%=member.getM_userid()%>">탈퇴</button>
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
			        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      <h1 class="form-control-plaintext" id="userid"></h1>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-primary" id="removeBtn2">탈퇴</button>
			      </div>
			    </div>
			  </div>
			</div>
	<br>
	<form action="<%=request.getContextPath()%>/admin/member_manager.jsp" method="post">
	<table>
	<tr>
	<td>
		<div class="d-flex justify-content-end">
			<%-- select 태그에 의해 입력되어 전달되는 값은 비교 컬럼명과 동일하게 설정 --%>
		    <div class="p-2 bd-highlight">
				<select class="custom-select mr-sm-1" name="search" id="search">
				 	 <option value="m_name">이름</option>
				 	 <option value="m_tel">연락처</option>
				 	 <option value="m_grade">등급</option>
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
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/member_manager.jsp?pageNum=1&search=<%=search%>&keyword=<%=keyword%>">처음</a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/member_manager.jsp?pageNum=<%=startblockPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>" tabindex="-1">이전</a>
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
	    	<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/admin/member_manager.jsp?pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>"><%=i%></a></li>
	    	<% } else { %>
	    	<li class="page-item"><a class="page-link"><%=i %></a></li>
    		<% } %>
   		<% } %>
   		
   		<% if(endblockPage!=totalPage) { %>
	    <li class="page-item">
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/member_manager.jsp?pageNum=<%=startblockPage+blockSize%>&search=<%=search%>&keyword=<%=keyword%>">다음</a>
	    </li>
	    <li class="page-item">	    
	      <a class="page-link" href="<%=request.getContextPath()%>/admin/member_manager.jsp?pageNum=<%=totalPage%>&search=<%=search%>&keyword=<%=keyword%>">마지막</a>
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
////
//$("#removeBtn").click(function() {
	
//	$("#removeBtn1").click(function() {
//		var value=$("#m_userid").val();
//		$("#memberForm").attr("method", "post")
//		$("#memberForm").attr("action", "<%=request.getContextPath()%>/admin/member_status_action.jsp?m_userid="+value);
//		$("#memberForm").submit();
		
//	});
//});

$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var m_userid = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-body').text(m_userid + '회원을 탈퇴 처리 하시겠습니까?')
	  $('#removeBtn2').click(function() {
		  location.href="member_status_action.jsp?m_userid="+m_userid
	  })
	})
</script>

