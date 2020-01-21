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
<c:set var = "result" value="${requestScope.result }"/>
<c:set var = "num" value="${requestScope.num }"/>
<c:if test="${result == 1}">
<script>
alert("좋아요!");
location.href="jy_detail.do?num=${num}"
</script>
</c:if>
<c:if test="${result  == 0}">
<script>
alert("안좋아요!");
location.href="jy_detail.do?num=${num}"
</script>
</c:if>
</body>
</html>