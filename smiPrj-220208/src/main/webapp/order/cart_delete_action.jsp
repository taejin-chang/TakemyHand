<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int row=0;	
	int rows=0;
	//int c_no = Integer.parseInt(request.getParameter("cartnum"));
	//int row = CartDAO.getDAO().deleteCart(c_no);
	
	if(request.getParameterValues("checkRow")!=null){
		
		String[] c_no = request.getParameterValues("checkRow");
		
		int[] c_noList = new int[c_no.length];
		for(int i=0; i<c_no.length; i++) {
			c_noList[i] = Integer.parseInt(c_no[i]);
        }
		
		
		for(int cartno:c_noList) {
			row = CartDAO.getDAO().deleteCart(cartno);
		}
	}
	
	if(request.getParameter("checkAll")!=null){
		rows = CartDAO.getDAO().deleteAllCart();
	}
	
	if(row==1){%>
		<script type="text/javascript">
			alert("해당 물품 삭제가 완료되었습니다");
			location.href="basket.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
		alert("해당 물품 삭제가 실패하였습니다.");
		location.href="basket.jsp";
		</script>
<%}%>

<%
	if(rows==1){%>
		<script type="text/javascript">
		alert("전체 삭제가 완료되었습니다");
		location.href="basket.jsp";
		</script>
	
	<%}else{%>
		<script type="text/javascript">
		alert("해당 물품 전체삭제가 실패하였습니다");
		location.href="basket.jsp";
		</script>
	
<%}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>