<%@page import="InteriorDTO.BookshelfDTO"%>
<%@page import="InteriorDAO.FurnitureDAO"%>
<%@page import="InteriorDTO.FurnitureDTO"%>
<%@page import="InteriorDAO.BookshelfDAO"%>
<%@page import="InteriorDAO.DrawerDAO"%>
<%@page import="InteriorDTO.DrawerDTO"%>
<%@page import="InteriorDAO.PtlightDAO"%>
<%@page import="InteriorDTO.PtlightDTO"%>
<%@page import="InteriorDAO.LightDAO"%>
<%@page import="InteriorDTO.LightDTO"%>
<%@page import="InteriorDAO.HomegalleryDAO"%>
<%@page import="InteriorDTO.HomegalleryDTO"%>
<%@page import="InteriorDAO.DecoDAO"%>
<%@page import="InteriorDTO.DecoDTO"%>
<%@page import="InteriorDAO.DlyDAO"%>
<%@page import="InteriorDTO.DlyDTO"%>
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
	
	ProductDTO productList=ProductDAO.getDAO().searchProduct(num);
	if(productList!=(null)) {
		session.setAttribute("num", num);
		session.setAttribute("message", "이미 사용중인 상품번호 입니다.");
		response.sendRedirect("product_add.jsp");  
		return;
	}
	
	String name = mr.getParameter("name");
	String image = mr.getFilesystemName("image");
	int amount = Integer.parseInt(mr.getParameter("amount"));
	int price = Integer.parseInt(mr.getParameter("price"));
	int row=0;
	
	
	if(kinds.equals("100_homedeco/110_DLY")) {
		DlyDTO dly=new DlyDTO();
		dly.setP_kinds(kinds);
		dly.setP_no(num);
		dly.setP_name(name);
		dly.setP_imgsrc(image);
		dly.setP_amount(amount);
		dly.setP_price(price);
		
		row=DlyDAO.getDAO().insertDly(dly);

	} else if(kinds.equals("100_homedeco/120_interior")) {
		DecoDTO deco=new DecoDTO();
		deco.setP_kinds(kinds);
		deco.setP_no(num);
		deco.setP_name(name);
		deco.setP_imgsrc(image);
		deco.setP_amount(amount);
		deco.setP_price(price);
		
		row=DecoDAO.getDAO().insertDeco(deco);
	} else if(kinds.equals("100_homedeco/130_Homegallery")) {
		HomegalleryDTO hg=new HomegalleryDTO();
		hg.setP_kinds(kinds);
		hg.setP_no(num);
		hg.setP_name(name);
		hg.setP_imgsrc(image);
		hg.setP_amount(amount);
		hg.setP_price(price);
		
		row=HomegalleryDAO.getDAO().insertHomegallery(hg);
	} else if(kinds.equals("200_light/210_light")) {
		LightDTO light=new LightDTO();
		light.setP_kinds(kinds);
		light.setP_no(num);
		light.setP_name(name);
		light.setP_imgsrc(image);
		light.setP_amount(amount);
		light.setP_price(price);
		
		row=LightDAO.getDAO().insertDly(light);
		
		System.out.println(row);
	} else if(kinds.equals("200_light/220_ptlight")) {
		PtlightDTO pt=new PtlightDTO();
		pt.setP_kinds(kinds);
		pt.setP_no(num);
		pt.setP_name(name);
		pt.setP_imgsrc(image);
		pt.setP_amount(amount);
		pt.setP_price(price);
		
		row=PtlightDAO.getDAO().insertDly(pt);
	} else if(kinds.equals("300_organize/310_bookshelf")) {
		BookshelfDTO bookshelf=new BookshelfDTO();
		bookshelf.setP_kinds(kinds);
		bookshelf.setP_no(num);
		bookshelf.setP_name(name);
		bookshelf.setP_imgsrc(image);
		bookshelf.setP_amount(amount);
		bookshelf.setP_price(price);
		
		row=BookshelfDAO.getDAO().insertBookshelf(bookshelf);
	} else if(kinds.equals("300_organize/320_drawer")) {
		DrawerDTO drawer=new DrawerDTO();
		drawer.setP_kinds(kinds);
		drawer.setP_no(num);
		drawer.setP_name(name);
		drawer.setP_imgsrc(image);
		drawer.setP_amount(amount);
		drawer.setP_price(price);
		
		row=DrawerDAO.getDAO().insertDrawer(drawer);
		
	} else if(kinds.equals("400_furniture")) {
		FurnitureDTO furn=new FurnitureDTO();
		furn.setP_kinds(kinds);
		furn.setP_no(num);
		furn.setP_name(name);
		furn.setP_imgsrc(image);
		furn.setP_amount(amount);
		furn.setP_price(price);
		
		row=FurnitureDAO.getDAO().insertFurniture(furn);
	} 
	
	if(row<=0) {
		new File(saveDirectory, image).delete();
	}
	if(row>0) {
		session.removeAttribute("message");
	}
	response.sendRedirect("product_manager.jsp");  

	
%>

