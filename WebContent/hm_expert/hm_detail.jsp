<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="hm_detail.css" > 

</head>
<body>

<c:set var ="dto" value = "${requestScope.dto}"></c:set>


<div id="floatdiv">
<p>
<br>
${dto.name}
<br>
<br>
</p>
</div>
</body>
</html>