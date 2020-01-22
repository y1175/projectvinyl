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
<link rel="stylesheet" href="css/hs_userheader.css?ver=3" >
<!--header style-->
<style>
  /* .hs_header_nav_a{
   color: rgb(0, 153, 255); 
      background-color:silver;
  } */
</style>
<script>
  /*  $(document).ready(function(){
	   $(".hs_header_nav>a").each(function(){
		 
		  $(this).click(function(event){
			  event.preventDefault();
			    console.log(this);
			  $(this).addClass("hs_header_nav_a") 
		             .siblings().removeClass('hs_header_nav_a');
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
    <div class="hs_header_top">
     <a href="homedream.do" id="hs_header_h1">홈드림</a>
     <a href="homedream.do" class="hs_header_hc" style="color: rgb(0, 153, 255);">커뮤니티</a>
     <a href="hs_storemain.jsp" class="hs_header_hc">스토어</a>
     <div class="hs_header_search">
     <form>
        <label for="hs_mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
        <!-- <input type="text" id="hs_mainsearch" name="hs_mainsearch" placeholder="통합검색"> -->
     </form>
     </div>
     <div class="hs_header_cartlogin">
        <a href=""><i class="fa fa-shopping-cart"></i></a>
        <a href="yilogin.do">로그인</a><span> | </span><a href="yijoin.do">회원가입</a>
     </div>
    </div>
    <div class="hs_header_bottom">
    <div class="hs_header_line"></div>
    <div class="hs_header_cg">
     <nav class="hs_header_nav">
         <a href="homedream.do">홈</a>
         <a href="jy_list.do">집들이 &amp;노하우</a>
         <a href="hm_list.do">전문가찾기</a>
         <a href="hs_questionlist.do">질문과답변</a>
         <a href="hs_community_event_main.jsp">이벤트</a>
     </nav>  
    </div> 
    <div class="hs_header_line"></div> 
    </div>
   </div>
</c:if>
  <c:if test="${sessionScope.userId != null}">
    <div>
    <div class="hs_header_top">
     <a href="homedream.do" id="hs_header_h1">홈드림</a>
     <a href="homedream.do" class="hs_header_hc" style="color: rgb(0, 153, 255);">커뮤니티</a>
     <a href="hs_storemain.jsp" class="hs_header_hc">스토어</a>
     <div class="hs_header_search">
     <form>
        <label for="hs_mainsearch"></label>
        <i class='fas fa-search' style="padding: 5px;"></i>
        <!-- <input type="text" id="hs_mainsearch" name="hs_mainsearch" placeholder="통합검색"> -->
     </form>
     </div>
     <div class="hs_header_cartlogin">
        <a href="yiorderlist.do"><i class="fa fa-shopping-cart"></i></a>
        <a href="yiorderlist.do">마이페이지</a><span> | </span><a href="yilogout.do">로그아웃</a>
     </div>
    </div>
    <div class="hs_header_bottom">
    <div class="hs_header_line"></div>
    <div class="hs_header_cg">
     <nav class="hs_header_nav">
         <a href="">홈</a>
         <a href="jy_list.do">집들이 &amp;노하우</a>
         <a href="hm_list.do">전문가찾기</a>
         <a href="hs_questionlist.do">질문과답변</a>
         <a href="hs_community_event_main.jsp">이벤트</a>
     </nav>  
    </div> 
    <div class="hs_header_line"></div> 
    </div>
    </div>
  </c:if>
</body>
</html>