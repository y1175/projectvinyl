<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변 수정</title>
<script>
</script>
</head>
<body>
<c:set var="dto" value="${requestScope.dto}"/>
  <form method="post" action="hs_questionupdateresult.do" enctype="multipart/form-data">
    <ul>
      <li>
          <input type="text" name="title" id="hs_question_insert_title" value="${dto.title}">
      </li>    
      <li>
          <textarea rows="30" cols="50" name="content">${dto.content}</textarea>
          <div>
              <input type="file" name="uploadfile" id="hs_question_insert_uploadfile">
              <i class="material-icons">&#xe439;</i>
          </div>
      </li>
      <li>
          <input type="submit" value="질문수정">
          <input type="reset" value="취소">
      </li> 
    </ul>  
  </form>
</body>
</html>