<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/yi_adminboard.css">
<style>
	#imgblock{
		width: 100px;
		height:100px;
	}
</style>
</head>
<body>
		<c:set var="member" value="${requestScope.member }"></c:set>
		<c:set var="order" value="${requestScope.order }"></c:set>
		<c:set var="items" value="${requestScope.items }"></c:set>
		<div class="yi_backToOrderlist">
			<a href="yiorderlist.do">주문내역으로 돌아가기</a>
		</div>
		<h4 class="yi_orderdetailTitle">주문 상세정보</h4>
		<br>

		<h5 class="yi_orderdetail-location">주문/배송지 정보</h5>
		<div class='row'>
			<div class='col-1'></div>
			<div class='col-7'>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>주문번호</th>
							<td><c:out value="${order[0].order_no }" /></td>
							<th>주문일자</th>
							<td><c:out value="${order[0].orderdate }" /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><c:out value="${member[0].name }" /></td>
							<th>전화번호</th>
							<td><c:out value="${member[0].phone }" /></td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td><c:out value="${items[0].price }" />원</td>
							<th>배송주소</th>
							<td><c:out value="${member[0].addr }" /></td>
						</tr>
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
						<tr>
							<th>사진</th>
							<th>상품명</th>
							<th>가격</th>
							<th>주문배송현황</th>
						</tr>

					</thead>
					<tbody>

						<c:forEach items="${items }" var="item">

							<c:choose>
								<c:when test="${order[0].status == 0 }">
									<c:set var="orderst" value="주문취소"></c:set>
								</c:when>
								<c:when test="${order[0].status== 1 }">
									<c:set var="orderst" value="결제확인"></c:set>
								</c:when>
								<c:when test="${order[0].status == 2 }">
									<c:set var="orderst" value="배송준비중"></c:set>
								</c:when>
								<c:when test="${order[0].status == 3 }">
									<c:set var="orderst" value="배송중"></c:set>
								</c:when>
								<c:when test="${order[0].status == 4 }">
									<c:set var="orderst" value="배송완료"></c:set>
								</c:when>
							</c:choose>

							<tr>

								<td><img src="img/${item.file_name }"
									alt="${item.file_name}" id="imgblock" /></td>
								<td><c:out value="${item.name }" /></td>
								<td><c:out value="${item.price }" />원</td>
								<td><c:out value="${orderst }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class='col'></div>
		</div>
		<div class='yi_ordercancelbtn'>
			<a href="yiordercancel.do?num=${order[0].order_no }"
				class="btn btn-primary">주문취소하기</a>
		</div>

</body>
</html>