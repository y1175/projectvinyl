<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="list" value="${requestScope.list}"></c:set>
<h1>마이페이지-주문관리</h1>
<table>
<thead>
<tr><th>주문일</th><th>주문번호</th><th>주문상세</th><th>배송현황</th>
</tr>
</thead>
<tbody>
<tr>
<c:forEach var="item" items="${list }">
<td><c:out value="${item.orderdate }"></c:out></td>
<td><c:out value="${item.order_no }"></c:out></td>
<td><a href="yiorderdetail.do?num=${item.order_no }">상세보기</a></td>
<td><c:out value="${item.status }"></c:out></td>
</c:forEach>
</tr>
</tbody>
</table>
<c:set var="num" value="${item.order_no }"></c:set>
<a href="yi.do">메인으로 돌아가기</a>
</body>
</html>