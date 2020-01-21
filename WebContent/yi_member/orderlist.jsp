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
<c:set var="mlist" value="${requestScope.mlist }"></c:set>

<h1>마이페이지</h1>
<h2>주문 내역</h2>
<table>
<thead>
<tr><th>주문일</th><th>주문번호</th><th>주문상세</th><th>배송현황</th>
</tr>
</thead>
<tbody>

<c:forEach var="item" items="${list }" varStatus="stat">
<tr>

<c:choose> 
<c:when test="${list[stat.index].status == 0 }">
<c:set var="orderst" value="주문취소"></c:set>
</c:when>
<c:when test="${list[stat.index].status== 1 }">
<c:set var="orderst" value="결제확인"></c:set>
</c:when>
<c:when test="${list[stat.index].status == 2 }">
<c:set var="orderst" value="배송준비중"></c:set>
</c:when>
<c:when test="${list[stat.index].status == 3 }">
<c:set var="orderst" value="배송중"></c:set>
</c:when>
<c:when test="${list[stat.index].status == 4 }">
<c:set var="orderst" value="배송완료"></c:set>
</c:when>
</c:choose>


<td><c:out value="${item.orderdate }"></c:out></td>
<td><c:out value="${item.order_no }"></c:out></td>
<td><a href="yiorderdetail.do?num=${item.order_no }">상세보기</a></td>

<td><c:out value="${orderst }"></c:out></td>
</tr>
</c:forEach>

</tbody>
</table>
<c:set var="num" value="${item.order_no }"></c:set>

<h2>회원 정보</h2>
<ul>
<li><c:out value="${mlist[0].id }"></c:out></li>
<li><c:out value="${mlist[0].name }"></c:out></li>
<li><c:out value="${mlist[0].birth }"></c:out></li>
<li><c:out value="${mlist[0].phone }"></c:out></li>
<li><c:out value="${mlist[0].addr }"></c:out></li>
</ul>
<a href="yimodify.do">회원정보 수정</a><br>
<a href="yi.do">메인으로 돌아가기</a>


</body>
</html>