<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
<!--header style-->
<link rel="stylesheet" href="css/hs_userheader.css" >
<!--header style-->

</head>
<body>
  <div>
    <div class="hs_header_top">
     <a href="hs_communitymain.jsp" id="hs_header_h1">홈드림</a>
     <a href="hs_communitymain.jsp" class="hs_header_hc" style="color: rgb(0, 153, 255);">커뮤니티</a>
     <a href="hs_storemain.jsp" class="hs_header_hc">스토어</a>
     <div class="hs_header_search">
     <form>
        <label for="hs_mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
        <input type="text" id="hs_mainsearch" name="hs_mainsearch" value="통합검색">
     </form>
     </div>
     <div class="hs_header_cartlogin">
        <a href=""><i class="fa fa-shopping-cart"></i></a>
        <a href="">로그인</a><span> | </span><a href="">회원가입</a>
     </div>
    </div>
    <div class="hs_header_bottom">
    <div class="hs_header_line"></div>
    <div class="hs_header_cg">
     <nav class="hs_header_nav">
         <a href="" style="color: rgb(0, 153, 255);">홈</a>
         <a href="">집들이&노하우</a>
         <a href="hm_list.do">전문가찾기</a>
         <a href="">질문과답변</a>
         <a href="">이벤트</a>
     </nav>  
    </div> 
    <div class="hs_header_line"></div> 
    </div>
  </div>
</body>
</html>