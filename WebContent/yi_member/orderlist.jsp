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
<div class="container">
<header>
         <jsp:include page="/hs_communityheader.jsp"></jsp:include>
     </header>
     
<c:set var="list" value="${requestScope.list}"></c:set>
<c:set var="mlist" value="${requestScope.mlist }"></c:set>

<h1>마이페이지</h1>
<h2>주문 내역</h2>
<div>
<ul>
<li>상세조회 버튼을 클릭하시면 주문/입금/배송정보 등 세부내역을 확인하실 수 있습니다.</li>
<li>결제/입금하신 경우 배송이완료되면 상세조회 화면에서 영수증을 출력하실 수 있습니다.</li>
<li>포인트를 사용하여 주문하셨다가 재주문을 원하신다면 해당 주문을 취소하시면 포인트는 다시 반환됩니다.</li>
<li>주문취소 방법: 리스트의 상세정보를 클릭하시고 들어가신후 하단의 주문취소 버튼을 클릭하시면 됩니다.</li>
</ul>
  </div>
<table class="table table-hover">
<thead class="thead-dark">
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

<footer>
         <jsp:include page="/hs_user_footer.jsp"></jsp:include>
     </footer>
</div>
</body>
</html>