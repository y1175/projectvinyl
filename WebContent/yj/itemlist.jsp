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
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<style>
	.table{
		text-align: center;
	}
	#btnblock{
		text-align: right;
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
  <div class="container">
     <header>
         <jsp:include page="/hs_storeadminheader.jsp"></jsp:include>
     </header>
		<form id="frm" method="post" action="yj_deleteAll.do">
			<table class="table">
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
						<td><input type="checkbox" name="num" value="${item.itemNo }"></td>
						<td><c:out value="${item.itemNo }"/></td>
						<td><img class="itemimg" src="img/${item.fileName }"></td>
						<td><h1><c:out value="${item.name }"/></h1></td>
						<td><h2><c:out value="${item.price }원"/></h2></td>
						<td><h2><c:out value="${item.stock }개"/></h2></td>
						<td>
						<button type="button" class="update btn btn-secondary" onclick="location.href='yj_update.do?itemNo=${item.itemNo}'">수정</button> 
						<button type="button" class="delete btn btn-danger" onclick="deletemsg(${item.itemNo})">삭제</button></td>
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
     <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>
</body>
</html>