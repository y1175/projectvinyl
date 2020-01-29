<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Crimson+Text&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel ="stylesheet" href="css/hm_detail.css?ver=2">
<style>
@font-face{
   font-family: '10X10';
   src: url("http://localhost:9080/projectvinyl/font/10X10_1.woff");
   
}
</style>
</head>
<body>

       
   
<%
	Hm_ExpertDTO dto = (Hm_ExpertDTO) request.getAttribute("dto");

	int no = dto.getNo();
	String name = dto.getName();
	String addr = dto.getAddr();
	String text = dto.getText();
	String file_name = dto.getFile_name();
	String place = dto.getPlace();
	
%>
<div class ="hm_detailfirst">
 <h1>Portfolio</h1>
 <h6><%=name%></h6>
</div>
<div class="hm_wrap">
<div class="hm_tile"> 
  <img src='https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-projects-1551691351461_KSJaX2DIMz.jpg/1440/none'/>
  <div class="hm_text">
  <h1>Design Square.</h1>
  <h2 class="hm_animate-text">Modern, Minimal&Simple , Single Life</h2>
  <p class="hm_animate-text">아늑한 홈카페 주방이 있는 송파구 신축빌라 인테리어 </p>
<div class="hm_dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>


<div class="hm_tile"> 
  <img src='https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-projects-1538441953717_If6.jpg/1440/none'/>
  <div class="hm_text">
  <h1>Design Square.</h1>
  <h2 class="hm_animate-text">Modern, Minimal&Simple, Classic&Antique.</h2>
  <p class="hm_animate-text">분당 서현 스터디카페 30평대 인테리어완공 디자인스퀘어</p>
<div class="hm_dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>
  
  <div class="hm_tile"> 
  <img src='https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-projects-156473740347981076.jpg/1440/none'/>
  <div class="hm_text">
  <h1>Design Square.</h1>
  <h2 class="hm_animate-text">Modern, Minimal&Simple, Classic&Antique.</h2>
  <p class="hm_animate-text">딥블루와 골드의 조화로움, 서초 더샵오데움 60PY</p>
<div class="hm_dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>
</div>
  
 
<div class = "hm_detailtwice">
	 <h3>찾아오시는 길</h3>
	 </div>
	 
	 
	 <div style=" width:100%;   display: inline-block;">
	 
	 <div id="hm_map" style ="width:500px; height:500px;  position: relative;  margin:50px 0px 100px 0px; float: left;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59dddf1cdbdb52873a5751f3a3c7eea5"></script>
	<script>
		var mapContainer = document.getElementById('hm_map'), // 지도를 표시할 div 
		    mapOption = {
			center : new kakao.maps.LatLng(<%=dto.getFlat()%>,<%=dto.getFlon()%>), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(<%=dto.getFlat()%>,<%=dto.getFlon()%>), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
	</script>
	

	
	<div class="card" style="width: 18rem; position: relative; float: right; margin : 50px 100px 0px;">
  <img src="img/hmdetail.JPG" class="card-img-top" alt="hm_detail.JPG"	>
  <div class="card-body">
    <h5 class="card-title" style ="font-weight : bolder;"><%=place%> 지점</h5>
    <p class="card-text" ><%=addr%></p>
    <a href="http://localhost:8080/projectvinyl/hs_questionlist.do" class="btn btn-primary"
    style ="margin : 0px 0px 0px 40px; ">지금바로 문의하기</a>
  </div>
  </div>

  
  
  
</div>
	
	
	
	

	
	
	<a href="hm_list.do">
<button type="button" class="btn btn-outline-info" 
style ="margin:0px 100px 50px 0px; float:right;   font-family: '10X10';"
>리스트보기</button></a>	
	
	
<!--Start of Tawk.to Script-->
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/5dfae15243be710e1d22bb34/default';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
	</script>
	<!--End of Tawk.to Script-->
	
	

</body>
</html>