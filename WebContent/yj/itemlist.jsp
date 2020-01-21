<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#container {
	width: 70%;
	margin: 0px auto;
}

table {
	width: 100%;
}

tr td {
	border: 1px solid black;
	text-align: center;
}

img {
	width: 100px;
	height: 100px;
}

.update, .delete, #insert, #deleteAll {
	text-decoration: none;
	color: black;
	border: 1px solid silver;
	padding: 5px 15px;
}

#btnblock{
	text-align: right;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		$('input[id=insert]').click(function() {
			location.href="yj_insertItem.do";
		});
	});
</script>
<body>
	<div id="container">
		<form id="frm" method="post" action="yj_deleteAll.do">
			<table>
				<thead>
					<tr>
						<td>ㅁ</td><!-- glyphicon glyphicon-check -->
						<td>NO</td>
						<td>이미지</td>
						<td>상품명</td>
						<td>판매가</td>
						<td>재고</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${list }">
					<tr>
						<td><input type="checkbox" name="num" value="${item.itemNo }"></td>
						<td><c:out value="${item.itemNo }"/></td>
						<td><img src="img/${item.fileName }"></td>
						<td><h1><c:out value="${item.name }"/></h1></td>
						<td><h2><c:out value="${item.price }원"/></h2></td>
						<td><h2><c:out value="${item.stock }개"/></h2></td>
						<td>
						<input type="button" class="update" value="수정" onclick="location.href='yj_update.do?itemNo=${item.itemNo}'"> 
						<input type="button" class="delete" value="삭제" onclick="deletemsg(${item.itemNo})"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<br>
			<div id="btnblock">
				<input type="button" id="deleteAll" value="선택상품삭제" onclick="deleteAllmsg()"> 
				<input type="button" id="insert" value="상품등록">
			</div>
		</form>
	</div>
</body>
</html>