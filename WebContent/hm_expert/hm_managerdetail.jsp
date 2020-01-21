<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
  <div class="container">
     <header>
         <jsp:include page="/hs_communityadminheader.jsp"></jsp:include>
     </header>   
<%
	Hm_ExpertDTO dto = (Hm_ExpertDTO) request.getAttribute("dto");

	int no = dto.getNo();
	String name = dto.getName();
	String text = dto.getText();
	String place = dto.getPlace();
	String lat =dto.getLat();
	String lon = dto.getLon();
	String addr = dto.getAddr();
	String file_name = dto.getFile_name();
	
%>

<table class = "hm_managerdetail">
<thead>
<tr><th><%=no%></th><th>업체명 : <%=name%></th></tr>
</thead>
<tbody>
<tr>
<td>
<img src="hm_expert/<%=file_name%>" alt="<%=file_name%>" class ="hm_managerdetailimg"/>
</td>
</tr>
<tr>
<td>
<%=text%>
</td>
</tr>
<tr><td>지역 <%=place%></td></tr>
<tr><td>주소 <%=addr%></td></tr>
<tr><td>위도 <%=lat%></td><td>경도 <%=lon%></td></tr>
</tbody>
</table>


<%-- 

<div class = "hm_detail">
	<img src="hm_expert/<%=file_name%>" alt="<%=file_name%>" class ="hm_managerdetailimg"/>
	<h2><%=name%></h2>
	<p><br><%=addr%><br></p>
	<p><%=text%><br></p>
</div> 
 --%>


	
	
<a href="hm_managerlist.do">목록으로</a>
<a href="hm_modify.do?no<%=no%>">수정</a>	
	
     <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>

</body>
</html>