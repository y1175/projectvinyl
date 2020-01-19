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
<c:set var="member" value="${requestScope.member }"></c:set>
<c:set var="order" value="${requestScope.order }"></c:set>
<c:set var="items" value="${requestScope.items }"></c:set>

<h1>주문/배송지 정보</h1>
<table>
<tr><th>주문번호</th><td><c:out value="${order[0].order_no }"/></td>
<th>주문일자</th><td><c:out value="${order[0].orderdate }"/></td>
</tr>
<tr><th>배송주소</th><td><c:out value="${member[0].addr }"/></td>
<th>전화번호</th><td><c:out value="${member[0].phone }"/></td>
</tr>
<tr><th>이름</th><td><c:out value="${member[0].name }"/></td>
<th>결제금액</th><td><c:out value="${order[0].cost }"/>원</td>
</tr>

</table>
<h1>주문상품</h1>
<table>
<thead>
<tr><th>사진</th><th>상품명</th><th>가격</th><th>주문배송현황</th></tr>

</thead>
<tbody>
<c:forEach items="${items }" varStatus="status">
<tr><td></td>
<td><c:out value="${items[status.index].name }"/></td>
<td><c:out value="${items[status.index].price }"/>원</td>
<td><c:out value="${order[status.index].status }"/></td>
</tr>
</c:forEach>
</tbody>

</table>
<a href="">주문취소하기</a><br>
<a href="yiorderlist.do">주문내역으로 돌아가기</a><br>
<a href="yi.do">메인페이지로 돌아가기</a><br>
</body>
</html>