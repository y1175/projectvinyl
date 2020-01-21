<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="jy_uploadresult.do" enctype="multipart/form-data">
		<ul>
			<li>
			<label for="btitle">제목</label> 
			<input type="text" name="btitle" id="btitle">
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
			<input type="submit" value="업로드"> 
			<input type="reset" value="취소">
			<a href="jy_list.do">목록으로</a>
			</li>
		</ul>
	</form>
</body>
</html>