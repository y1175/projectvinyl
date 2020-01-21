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
	width: 60%;
	margin: auto;
}

#imgblock {
	border: 1px solid black;
	width: 600px;
	height: 300px;
}

.tableH {
	width: 20%;
	font-weight: bold;
	text-align: center;	
}

.theight {
	height: 50px;
}
table {
	width: 100%;
}

textarea{
	width: 80%;
	height: 200px;
}
#btn{
	text-align: right;
}
</style>
<body>
	<div id="container">
		<form method="post" action="yj_insertResult.do" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td class="theight tableH">이미지</td>
						<td colspan="3">
							<input type="file" id="fileupload" name="fileupload">
						</td>
					</tr>
					<tr>
						<td class="theight tableH">카테고리</td>
						<td>
							<select name="categori">
								<option>카테고리 선택</option>
								<c:forEach var="dto" items="${list }">
									<option value="${dto.cNo }">${dto.cname }</option>
								</c:forEach>
							</select>
						</td>
						<td class="theight tableH">업체명</td>
						<td><input type="text" id="company" name="company"></td>
					</tr>
					<tr>
						<td class="theight tableH">상품명</td>
						<td colspan="3"><input type="text" id="name" name="name" required="required"></td>
					</tr>
					<tr>
						<td class="tableH">상품설명</td>
						<td colspan="3"><textarea id="content" name="content"></textarea></td>
					</tr>
					<tr>
						<td class="theight tableH">가격</td>
						<td><input type="text" id="price" name="price" required="required">원</td>
						<td class="theight tableH">재고</td>
						<td><input type="text" id="stock" name="stock" required="required">개</td>
					</tr>
					<tr>
						<td class="theight tableH">세일</td>
						<td colspan="3">
							<input type="radio" name="sale" value="10">10%
							<input type="radio" name="sale" value="20">20%
							<input type="radio" name="sale" value="30">30%
							<input type="radio" name="sale" value="0">없음
						</td>
					</tr>
				</tbody>
			</table>
			<div id="btn">
				<input type="submit" value="상품등록">
				<input type="button" value="취소">
			</div>
		</form>
	</div>
</body>
</html>