<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="yiloginresult.do">
<ul>
<li><label for='id'>아이디</label>
<input type="text" name="id" id="id" required>
</li>
<li><label for="pwd">패스워드</label>
<input type="password" name="pwd" id="pwd" required>
</ul>
<input type="submit" value="로그인">
</form>
<a href="join.do">회원가입하기</a>
</body>
</html>