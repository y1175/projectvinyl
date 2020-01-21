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
<ul>
<li>
<label for = "bno">글 번호</label>
<input type="text" name="bno" id="btitle" value="${dto.bno}" readonly="readonly">
</li>
<li>
<label for="btitle">제목</label>
<input type="text" name="btitle" id="btitle" value="${dto.btitle}">
</li>
<li>
<label for="bcontent">내용</label>
<textarea rows="4" cols="20" name="bcontent" id="bcontent" >${dto.bcontent}</textarea> 
</li>
<li>
<label for="uploadfile">파일</label> 
<input type="file" name="uploadfile" id="uploadfile">
</li>
<li>
<input type="submit" value="수정">
<input type="reset" value="취소">
<a href="jy_list.do">목록으로</a>
</li>
</ul>
</form>

<footer>
     <jsp:include page="/hs_user_footer.jsp"></jsp:include>
  </footer>
</div>
</body>
</html>