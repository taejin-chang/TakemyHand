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
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}	

	String kinds=request.getParameter("kinds");
	String saveDirectory=request.getServletContext().getRealPath("/web/images/"+kinds);
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	String num = mr.getParameter("num");
	String name = mr.getParameter("name");
	String image = mr.getParameter("image");
	String newimage = mr.getFilesystemName("newimage");
	int amount = Integer.parseInt(mr.getParameter("amount"));
	int price = Integer.parseInt(mr.getParameter("price"));
	
	ProductDTO product=new ProductDTO();
	product.setP_kinds(kinds);
	product.setP_no(num);
	product.setP_name(name);
	if(newimage!=null) {
		product.setP_imgsrc(newimage);
		new File(saveDirectory, image).delete();
	} else {
		product.setP_imgsrc(image);
	}
	product.setP_amount(amount);
	product.setP_price(price);
	
	ProductDAO.getDAO().updateProduct(product);
	
	response.sendRedirect("product_detail.jsp?p_no="+product.getP_no());  
	
%>

