<%@page import="InteriorDTO.MemberDTO"%>
<%@page import="InteriorDAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	String m_name=request.getParameter("m_name");
	String m_email=request.getParameter("m_email");
	String m_tel=request.getParameter("m_tel");
	
	
	if(m_name==null) {m_name="";}
	if(m_email==null) {m_email="";}
	if(m_tel==null) {m_tel="";}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
#search {
    display: flex;
    align-items: center;
	width: 500px;
	height: 400px;
	margin: 0 auto;
	text-align: center;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: 10px;
	font-size: 14px;
}


td { 
	border: 1px solid black; 
}

.zipcode { 
	width: 100px; 
}

.address {
	width: 400px;
	text-align: left;
	padding-left: 2px;
}
</style>
</head>
<body>
	<div id="search" >
		<form name="postForm" method="post">
			<% if(m_email.equals("")) { 
				MemberDTO memberT = MemberDAO.getDAO().memberSelect(m_name, m_tel); %>
				아이디는 [ <input type="text" name="id" value="<%=memberT.getM_userid()%>" readonly> ] 입니다.
			<% } else { 
				MemberDTO memberE = MemberDAO.getDAO().memberSelect(m_name, m_email); %>
				아이디는 [ <input type="text" name="id" value="<%=memberE.getM_userid()%>" readonly> ] 입니다.
			<% } %>
		</form>
	</div>	
	
</body>
</html>