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
<link rel="stylesheet" href="hm_expert/hm_detail.css?ver=1">
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
<link rel ="stylesheet" href="css/hm_detail.css">

</head>
<body>
<div class="container">
     <header>
         <jsp:include page="/hs_communityheader.jsp"></jsp:include>
     </header>
     
     
     
        
   
<%
	Hm_ExpertDTO dto = (Hm_ExpertDTO) request.getAttribute("dto");

	int no = dto.getNo();
	String name = dto.getName();
	String addr = dto.getAddr();
	String text = dto.getText();
	String file_name = dto.getFile_name();
	String place = dto.getPlace();
	
%>
<div class="hm_wrap">
<div class="hm_tile"> 
  <img src='https://images.unsplash.com/photo-1464054313797-e27fb58e90a9?dpr=1&auto=format&crop=entropy&fit=crop&w=1500&h=996&q=80'/>
  <div class="hm_text">
  <h1>Design Square.</h1>
  <h2 class="hm_animate-text">More lorem ipsum bacon ipsum.</h2>
  <p class="hm_animate-text">Bacon ipsum dolor amet pork belly tri-tip turducken, pancetta bresaola pork chicken meatloaf. Flank sirloin strip steak prosciutto kevin turducken. </p>
<div class="hm_dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>


<div class="hm_tile"> 
  <img src='https://images.unsplash.com/photo-1458668383970-8ddd3927deed?dpr=1&auto=format&crop=entropy&fit=crop&w=1500&h=1004&q=80'/>
  <div class="hm_text">
  <h1>Lorem ipsum.</h1>
  <h2 class="hm_animate-text">More lorem ipsum bacon ipsum.</h2>
  <p class="hm_animate-text">Bacon ipsum dolor amet pork belly tri-tip turducken, pancetta bresaola pork chicken meatloaf. Flank sirloin strip steak prosciutto kevin turducken. </p>
<div class="hm_dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>
  
  <div class="hm_tile"> 
  <img src='https://images.unsplash.com/photo-1422393462206-207b0fbd8d6b?dpr=1&auto=format&crop=entropy&fit=crop&w=1500&h=1000&q=80'/>
  <div class="hm_text">
  <h1>Lorem ipsum.</h1>
  <h2 class="hm_animate-text">More lorem ipsum bacon ipsum.</h2>
  <p class="hm_animate-text">Bacon ipsum dolor amet pork belly tri-tip turducken, pancetta bresaola pork chicken meatloaf. Flank sirloin strip steak prosciutto kevin turducken. </p>
<div class="hm_dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>
</div>
  
  




<%-- 
 
<div id="carouselExampleIndicators" class="carousel slide" 
data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" >
    <div class="carousel-item active">
      <img src="upload/<%=file_name%>" class="d-block w-100" alt="<%=file_name%>">
    </div>
    <div class="carousel-item">
      <img src="upload/<%=file_name%>" class="d-block w-100" alt="<%=file_name%>">
    </div>
    <div class="carousel-item">
      <img src="upload/<%=file_name%>" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>



<div class ="hm_managerdetail" style ="border : 1px solid silver; width : 86%; border-radius :30px; padding:20px; margin: 30px auto 0px;">
<h2><%=name%></h2>
<blockquote class="blockquote">
<p class="mb-0"><%=text%></p>
</blockquote>
</div>



<div class="card" style=" width: 17em; float:right; right:7%; margin-top : 7%;">
  <img src="img/hm_detail.JPG" class="card-img-top" alt="상담">
  <div class="card-body">
    <h5 class="card-title"><%=place%>지점</h5>
    <p class="card-text"><%=addr%></p>
    <a href="#" class="btn btn-primary" style="margin-left :17%;">지금바로 문의하기</a>
  </div>
</div>




<div id="hm_map" style ="width:500px; height:500px; position: relative; left:7%; margin:100px 0px 0px 0px;"></div>
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

	


<a href="hm_list.do">
<button type="button" class="btn btn-outline-info" 
style ="margin:50px 80px 50px 0px; float:right;"
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

	 --%>
	 <div id="hm_map" style ="width:500px; height:500px; position: relative; left:7%; margin:100px 0px 0px 0px;"></div>
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
	
	
	
	
	
	
   <footer>
         <jsp:include page="/hs_user_footer.jsp"></jsp:include>
   </footer>

</div>
</body>
</html>