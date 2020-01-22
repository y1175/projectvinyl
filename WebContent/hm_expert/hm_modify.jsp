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
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<script>
function send(){
	if(document.hmfrm.title.value!="")
		document.hmfrm.submit();
}
</script>
</head>

<body>
<div class="container">
     <header>
         <jsp:include page="/hs_communityadminheader.jsp"></jsp:include>
     </header>


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


     <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>


</body>
</html>