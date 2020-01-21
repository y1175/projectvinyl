<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="hm_expert/hm_managerlist.css">
</head>
<body>
  <div class="container">
     <header>
         <jsp:include page="/hs_communityadminheader.jsp"></jsp:include>
     </header>
     
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


	

<table class="table" >
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
      style ="width:35px; , text-align:center">수정</button></a>
      </td>
      <td>
      <button type="button" class="btn btn-outline-info" 
      style ="width:35px; ,text-align:center" >삭제</button>
      </td>
    </tr>
    
	<%
		}
	%>
	
	 </tbody>
</table>
	<!-- for문 닫음 -->
 <%
      int currpage = (Integer) request.getAttribute("currpage");
      int startblock = (Integer) request.getAttribute("startblock");
      int endblock = (Integer) request.getAttribute("endblock");
      int totalpage = (Integer) request.getAttribute("totalpage");
      String hmcity = request.getParameter("hmcity");

      if (startblock > 1) {
    	  if(hmcity==null||hmcity.equals(""))
    		  
    	  {
    	%>
    	 <a href="hm_managerlist.do?curr=<%=currpage - 1%>">이전</a>
    	  <% 
    	  }else{
    	  
   %>
   <a href="hm_managerlist.do?curr=<%=currpage - 1%>&hmcity=<%=hmcity%>">이전</a>
   <%
    	  }//currpage -> startblock-1 = 블럭단위로 넘어감   
      }
   %>

   <%
      for (int i = startblock; i <= endblock; i++) {
         if (currpage == i) {
   %>
   <%=i%>
   <%
      } else if(hmcity==null||hmcity.equals("")){
   %>
   <a href="hm_managerlist.do?curr=<%=i%>"><%=i%></a>
   <% 
      }else{
   %>
   <a href="hm_managerlist.do?curr=<%=i%>&hmcity=<%=hmcity%>"><%=i%></a>
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
    		  <a href="hm_managerlist.do?curr=<%=currpage + 1%>">다음</a>
    		  
    		  <% 
    	  }else{
   %>
   <a href="hm_managerlist.do?curr=<%=currpage + 1%>&hmcity=<%=hmcity%>">다음</a>
   <%
    	  }
      //endblock+1로 할수도있음 -> block단위로 다음
      }
   %>
     <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>

<%-- <a href="hm_modify.do?no<%=no%>">수정</a>	 --%>
</body>
</html>