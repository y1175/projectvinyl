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
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--icon-->
</head>
<body>
<div  class="container">
 <header>
  <jsp:include page="/hs_communityheader.jsp"></jsp:include>
 </header>
  <h1>질문하기</h1>
  <div>
    <b>상품구매,배송 관련 문의가 필요하시다면</b>
    <b>문의하러 가기</b>
  </div>
  <form method="post" action="hs_questioninsertresult.do" enctype="multipart/form-data">
    <ul>
      <li>
          <input type="text" name="title" id="hs_question_insert_title" placeholder="제목을 적어주세요.">
      </li>    
      <li>
          <textarea rows="30" cols="50" name="content">

내용을적어주세요.
          
참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.

 ※ 비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하여, 답변이 달린 질문글은 삭제할 수 없습니다.
 ※ 인테리어와 관련이 없는 질문은 숨김 및 삭제 될 수 있습니다.
         </textarea>
          <div>
              <input type="file" name="uploadfile" id="hs_question_insert_uploadfile">
              <i class="material-icons">&#xe439;</i>
          </div>
      </li>
      <li>
          <input type="submit" value="질문등록">
      </li>  
    </ul>
  </form>
 <footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer> 
</div>  
</body>
</html>