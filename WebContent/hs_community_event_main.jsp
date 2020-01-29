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
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<style>

@font-face{
   font-family: '10X10';
   src: url("http://localhost:9080/projectvinyl/font/10X10_1.woff");
   
}
body{
    margin: 0px auto;
    font-family:"10X10";
}

/* header nav 홈 글씨색상  */
  .hs_header_nav > a:nth-child(5){
    color: rgb(0, 153, 255);
  }

.hs_event_thumbnail {
   width: 100%;
   text-align: center;
}  
.hs_event_b{
    width: 100%;
    height : 280px;
    margin-bottom: 10px;
    border-radius: 10px;
}
.hs_event_thumbnail p{
    margin-bottom: 60px;
}
.hs_event_ing {
    padding-left: 10px;
    font-size: 16px;
    font-weight : 700;
    color: rgb(0, 153, 255);
    float: left;
}
.hs_event_end{
    padding-left: 10px;
    font-size: 16px;
    font-weight : 700;
    color: #757575;
    float: left;
}
.hs_event_ingd {
    padding-left: 10px;
    float: right;
    font-size: 13px; 
}
</style>


</head>
<body>
  <div class="container">
     <header>
         <jsp:include page="hs_communityheader.jsp"></jsp:include>
     </header>

      <!-- event 1 -->
       
     <div class="hs_event_thumbnail">
        <a>
           <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/contests/mobile_banner/157780364282424835.png?gif=1&w=640" class="hs_event_b" alt="할인">
        </a>
        <p><span class="hs_event_ing">진행중</span><span class="hs_event_ingd">20/01/20 ~ 20/01/30</span></p>
     </div>
    
     <!-- event 2 -->
     <div class="hs_event_thumbnail">
        <a>
           <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/contests/mobile_banner/157899900847440153.png?gif=1&w=640" class="hs_event_b" alt="사진">
        </a>
         <p><span class="hs_event_ing">진행중</span><span class="hs_event_ingd">20/01/01 ~ 20/02/08</span></p>
     </div>
    
     <!-- event 3 -->
     <div class="hs_event_thumbnail">
        <a>
           <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/contests/mobile_banner/157778445910712234.png?gif=1&w=640" class="hs_event_b" alt="댓글이벤트">
        </a>
         <p><span class="hs_event_ing">진행중</span><span class="hs_event_ingd">20/01/01 ~ 20/01/31</span></p>
     </div>
    
     <!-- event 4 -->
     <div class="hs_event_thumbnail">
        <a>
           <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/contests/mobile_banner/157735174800004003.png?gif=1&w=640" class="hs_event_b" alt="사진2">
        </a>
         <p><span class="hs_event_end">종료</span><span class="hs_event_ingd">20/01/01 ~ 20/01/01</span></p>
     </div>
     
     <div class="hs_event_thumbnail">
     <!-- event 5 -->
     <div class="hs_event_thumbnail">
        <a>
           <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/contests/mobile_banner/157710708686936310.png?gif=1&w=640" class="hs_event_b" alt="책">
        </a>
         <p><span class="hs_event_end">종료</span><span class="hs_event_ingd">20/01/01 ~ 20/01/07</span></p>
     </div>
    
     <!-- event 6 -->
     <div class="hs_event_thumbnail">
        <a>
           <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/contests/mobile_banner/157915533688124688.png?gif=1&w=640" class="hs_event_b" alt="사진3">
        </a>
         <p><span class="hs_event_end">종료</span><span class="hs_event_ingd">20/01/01 ~ 20/01/20</span></p>  
     </div>
  
     <footer>
         <jsp:include page="hs_user_footer.jsp"></jsp:include>
     </footer>
  </div>
</div>  
</body>
</html>