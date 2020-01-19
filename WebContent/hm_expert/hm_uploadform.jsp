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



<form method = "post" action="hm_uploadresult.do" enctype="multipart/form-data"><!-- 업로드할때 enctype 꼭 써줘야함  -->
	<ul>
	<li>
	<label for ="name">상호명</label>
	<input type ="text" name = "name" id ="name">
	</li>
	<li>
	<!-- <textarea rows="10" cols="20" name ="content" id ="content" >내용</textarea> -->
	<label for ="content">내용</label>
	<input type ="text" name = "content" id ="content"> 
	</li>
	<li>
	<label for ="place">위치</label>
	<input type ="text" name = "place" id ="place">
	</li>
	<li>
	<label for ="lat">위도</label>
	<input type =text name = "lat" id ="lat">
	</li>
	<li>
	<label for ="lon">경도</label>
	<input type ="text" name = "lon" id ="lon">
	</li>
	<li>
	<label for ="file_name">파일이름</label>
	<input type ="text" name = "file_name" id ="file_name">
	</li> 
	<li>
	<label for ="uploadfile">파일경로</label>
	<input type ="file" name = "uploadfile" id ="uploadfile">
	</li>
	<li>
	<input type ="submit" value ="전송">
	<input type ="reset" value ="취소">
	</li>
	</ul>
	</form>
</body>
</html>