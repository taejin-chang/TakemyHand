<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String workgroup=request.getParameter("workgroup");
	if(workgroup==null) workgroup="admin";
	
	String work=request.getParameter("work");
	if(work==null) work="admin";
	
	String contentPath=workgroup+"/"+work+".jsp";
	
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<script>
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css"/><link rel="canonical" href="join.html" />
<meta property="og:url" content="http://ecudemo200642.cafe24.com/member/join.html" />
<meta property="og:site_name" content="쇼핑몰 이름" />
<meta property="og:type" content="website" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/web/upload/favicon-771e4dd9e45d4f5375090b96325dc204.ico" />
<meta http-equiv="ImageToolbar" content="No">
<script type="text/javascript" src="http://ecudemo200642.cafe24.com/app/Eclog/js/cid.generate.js?vs=44aabe5641b246c44b7baa4bf7ee858c"></script>

<html>
<head>

<title>관리자 정보 - 관리자페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Custom fonts for this template-->
<link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	color: #606060;
}
body {
	margin-left: 0px;
	margin-top: 0px;
}
-->
</style>
</head>

<div id="wrap" align="center">
                <h2 class="xans-element- xans-layout xans-layout-logotop "><a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/web/upload/logo/logo2.png" alt="쇼핑몰 이름"/></a>
</h2>
</div>
<body id="page-top">
<!-- Sidebar -->
    <div id="wrapper">
        <ul class="navbar-nav bg-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/admin/admin.jsp">
                <div class="sidebar-brand-text mx-3">내손을JAVA<br>관리자페이지</br></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>HOME</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/member/logout_action.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Logout</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                관리페이지
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/product_manager.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상품 관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/member_manager.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>회원 관리</span>
                </a>
            </li>            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/orders_manager.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>주문 관리</span>
                </a>
            </li>            <li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/notice_manager.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>공지사항 관리</span>
                </a>
            </li>			<li class="nav-item">
                <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin/qna_manager.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Q&A 관리</span>
                </a>
            </li>
            <!--  Nav Item - Charts
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>
            -->

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->
        
			
<!-- Bootstrap core JavaScript-->
<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="bootstrap/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="bootstrap/js/demo/chart-area-demo.js"></script>
<script src="bootstrap/js/demo/chart-pie-demo.js"></script>