<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homedream</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<link rel="stylesheet" href="css/hm_managerlist.css?ver=1">
<style>
/* header nav 업체관리  */
  .hs_header_nav > a:nth-child(1){
    color: rgb(0, 153, 255);
  }
  
  @font-face{
   font-family: '10X10';
   src: url("http://localhost:9080/projectvinyl/font/10X10_1.woff");
   
}
  
</style>
</head>
<body>

 	<c:set var="totalcount" value="${requestScope.totalcount}"></c:set>
	
     <h1 class="hm_h1mg">
     등록된 업체 수 <c:out value="${totalcount}" />  
     </h1>
	<form method="post" action="hm_managerlist.do">
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
		</select> <input type="submit" value="검색" class="hm_searchmg">
	</form>


	<a href = "hm_upload.do">
      <button type="button" class="btn btn-outline-info"
      style ="width:100px; margin : 0px 0px 20px 0px; float:right;  font-family: '10X10'; ">업체등록</button></a>

<table class="table"  >
  <thead>
    <tr class="table-info">
       <th scope="col">#</th>
      <th scope="col">업체명</th>
      <th scope="col">업체설명</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  
	<%
		List<Hm_ExpertDTO> list = (List<Hm_ExpertDTO>) request.getAttribute("list");

		for (Hm_ExpertDTO dto : list) {
			int no = dto.getNo();
			String addr = dto.getAddr();
			String file_name = dto.getFile_name();
			String name = dto.getName();
			Float lat = dto.getFlat();//위도
			Float lon = dto.getFlon();//경도
			String text = dto.getText();
	%>
  <tbody>
    <tr>
      <th scope="row"><%=no%></th>
      <td style ="width:180px;"><%=name%></td>
      <td><%=text%></td>
      <td>  
      <a href = "hm_managerdetail.do?no=<%=no%>">
      <button type="button" class="btn btn-outline-info"
      style ="width:65px;height:40px;font-family: '10X10'; ">보기</button></a>
      </td>
      <td>
      <a href ="hm_delete.do?no=<%=no%>">
      <button type="button" class="btn btn-outline-info" 
      style ="width:65px;height:40px; font-family: '10X10';" >삭제</button></a>
      </td>
    </tr>
	<%
		}
	%>
	
	
	 </tbody>
</table>


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
    	 <a class="page-link" href="hm_managerlist.do?curr=<%=currpage - 1%>" >이전</a>
    	 </li> 
    	  <% 
    	  }else{
    	  
   %>
  <li class="page-item">
   <a  class="page-link" href="hm_managerlist.do?curr=<%=currpage - 1%>&hmcity=<%=hmcity%>" >이전</a>
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
   <a class="page-link" href="hm_managerlist.do?curr=<%=i%>"><%=i%></a>
   </li>
   <% 
      }else{
   %>
  <li class="page-item">
   <a class="page-link" href="hm_managerlist.do?curr=<%=i%>&hmcity=<%=hmcity%>"><%=i%></a>
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
    		  <a  class="page-link" href="hm_managerlist.do?curr=<%=currpage + 1%>">다음</a>
    		  </li>
    		  <% 
    	  }else{
   %>
   <li class="page-item">
   <a class="page-link" href="hm_managerlist.do?curr=<%=currpage + 1%>&hmcity=<%=hmcity%>">다음</a>
   </li>
   <%
    	  }
      //endblock+1로 할수도있음 -> block단위로 다음
      }
   %>
   
</ul>
</nav>

<%-- <a href="hm_modify.do?no<%=no%>">수정</a>	 --%>
</body>
</html>