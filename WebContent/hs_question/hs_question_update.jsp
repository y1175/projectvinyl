<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변 수정</title>
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
/* header nav 질문과답변 글씨색상  */
  .hs_header_nav > a:nth-child(4){
    color: rgb(0, 153, 255);
  }
  .hs_question_update_file{
      width: 110px;
      height: 110px;
      background-color:rgba(0, 153, 255,0.7);
      border-radius: 50%; 
      position: relative;
      bottom: 700px;
      left: 960px;
  }
  .hs_question_update_file i{
      color: white;
      position: relative;
      font-size : 30px;
      top: 40px;
      left: 40px;
  }
  .hs_question_update_submit{
       padding: 5px 20px;
	   border-radius: 5px;	 
       background-color: rgba(0, 153, 255,0.7); 
       color: white; 
       font-weight : 900;
       font-size: 15px;
       border: 1px transparent;
  }
</style>
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--icon-->
</head>
<body>
<div class="container">
 <header>
  <jsp:include page="/hs_communityheader.jsp"></jsp:include>
 </header>

<c:set var="dto" value="${requestScope.dto}"/>
<h4 style="font-weight: 700; margin-bottom: 30px;">질문수정</h4>
  <form method="post" action="hs_questionupdateresult.do" enctype="multipart/form-data">
    <div class="form-group">
       <input type="text" class="form-control" name="title" id="hs_question_insert_title" value="${dto.title}">
    </div>    
    <div class="form-group">
          <textarea  class="form-control" rows="30" name="content">${dto.content}</textarea>
          <div class="hs_question_update_file">
              <i class="material-icons">&#xe439; </i>
              <input type="file" class="custom-file-input" name="uploadfile" id="hs_question_insert_uploadfile">
          </div>
    </div >
      <div style="margin-top: -100px; text-align: center;">
          <input type="submit" class="hs_question_update_submit" value="수정">
          <input type="reset"  class="hs_question_update_submit" value="취소">
      </div>   
  </form>
  
 <footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div>

</body>
</html>