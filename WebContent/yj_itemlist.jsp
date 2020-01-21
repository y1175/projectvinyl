<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#container{
		width: 70%;
		margin: 0px auto;		
	}
	table {
		width: 100%;
	}
	tr td{
		border: 1px solid black;
		text-align: center;
	}
	img{
		width: 100px;
		height: 100px;
	}	
	#update, #delete {
		text-decoration: none;
		color: black;
		border: 1px solid silver;
		padding: 5px 15px;
	}
	
	
</style>
<body>
	<div id="container">
		<form id="frm" method="post" action="#">
			<table>
				<thead>
					<tr>
						<td>ㅁ</td>
						<td>NO</td>
						<td>이미지</td>
						<td>상품명</td>
						<td>판매가</td>
						<td>재고</td>
						<td>관리</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="checkbox" value="1">
						</td>
						<td>1</td>
						<td><img src="img/jini2.jpg"></td>
						<td><h1>가나다라마바사아자차카타의자</h1></td>
						<td><h2>30,000원</h2></td>
						<td><h2>15개</h2></td>
						<td>
							<button id="update" >수정</button>
							<button id="delete" class="btn btn-outline-danger">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>