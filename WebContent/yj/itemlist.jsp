<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->

<style>
	.table{
		text-align: center;
	}
	#btnblock{
		text-align: right;
		margin-right: 30PX;
	}
	.itemimg{
		height: 100px;
		width : 100px;
	}
</style>
</head>
<script>
	function deletemsg(itemNo) {
		if(confirm("삭제하시겠습니까?") == true){
			location.href='yj_delete.do?itemNo=' + itemNo;
		}else{
			return;
		}
	}
	
	function deleteAllmsg() {
		if(confirm("삭제하시겠습니까?") == true){
			$('#frm').submit();
		}else{
			return;
		}
	}
	
	$(document).ready(function () {
		$('button[id=insert]').click(function() {
			location.href="yj_insertItem.do";
		});
	});
</script>
<body>
      <p style="font-size: 22px; font-weight:700; margin: 30px 0px;  text-align: center;">상품관리</p>
		<form id="frm" method="post" action="yj_deleteAll.do">
			<table class="table" style="margin-top: 20px;">
				<thead class="thead-dark">
					<tr>
						<th scope="col"><img src="https://img.icons8.com/material/16/000000/checked-2--v2.png"></th>
						<th scope="col">NO</th>
						<th scope="col">이미지</th>
						<th scope="col">상품명</th>
						<th scope="col">판매가</th>
						<th scope="col">재고</th>
						<th scope="col">관리</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${list }">
					<tr>
						<td style="vertical-align: middle;"><input type="checkbox" name="num" value="${item.itemNo }"></td>
						<td style="font-size: 17px; vertical-align: middle; font-weight: 600;"><c:out value="${item.itemNo }"/></td>
						<td><img class="itemimg" src="img/${item.fileName }"></td>
						<td style="vertical-align: middle; font-size: 17px; font-weight: 600; color: #222;"><c:out value="${item.name }"/></td>
						<td style="vertical-align: middle; font-size: 17px; font-weight: 600; color: #222;"><c:out value="${item.price }원"/></td>
						<td style="vertical-align: middle; font-size: 17px; font-weight: 600; color: #222;"><c:out value="${item.stock }개"/></td>
						<td>
						<button type="button" class="update btn btn-secondary" style="margin-top: 30px;" onclick="location.href='yj_update.do?itemNo=${item.itemNo}'">수정</button> 
						<button type="button" class="delete btn btn-danger" style="margin-top: 30px;"  onclick="deletemsg(${item.itemNo})">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<br>
			<div id="btnblock">
				<button type="button" class="btn btn-primary" id="insert">상품등록</button>
				<button type="button" id="deleteAll" class="btn btn-danger" onclick="deleteAllmsg()">선택상품삭제</button> 
			</div>
		</form>
</body>
</html>