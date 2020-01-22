<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
<!--header style-->
<link rel="stylesheet" href="css/userheader.css?ver=3" >
<!--header style-->
<style>
  /* .header_nav_a{
   color: rgb(0, 153, 255); 
      background-color:silver;
  } */
</style>
<script>
  /*  $(document).ready(function(){
	   $(".header_nav>a").each(function(){
		 
		  $(this).click(function(event){
			  event.preventDefault();
			    console.log(this);
			  $(this).addClass("header_nav_a") 
		             .siblings().removeClass('header_nav_a');
			   let v=$(this).prop('href');
			   location.href=v;
		  });
	
	   });
   }); */
</script>
</head>
<body>
<c:if test="${sessionScope.userId == null}">
  <div>
    <div class="header_top">
     <a href="communitymain.jsp" id="header_h1">홈드림</a>
     <a href="communitymain.jsp" class="header_hc" style="color: rgb(0, 153, 255);">커뮤니티</a>
     <a href="storemain.jsp" class="header_hc">스토어</a>
     <div class="header_search">
     <form>
        <label for="mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
        <!-- <input type="text" id="mainsearch" name="mainsearch" placeholder="통합검색"> -->
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
         <a href="">홈</a>
         <a href="list.do">집들이 &amp;노하우</a>
         <a href="list.do">전문가찾기</a>
         <a href="questionlist.do">질문과답변</a>
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
     <a href="homedream.do" id="header_h1">홈드림</a>
     <a href="homedream.do" class="header_hc" style="color: rgb(0, 153, 255);">커뮤니티</a>
     <a href="storemain.jsp" class="header_hc">스토어</a>
     <div class="header_search">
     <form>
        <label for="mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
        <!-- <input type="text" id="mainsearch" name="mainsearch" placeholder="통합검색"> -->
     </form>
     </div>
     <div class="header_cartlogin">
        <a href="orderlist.do"><i class="fa fa-shopping-cart"></i></a>
        <a href="orderlist.do">마이페이지</a><span> | </span><a href="logout.do">로그아웃</a>
     </div>
    </div>
    <div class="header_bottom">
    <div class="header_line"></div>
    <div class="header_cg">
     <nav class="header_nav">
         <a href="">홈</a>
         <a href="list.do">집들이 &amp;노하우</a>
         <a href="list.do">전문가찾기</a>
         <a href="questionlist.do">질문과답변</a>
         <a href="">이벤트</a>
     </nav>  
    </div> 
    <div class="header_line"></div> 
    </div>
    </div>
  </c:if>
</body>
</html>