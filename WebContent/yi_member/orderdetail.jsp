<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="css/yi_adminboard.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->
</head>
<body>
<div class='container'>
<header>
         <jsp:include page="/hs_communityheader.jsp"></jsp:include>
     </header>
<c:set var="member" value="${requestScope.member }"></c:set>
<c:set var="order" value="${requestScope.order }"></c:set>
<c:set var="items" value="${requestScope.items }"></c:set>
<div class="yi_backToOrderlist"><a href="yiorderlist.do">주문내역으로 돌아가기</a></div>
<h4 class="yi_orderdetailTitle">주문 상세정보</h4><br>

<h5 class="yi_orderdetail-location">주문/배송지 정보</h5>
<div class='row'>
<div class='col-1'></div>
<div class='col-7'>
<table class="table">
<thead class="thead-dark">
<tr><th>주문번호</th><td><c:out value="${order[0].order_no }"/></td>
<th>주문일자</th><td><c:out value="${order[0].orderdate }"/></td></tr>
<tr><th>이름</th><td><c:out value="${member[0].name }"/></td><th>전화번호</th><td><c:out value="${member[0].phone }"/></td></tr>
<tr><th>결제금액</th><td><c:out value="${items[0].price }"/>원</td><th>배송주소</th><td><c:out value="${member[0].addr }"/></td></tr>
</thead>
<tbody></tbody>
</table>
</div>
<div class='col'></div>
</div>
<br>
<h5 class="yi_orderdetail-item">주문상품</h5>
<div class='row'>
<div class='col-1'></div>
<div class='col-10'>
<table class="table">
<thead class="thead-dark">
<tr><th>사진</th><th>상품명</th><th>가격</th><th>주문배송현황</th></tr>

</thead>
<tbody>

<c:forEach items="${items }" varStatus="stat">

<c:choose> 
<c:when test="${order[stat.index].status == 0 }">
<c:set var="orderst" value="주문취소"></c:set>
</c:when>
<c:when test="${order[stat.index].status== 1 }">
<c:set var="orderst" value="결제확인"></c:set>
</c:when>
<c:when test="${order[stat.index].status == 2 }">
<c:set var="orderst" value="배송준비중"></c:set>
</c:when>
<c:when test="${order[stat.index].status == 3 }">
<c:set var="orderst" value="배송중"></c:set>
</c:when>
<c:when test="${order[stat.index].status == 4 }">
<c:set var="orderst" value="배송완료"></c:set>
</c:when>
</c:choose>

<tr>

<td><img src="upload/${items[status.index].file_name }" alt="${items[status.index].file_name}"/></td>
<td><c:out value="${items[stat.index].name }"/></td>
<td><c:out value="${items[stat.index].price }"/>원</td>
<td><c:out value="${orderst }"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div class='col'></div>
</div>
<div class='yi_ordercancelbtn'><a href="yiordercancel.do?num=${order[0].order_no }" class="btn btn-primary">주문취소하기</a></div>



<footer>
         <jsp:include page="/hs_user_footer.jsp"></jsp:include>
     </footer>
</div>
</body>
</html>