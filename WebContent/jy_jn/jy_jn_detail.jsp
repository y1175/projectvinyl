<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

$(document).ready(function(){
	
	
	
});

</script>

</head>
<body>
<c:set var="dto" value="${requestScope.dto}"/>
<ul>
<li>
<label for="bno">글번호</label><br>
<c:out value="${dto.bno }"/><br>
</li>
<li>
<label for="btitle">제목</label><br>
<c:out value="${dto.btitle }"/><br>
</li>
<li>
<label for="bcontent">내용</label><br>
<c:out value="${dto.bcontent }"/><br>
</li>
<li>
<label for="likeno">좋아요</label><br>
<c:out value="${dto.likeNo }"/><br>
</li>
<li>
<label for="readno">조회수</label><br>
<c:out value="${dto.readNo }"/><br>
</li>
<li>
<label for="file_name">업로드 한 사진</label><br>
 <img src="upload/${dto.file_name}" alt="${file }">
</li>
<li>
<button name="like" id="like">좋아요</button>
</li>
</ul>
<a href="list.do">목록으로</a>
<a href="update.do?num=${dto.bno }">수정</a>
<a href="delete.do?num=${dto.bno }">삭제</a>
</body>
</html>