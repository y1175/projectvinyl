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
<link rel="stylesheet" href="css/userheader.css?ver=2" >
<!--header style-->

</head>
<body>
<c:if test="${sessionScope.userId == null}">
  <div>
    <div class="header_top">
     <a href="communitymain.jsp" id="header_h1">홈드림</a>
     <a href="communitymain.jsp" class="header_hc">커뮤니티</a>
     <a href="storemain.jsp" class="header_hc"  style="color: rgb(0, 153, 255);">스토어</a>
     <div class="header_search">
     <form>
        <label for="mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
       <!--  <input type="text" id="mainsearch" name="mainsearch" value="통합검색"> -->
     </form>
     </div>
     <div class="header_cartlogin">
        <a href=""><i class="fa fa-shopping-cart"></i></a>
        <a href="login.do">로그인</a><span> | </span><a href="join.do">회원가입</a>
     </div>
    </div>
   <div class="header_bottom">
    <div class="header_line"></div>
    <div class="header_cg">
     <nav class="header_nav">
         <a href="" style="color: rgb(0, 153, 255);">스토어홈</a>
         <a href="">베스트</a>
         <a href="">기획전</a>
         <a href="">이벤트</a>
     </nav>  
    </div> 
    <div class="header_line"></div> 
    </div>  
  </div>
</c:if>  
<c:if test="${sessionScope.userId != null}">  
   <div>
    <div class="header_top">
     <a href="communitymain.jsp" id="header_h1">홈드림</a>
     <a href="communitymain.jsp" class="header_hc">커뮤니티</a>
     <a href="storemain.jsp" class="header_hc"  style="color: rgb(0, 153, 255);">스토어</a>
     <div class="header_search">
     <form>
        <label for="mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
        <!-- <input type="text" id="mainsearch" name="mainsearch" value="통합검색"> -->
     </form>
     </div>
     <div class="header_cartlogin">
        <a href=""><i class="fa fa-shopping-cart"></i></a>
        <a href="orderlist.do">마이페이지</a><span> | </span><a href="logout.do">로그아웃</a>
     </div>
    </div>
   <div class="header_bottom">
    <div class="header_line"></div>
    <div class="header_cg">
     <nav class="header_nav">
         <a href="" style="color: rgb(0, 153, 255);">스토어홈</a>
         <a href="">베스트</a>
         <a href="">기획전</a>
         <a href="">이벤트</a>
     </nav>  
    </div> 
    <div class="header_line"></div> 
    </div>  
  </div>
</c:if>  
</body>
</html>