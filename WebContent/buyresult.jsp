<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>

<c:set var="memberdto" value="${requestScope.memberdto }"/>
<c:set var="itemdto" value="${requestScope.itemdto}"/>

<input type="hidden" id="item_no" name="item_no" value="${itemdto.item_no }"><br>

<label for="item_name">제품 명</label><br>
<input type="text" id="item_name" name="item_name" value="${itemdto.name}" readonly="readonly"><br>

<label for="item_price">제품 가격</label><br>
<input type="text" id="item_price" name="item_price" value="${itemdto.price}" readonly="readonly"><br>

<label for="member_name">구매자</label><br>
<input type="text" id="member_name" name="member_name" value="${memberdto.mem_no }"><br>

<input type="hidden" id="mem_no" name="mem_no" value="${memberdto.mem_no }"><br>

<label for="member_phone">연락처</label><br>
<input type="text" id="member_phone" name="member_phone" value="${memberdto.phone }"><br>

<label for="member_zipcode">우편번호</label><br>
<input type="text" id="member_zipcode" name="member_zipcode" value="${memberdto.zipcode }"><br>

<label for="member_addr">주소</label><br>
<textarea rows="4" cols="20" id="member_addr" name="member_addr"> ${memberdto.addr}</textarea>

<button value="결제" onclick="location.href='buydetail.do?mem_no=${memberdto.mem_no}&item_no=${itemdto.item_no }'"></button>
<input type="reset" value="취소">
<!-- 이거 하면 제품 리스트로 돌아가게 하셈 취소하면 리셋이 아니라 근데 지금 제품 리스트 그게 없어서 걍 이렇게 넣었음 -->

</body>
</html>