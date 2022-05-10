<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="InteriorDAO.ProductDAO"%>
<%@page import="InteriorDTO.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="org.apache.coyote.http11.filters.SavedRequestInputFilter"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    
<%
	//비정상적인 요청에 대한 응답처리 - 에러페이지 이동
	if(request.getParameter("p_no")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	
	String p_kinds=request.getParameter("p_kinds");
	String p_no=request.getParameter("p_no");
	
	ProductDTO product=ProductDAO.getDAO().searchProduct(p_no);
	
	ProductDAO.getDAO().removeProduct(p_no);
	
	String saveDirectory=request.getServletContext().getRealPath("/web/images/"+p_kinds);
	new File(saveDirectory, product.getP_imgsrc()).delete();
	
	response.sendRedirect("product_manager.jsp");  
	
%>
