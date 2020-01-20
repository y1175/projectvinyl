<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.hm_expertmain {
	background-color: white;
	border: 1px solid black;
	border-radius: 20px;
	width: 65%;
	height: 300px;
	margin: 40px auto 20px;
}

.hm_expertmain img {
	display: inline-block;
	float: left;
	width: 85%;
	height: 300px;
}

.hm_expertmain_1 {
	display: inline-block;
	float: left;
	width: 30%;
	height: 300px;
	margin: 30px 0px;
}

.hm_expertmain_1 p {
	margin: 30px 0px;
} 



.hm_btn {
	margin: 40 40px 0px;
	display: block;
	width: 100px;
	height: 50px;
	text-decoration: none;
	text-align: center;
	line-height: 50px;
	background-color: coral;
	color: #fff;
	border-radius: 50px;
}
/* 
.modal a {
	color: grey;
	text-decoration: none;
} */
</style>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<!-- <script>
	$(document).ready(function(){
		$('a[href="#ex7"]').click(function(event) {
			event.preventDefault();

			$(this).modal({
				fadeDuration : 250
			});
		});
		
	});
	
</script> -->



</head>
<body>
   <div class="container">
     <header>
         <jsp:include page="/hs_communityheader.jsp"></jsp:include>
     </header>
	<form method="post" action="hm_list.do">
		<select class="form-control" id="hmcity" name="hmcity">
			<!-- select name값을 넘겨서 검색처리하기 -->
			<option value="">선택하세요</option>
			<option value="강남">서울특별시 강남구</option>
			<option value="동작">서울특별시 동작구</option>
			<option value="강북">서울특별시 강북구</option>
			<option value="강서">서울특별시 강서구</option>
			<option value="관악">서울특별시 관악구</option>
			<option value="광진">서울특별시 광진구</option>
			<option value="구로">서울특별시 구로구</option>
			<option value="금천">서울특별시 금천시</option>
			<option value="노원">서울특별시 노원구</option>
			<option value="도봉">서울특별시 도봉구</option>
			<option value="동대문">서울특별시 동대문구</option>
			<option value="동작">서울특별시 동작구</option>
			<option value="마포">서울특별시 마포구</option>
			<option value="서대문">서울특별시 서대문구</option>
			<option value="서초">서울특별시 서초구</option>
			<option value="성동">서울특별시 성동구</option>
			<option value="성북">서울특별시 성북구</option>
			<option value="송파구">서울특별시 송파구</option>
			<option value="양천구">서울특별시 양천구</option>
			<option value="영등포">서울특별시 영등포구</option>
			<option value="용산">서울특별시 용산구</option>
		</select> <input type="submit" value="검색" id="hm_search">
	</form>



	<c:set var="totalcount" value="${requestScope.totalcount}"></c:set>
	<div>
		전체결과 :
		<c:out value="${totalcount}" />
	</div>


	<%
		List<Hm_ExpertDTO> list = (List<Hm_ExpertDTO>) request.getAttribute("list");

		for (Hm_ExpertDTO dto : list) {

			String loc = dto.getLoc();
			String file_name = dto.getFile_name();
			String name = dto.getName();
			Float lat = dto.getFlat();//위도
			Float lon = dto.getFlon();//경도
			String text = dto.getText();
			int no = dto.getNo();
	%>
	
	
	<div class="hm_expertmain">
		<div class="hm_expertmain_1">
			<img src="hm_expert/<%=loc%>" alt="<%=file_name%>" />
		</div>

		<div class="hm_expertmain_1">
			<p>
				<%=name%>
			</p>
		</div>

		<div class="hm_expertmain_1">
			<p>
				<%=text%>
			</p>
			<p>
				<a href="hm_detail.do?no=<%=dto.getNo()%>" class="hm_btn">지도보기</a>
			</p>
		</div>
	</div> 
   

<%-- 
rel="modal:open"
	<div id="ex1" class="modal" style="width: 500px; height: 500px;">
	<div id="map" style="width:450px;height:470px;"></div> </div>
	 
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59dddf1cdbdb52873a5751f3a3c7eea5"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
			center : new kakao.maps.LatLng(<%=lat%>,<%=lon%>), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(<%=lat%>,<%=lon%>), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		
	
	</script> --%>



	<%
		}
	%>

	<%
		int currpage = (Integer) request.getAttribute("currpage");
		int startblock = (Integer) request.getAttribute("startblock");
		int endblock = (Integer) request.getAttribute("endblock");
		int totalpage = (Integer) request.getAttribute("totalpage");
		String hmcity = request.getParameter("hmcity");

		if (startblock > 1) {
	%>
	<a href="hm_list.do?curr=<%=currpage - 1%>&hmcity=<%=hmcity%>">이전</a>
	<%
		//currpage -> startblock-1 = 블럭단위로 넘어감	
		}
	%>

	<%
		for (int i = startblock; i <= endblock; i++) {
			if (currpage == i) {
	%>
	<%=i%>
	<%
		} else {
	%>
	<a href="hm_list.do?curr=<%=i%>&hmcity=<%=hmcity%>"><%=i%></a>
	<%
		}
	%>
	<%
		}
	%>
	<%
		if (endblock < totalpage) {
	%>
	<a href="hm_list.do?curr=<%=currpage + 1%>&hmcity=<%=hmcity%>">다음</a>
	<%
		//endblock+1로 할수도있음 -> block단위로 다음
		}
	%>

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