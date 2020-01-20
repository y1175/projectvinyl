<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>