<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="css/hm_upload.css?ver=2">
</head>
<body>

<div class ="hm_uploadfirst">
<h2>업체 등록</h2>
</div>

<form method = "post" action="hm_uploadresult.do" enctype="multipart/form-data">


		<div class="input-group flex-nowrap" style="margin : 30px auto 30px; width:80%;">
			<div class="input-group-prepend">
				<span class="input-group-text" id="addon-wrapping"><span style="margin-left: 15px; ">업체명</span></span>
			</div>
			<input type="text" class="form-control" placeholder="Company name" name = "name"
				aria-label="Username" aria-describedby="addon-wrapping">
		</div>
			
			<div class="input-group" style="margin : 0px auto 30px; width:80%;">
				<div class="input-group-prepend">
					<span class="input-group-text" id="addon-wrapping"><span style="margin:0px auto;">업체소개</span></span>
				</div>
				<textarea class="form-control" aria-label="With textarea" name ="content"></textarea>
			</div>

			<div class="input-group mb-3" style="margin : 0px auto 30px; width:80%;">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1"><span style="margin:0px auto;">위치</span></span>
				</div>
				<input type="text" class="form-control" placeholder="District" name = "place"
					aria-label="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group" style="margin : 0px auto 30px; width:80%;">
				<div class="input-group-prepend">
					<span class="input-group-text" id="addon-wrapping" ><span style="margin:0px auto;">위도&경도</span></span>
				</div>
				<input type="text" aria-label="위도" class="form-control"  name = "lat" placeholder="Latitude">
				<input type="text" aria-label="경도" class="form-control" name = "lon" placeholder="Longitude">
			</div>


			<div class="input-group mb-3" style="margin : 0px auto 30px; width:	80%;">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1" ><span style="margin:0px auto;">상세주소</span></span>
				</div>
				<input type="text" class="form-control" placeholder="Address"
					name="addr" aria-label="Username" aria-describedby="basic-addon1">
			</div>

			<div class="input-group mb-3" style="margin : 0px auto 30px; width:80%;">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroupFileAddon01" ><span span style="margin:0px auto;">파일업로드</span></span>
			</div>
			<div class="custom-file" >
				<input type="file" class="custom-file-input" id="inputGroupFile01" name="uploadfile" aria-describedby="inputGroupFileAddon01" >
				<label class="custom-file-label" for="inputGroupFile01">Choose
					file</label>
			</div>
		</div>

			<ul>
	
				<input type="submit" value="등록">
				<input type="reset" value="취소">
		
			</ul>
		</form>



	 
	 
</body>
</html>