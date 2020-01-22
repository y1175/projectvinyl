<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="mem_no" value="58"/>
<!-- 임의로 잡은 멤버 번호 > 나중에는 로그인한 번호로 받아올거임 세션으로  -->
<c:set var="item_no" value = "6"/>
<!-- 마찬가지 임의값 어차피 얘는 상페에 들어갈거니까 거기서 디테일한 아이템 번호 받아오면 됨 -->

<input type="hidden" name="mem_no" id="mem_no" value="${mem_no }">
<input type="hidden" name="item_no" id="item_no" value="${item_no }">
<a href="buypage.do?mem_no=${mem_no}&item_no=${item_no}">구매</a>
</body>
</html>