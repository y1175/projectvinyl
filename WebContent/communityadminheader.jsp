<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--header style-->
<link rel="stylesheet" href="css/adminheader.css?ver=1" >
<!--header style-->

</head>
<body>
  <div>
    <div class="header_top">
     <a href="memberadminmain.jsp" id="header_h1">홈드림</a>
     <a href="memberadminmain.jsp" class="header_hc">회원관리</a>
     <a href="storeadminmain.jsp" class="header_hc">스토어관리</a>
     <a href="communityadminmain.jsp" class="header_hc" style="color: rgb(0, 153, 255);">커뮤니티관리</a>
     <a href="logout.do"  class="header_hc">로그아웃</a>
     <b class="header_admin">관리자모드</b>    
    </div>
    <div class="header_bottom">
    <div class="header_line"></div>
    <div class="header_cg">
     <nav class="header_nav">
         <a href="managerlist.do">업체관리</a>
         <a href="adminboard.do">집들이 &amp;노하우관리</a>
         <a href="qnaadmin.do">질문과답변관리</a>
         <a href="">이벤트관리</a>
     </nav>  
    </div> 
    <div class="header_line"></div> 
    </div>
  </div>  
</body>
</html>