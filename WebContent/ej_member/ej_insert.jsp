<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.resizeTo(300, 300)
//self.resizeTo(300,300)
</script>
</head>
<body>
<form method="post" action="ej_insert.do">

<c:set var="num" value="${requestScope.memNo }"/>
<input type="hidden" value=${num } name="memNo"> 
적립금:<input type="text" size="6" name="addpoint">
 
 
<input type="submit" value="적립" >
<!-- onclick="location.href=/ej_list.do -->
</form>
</body>
</html>