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
<link rel="stylesheet" href="hm_expert/hm_detail.css">

</head>
<body>

<%
	Hm_ExpertDTO dto = (Hm_ExpertDTO) request.getAttribute("dto");

	int no = dto.getNo();
	String name = dto.getName();
	String addr = dto.getAddr();
	String text = dto.getText();
	String file_name = dto.getFile_name();
	
%>
<div class = "hm_detail">
	<img src="hm_expert/<%=file_name%>" alt="<%=file_name%>" class ="hm_detailimg"/>
	<h2><%=name%></h2>
	<p><br><%=addr%><br></p>
	<p><%=text%><br></p>
</div>




<a href="hm_list.do">목록으로</a>
<a href="hm_modify.do?no<%=no%>">수정</a>















<div id="map" style="width:500px;height:500px;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59dddf1cdbdb52873a5751f3a3c7eea5"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
</body>
</html>