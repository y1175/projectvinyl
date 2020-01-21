<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   
     
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
	


</body>
</html>