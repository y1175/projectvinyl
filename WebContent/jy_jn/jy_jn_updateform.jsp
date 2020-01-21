<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        
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
<style>
/* header nav 집들이 앤 노하우 글씨색상  */
  .hs_header_nav > a:nth-child(2){
    color: rgb(0, 153, 255);
  }
</style>
<script>
function send(){
	if(document.frm.title.value!="")
		document.frm.submit();
}
</script>
</head>
<body>
<div class="container">
 <header>
  <jsp:include page="/hs_communityheader.jsp"></jsp:include>
 </header>

<form method="post" action="jy_updateresult.do" enctype="multipart/form-data" name="frm">
<c:set var="dto" value="${requestScope.dto}"/>
  <div class="form-group">
    <label for="btitle">제목</label>
    <input type="text" class="form-control" id="btitle" name= "btitle" value="${dto.btitle}">
  </div>
  <div class="form-group">
    <label for="bcontent">내용</label>
    <textarea class="form-control" id="bcontent" name="bcontent" rows="3" >${dto.bcontent}</textarea>
  </div>
   <div class="form-group">
    <label for="uploadfile">사진</label>
    <input type="file" class="form-control-file" id="uploadfile" name="uploadfile" value="${dto.file_name}">
  </div>
   <button type="submit" class="btn btn-primary">업로드</button>
   <button type="reset" class="btn btn-secondary">취소</button>
   <a href="jy_list.do">목록으로</a>
</form>


<footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div> 
</body>
</html>