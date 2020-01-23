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
<c:if test="${result == 1}">
<script>
alert("수정 완료!");
location.href="jy_list.do"
</script>
</c:if>
<c:if test="${result  == 0}">
<script>
alert("수정실패!");
location.href="jy_list.do"
</script>
</c:if>
</body>
</html>