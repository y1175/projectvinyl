<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--header style-->
<link rel="stylesheet" href="css/adminheader.css" >
<!--header style-->

</head>
<body>
  <div class="header_store_header">
    <div class="header_top">
     <a href="list.do" id="header_h1">홈드림</a>
     <a href="list.do" class="header_hc">회원관리</a>
     <a href="itemlist.do" class="header_hc" style="color: rgb(0, 153, 255);">스토어관리</a>
     <a href="managerlist.do" class="header_hc">커뮤니티관리</a>
     <a href="logout.do"  class="header_hc">로그아웃</a>
     <b class="header_admin">관리자모드</b>    
    </div>
    <div class="header_bottom">
    <div class="header_line"></div>
    <div class="header_cg">
     <nav class="header_nav">
         <a href="itemlist.do" style="color: rgb(0, 153, 255);">상품관리</a>
         <a href="">주문관리</a>
     </nav>  
    </div> 
    <div class="header_line"></div> 
    </div>
  </div>  
</body>
</html>