<%@page import="com.homedream.dto.ExpertDTO"%>
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

<link rel="stylesheet" href="css/managerdetail.css?ver=2">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Serif+KR&display=swap" rel="stylesheet">


</head>
<body>
    
<%
    	ExpertDTO dto = (ExpertDTO) request.getAttribute("dto");

    	int no = dto.getNo();
    	String name = dto.getName();
    	String text = dto.getText();
    	String place = dto.getPlace();
    	Float lat =dto.getFlat();
    	Float lon = dto.getFlon();
    	String addr = dto.getAddr();
    	String file_name = dto.getFile_name();
    %>


<div class ="managerdetail">
<p>업체등록번호 : <%=no%></p>
<h2><%=name%></h2>
<div style="width: 100%; text-align: center;">
<img src="upload/<%=file_name%>" alt="<%=file_name%>" class ="managerdetailimg"/> 
</div>
<div class="text"> 
<p>업체 소개글 </p>
<h6><%=text%></h6>
</div>
<address>
  <strong>Address</strong><br>
  <a href="mailto:#" ><%=addr%></a><br>
  <strong>Latitude : <%=lat%></strong>
  <strong>Longitude : <%=lon%></strong>
</address>

</div>


<a href="managerlist.do"><button type="button" class="btn btn-outline-info"
style = "margin:20px 20px 0px 0px;"
>리스트보기</button></a>
<a href="modify.do?no=<%=no%>"><button type="button" class="btn btn-outline-info"
style = "margin:20px 20px 0px 0px;">수정</button></a>

</body>
</html>