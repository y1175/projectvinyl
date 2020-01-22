<%@page import="hm.com.homedream.dto.Hm_ExpertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<script>
function send(){
	if(document.hmfrm.title.value!="")
		document.hmfrm.submit();
}
</script>
</head>

<body>

<%
	Hm_ExpertDTO dto = (Hm_ExpertDTO)request.getAttribute("dto");
%>

<form method ="post" action ="hm_modifyresult.do" enctype="multipart/form-data" name = "hmfrm">
<ul>
	<li>
	<label for="no">업체번호</label>
	<input type = "text" name = "bno" id ="bno" value =<%=dto.getNo()%> readonly="readonly">
	</li>
	<li>
	<label for ="name">상호명</label>
	<input type ="text" name = "name" id ="name" value =<%=dto.getName()%>>
	</li>
	<li>
	<label for ="content">내용</label>
	<textarea rows="4" cols="20" name ="content" id="content"><%=dto.getText()%></textarea>
	</li>
	<li>
	<label for ="place">위치</label>
	<input type ="text" name = "place" id ="place" value=<%=dto.getPlace()%>>
	</li>
	<li>
	<label for ="lat">위도</label>
	<input type =text name = "lat" id ="lat" value=<%=dto.getFlat()%>>
	</li>
	<li>
	<label for ="lon">경도</label>
	<input type ="text" name = "lon" id ="lon" value=<%=dto.getFlon()%>>
	</li>
	<li>
	<label for ="addr">상세주소</label>
	<textarea rows="3" cols="20" name ="addr" id="addr"><%=dto.getAddr()%></textarea>
	</li> 
	<li>
	<label for ="uploadfile">파일경로</label>
	<input type ="file" name = "uploadfile" id ="uploadfile">
	</li>
	<li>
	<input type ="submit" value ="수정">
	<input type ="reset" value ="취소">
	</li>
	</ul>
</form>

</body>
</html>