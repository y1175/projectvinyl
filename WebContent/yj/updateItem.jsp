<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 

</head>
<style>
#insertform{
	width: 60%;
	margin: 0 auto;
}
#uploadimg{
	width: 200px;
	height :200px;
}
#btn{
	text-align: right;
}
</style>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var fileName = input.files[0].name;
		}
		var reader = new FileReader();
		reader.readAsDataURL(input.files[0]);
		reader.onload = function(e) {
			$('#uploadimg').attr('src', e.target.result);
		}
	}

	$(document).ready(function() {
		$('#sub').click(function() {
			if ($('#categori').val() == '0') {
				alert("카테고리를 선택하세요");
				return;
			}
			if ($('input[name=sale]:checked').length == 0) {
				alert("세일 퍼센트를 선택하세요");
				return;
			}
			$('#frm').submit();
		});
		
		$('#can').click(function() {
			location.href="yj_itemlist.do";
		});

		$('#fileupload').on('change', function() {
			readURL(this);
		});
	});
</script>

<body>
	<div id="insertform">
		<form method="post" action="yj_updateResult.do"
			enctype="multipart/form-data" id="frm">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">이미지</th>
						<td colspan="3">
						<img id="uploadimg" alt="업로드 할 사진" src="">
						<input type="file" class="form-control-file" id="fileupload" name="fileupload">
						</td>
					</tr>
					<tr>
						<th scope="row">카테고리</th>
						<td><select class="form-control" name="categori" id="categori">
								<option value="0">카테고리 선택</option>
								<c:forEach var="dto" items="${list }">
									<option value="${dto.cNo }">${dto.cname }</option>
								</c:forEach>
						</select></td>
						<th scope="row">업체명</th>
						<td><input type="text" id="company" name="company" class="form-control"
							value="${dto.company }"></td>
					</tr>
					<tr>
						<th scope="row">상품명</th>
						<td colspan="3"><input type="text" id="name" name="name" class="form-control"
							required="required" value="${dto.name }"></td>
					</tr>
					<tr>
						<th scope="row">상품설명</th>
						<td colspan="3"><textarea class="form-control" rows="10" id="content" name="content">${dto.content }</textarea></td>
					</tr>
					<tr>
						<th scope="row">가격</th>
						<td><input type="text" id="price" name="price" class="form-control"
							required="required" value="${dto.price }"></td>
						<th scope="row">재고</th>
						<td><input type="text" id="stock" name="stock" class="form-control"
							required="required" value="${dto.stock }">
						</td>
					</tr>
					<tr>
						<th scope="row">할인율</th>
						<td colspan="3">
							<input type="radio" class="form-check form-check-inline" name="sale" value="10">10%
							<input type="radio" class="form-check form-check-inline" name="sale" value="20">20% 
							<input type="radio" class="form-check form-check-inline" name="sale" value="30">30% 
							<input type="radio" class="form-check form-check-inline" name="sale" value="0">없음
						</td>
					</tr>
				</tbody>
			</table>
			<div id="btn">
				<button type="button" id="sub" class="btn btn-info">수정</button>
				<button type="button" id="can" class="btn btn-outline-dark">취소</button>
				<input type="hidden" id="itemNo" name="itemNo" value="${itemNo }">
			</div>
		</form>
	</div>
</body>
</html>