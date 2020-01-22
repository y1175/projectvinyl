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

</body>
</html>