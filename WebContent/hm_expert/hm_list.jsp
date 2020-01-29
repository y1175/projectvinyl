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
<link rel="stylesheet" href="css/hm_list.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
/* header nav 전문가찾기 글씨색상  */
  .hs_header_nav > a:nth-child(3){
    color: rgb(0, 153, 255);
  }
</style>
</head>


<body>
     <c:set var="totalcount" value="${requestScope.totalcount}"></c:set>
	
     <h1 class="hm_h1">
     <c:out value="${totalcount}" /> 전문가 in 대한민국 서울
     </h1>
	<form method="post" action="hm_list.do">
		<select class="form-control" id="hmcity" name="hmcity">
			<!-- select name값을 넘겨서 검색처리하기 -->
			<option value ="">선택하세요</option> 
			<!-- 전체부분 데이터 페이징처리하기 -->
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
		</select> <input type="submit" value="검색" class="hm_search">
	</form>


	<%
		List<Hm_ExpertDTO> list = (List<Hm_ExpertDTO>) request.getAttribute("list");

		for (Hm_ExpertDTO dto : list) {

			String addr = dto.getAddr();
			String file_name = dto.getFile_name();
			String name = dto.getName();
			Float lat = dto.getFlat();//위도
			Float lon = dto.getFlon();//경도
			String text = dto.getText();
			int no = dto.getNo();
	%>
	
	

	
	    <p style="text-align: center;">
			<img src="upload/<%=file_name%>" alt="<%=file_name%>" class ="hm_img"/>
		</p>
	<div class="hm_expertmain">
		

		<div class="hm_expertmain_1">
			<h2>
				<%=name%>
				</h2>
		</div>

		<div class="hm_expertmain_1">
			<p>
				<%=text%>
			</p>
			<p>
					<a href="hm_detail.do?no=<%=dto.getNo()%>">
					<button type="button" class="btn btn-outline-info" 
					style ="margin: 15px 40px 0px 0px; font-weight:bolder;    font-family: '10X10'; ">상세보기</button></a>	
			</p>
		</div>
	</div> 
   

	<%
		}
	%>
	
	<!-- for문 닫음 -->
	
	
	
	<!-- 페이지네이션 하기 -->
 <%
      int currpage = (Integer) request.getAttribute("currpage");
      int startblock = (Integer) request.getAttribute("startblock");
      int endblock = (Integer) request.getAttribute("endblock");
      int totalpage = (Integer) request.getAttribute("totalpage");
      String hmcity = request.getParameter("hmcity");

      %>
      
    <nav aria-label="Page navigation example">
  <ul class="pagination" style ="padding-left :40%;">
      
      <% 
      if (startblock > 1) {
    	  if(hmcity==null||hmcity.equals(""))
    		  
    	  {
    	%>

    	 <li class="page-item">
    	 <a class="page-link" href="hm_list.do?curr=<%=currpage - 1%>" >이전</a>
    	 </li> 
    	  <% 
    	  }else{
    	  
   %>
  <li class="page-item">
   <a  class="page-link" href="hm_list.do?curr=<%=currpage - 1%>&hmcity=<%=hmcity%>" >이전</a>
   </li>
   <%
    	  }//currpage -> startblock-1 = 블럭단위로 넘어감   
      }
   %>
   
   <%
   
      for (int i = startblock; i <= endblock; i++) {
         if (currpage == i) {
   %>
   <li class="page-item">
     <a  class="page-link">
   <%=i%>
     </a>
   </li>
   <%

      } else if(hmcity==null||hmcity.equals("")){
   %>
  <li class="page-item">
   <a class="page-link" href="hm_list.do?curr=<%=i%>"><%=i%></a>
   </li>
   <% 
      }else{
   %>
  <li class="page-item">
   <a class="page-link" href="hm_list.do?curr=<%=i%>&hmcity=<%=hmcity%>"><%=i%></a>
   </li>
   <%
      }
   %>
   <%
      }
   %>
   <%
      if (endblock < totalpage) {
    	  if(hmcity==null||hmcity.equals("")){
    		  %>
    		  <li class="page-item">
    		  <a  class="page-link" href="hm_list.do?curr=<%=currpage + 1%>">다음</a>
    		  </li>
    		  <% 
    	  }else{
   %>
   <li class="page-item">
   <a class="page-link" href="hm_list.do?curr=<%=currpage + 1%>&hmcity=<%=hmcity%>">다음</a>
   </li>
   <%
    	  }
      //endblock+1로 할수도있음 -> block단위로 다음
      }
   %>
   
</ul>
</nav>




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