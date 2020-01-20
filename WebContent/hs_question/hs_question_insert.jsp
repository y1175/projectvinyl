<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--icon-->
</head>
<body>
  <h1>질문하기</h1>
  <div>
    <b>상품구매,배송 관련 문의가 필요하시다면</b>
    <b>문의하러 가기</b>
  </div>
  <form method="post" action="hs_questioninsertresult.do" enctype="multipart/form-data">
    <ul>
      <li>
          <input type="text" name="title" id="hs_question_insert_title" value="제목을 적어주세요.">
      </li>    
      <li>
          <textarea rows="30" cols="50" name="content">

내용을적어주세요.
          
참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.

 ※ 비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하여, 답변이 달린 질문글은 삭제할 수 없습니다.
 ※ 인테리어와 관련이 없는 질문응ㄴ 숨김 및 삭제 될 수 있습니다.
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
</body>
</html>