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
<style>
/* header nav 집들이 앤 노하우 글씨색상  */
  .hs_header_nav > a:nth-child(2){
    color: rgb(0, 153, 255);
  }
</style>
<script>
function unno(){
	location.href="jy_list.do";
}
  </script>
</head>
<body>

<form method="post" action="jy_uploadresult.do" enctype="multipart/form-data">
  <div class="form-group">
    <label for="btitle">제목</label>
    <input type="text" class="form-control" id="btitle" name= "btitle" placeholder="제목을 입력하세요.">
  </div>
  <div class="form-group">
    <label for="bcontent">내용</label>
    <textarea class="form-control" id="bcontent" name="bcontent" rows="3" placeholder="내용을 입력하세요."></textarea>
  </div>
   <div class="form-group">
    <label for="uploadfile">사진</label>
    <input type="file" class="form-control-file" id="uploadfile" name="uploadfile">
  </div>
   <button type="submit" class="btn btn-primary">업로드</button>
   <button type="button" class="btn btn-secondary" onclick="unno()">취소</button>
   <a href="jy_list.do">목록으로</a>
</form>

</body>
</html>