<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
	
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->	
		
<style>
body {
	font-family: 'open sans';
	overflow-x: hidden;
	width: 80%;
	margin: 0 auto;
}

img {
	max-width: 100%;
}

.preview {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

@media screen and (max-width: 996px) {
	.preview {
		margin-bottom: 20px;
	}
}

.preview-pic {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.tab-content {
	overflow: hidden;
}

.tab-content img {
	width: 100%;
	-webkit-animation-name: opacity;
	animation-name: opacity;
	-webkit-animation-duration: .3s;
	animation-duration: .3s;
}

.card {
	margin-top: 50px;
	background: #eee;
	padding: 3em;
	line-height: 1.5em;
}

@media screen and (min-width: 997px) {
	.wrapper {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
	}
}

.details {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
}

.colors {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.product-title, .price, .sizes, .colors {
	text-transform: UPPERCASE;
	font-weight: bold;
}

.checked, .price span {
	color: #ff9f1a;
}

.product-title, .rating, .product-description, .price, .stock, .sizes {
	margin-bottom: 15px;
}

.product-title {
	margin-top: 0;
}

.size {
	margin-right: 10px;
}

.size:first-of-type {
	margin-left: 40px;
}

.color {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	height: 2em;
	width: 2em;
	border-radius: 2px;
}

.color:first-of-type {
	margin-left: 20px;
}

.add-to-cart, .like {
	background: #ff9f1a;
	padding: 1.2em 1.5em;
	border: none;
	text-transform: UPPERCASE;
	font-weight: bold;
	color: #fff;
	-webkit-transition: background .3s ease;
	transition: background .3s ease;
}

.add-to-cart:hover, .like:hover {
	background: #b36800;
	color: #fff;
}

.not-available {
	text-align: center;
	line-height: 2em;
}

.not-available:before {
	font-family: fontawesome;
	content: "\f00d";
	color: #fff;
}

.orange {
	background: #ff9f1a;
}

.green {
	background: #85ad00;
}

.blue {
	background: #0076ad;
}

.tooltip-inner {
	padding: 1.3em;
}

.img-detail {
	width: 250px;
	height: 500px;
}
</style>
</head>
<script>
	function buy(itemNo,mem_no) {
		//session에 저장되어있는 유저 번호로  mem_no찾기
		location.href="jy_buypage.do?mem_no=" + mem_no + "&item_no=" + itemNo;  
	}
</script>

<body>
  <div class="container">
     <header>
         <jsp:include page="hs_communityheader.jsp"></jsp:include>
     </header>

<c:set var="mem_no" value="${sessionScope.mem_no }"/>
<c:out value="${mem_no }"></c:out>
	<div class="dtail-container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">

						<div class="preview-pic tab-content">
							<div class="tab-pane active" id="pic-1">
								<img class="img-detail" src="img/${dto.fileName}" />
							</div>
							<div class="tab-pane" id="pic-2">
								<img class="img-detail" src="img/${dto.fileName}" />
							</div>
							<div class="tab-pane" id="pic-3">
								<img class="img-detail" src="img/${dto.fileName}" />
							</div>
							<div class="tab-pane" id="pic-4">
								<img class="img-detail" src="img/${dto.fileName}" />
							</div>
							<div class="tab-pane" id="pic-5">
								<img class="img-detail" src="img/${dto.fileName}" />
							</div>
						</div>

					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${dto.name }</h3>
						<div class="company">
							<span class="company">${dto.company }</span>
						</div>
						<pre class="product-description" style="white-spce: pre-wrap">${dto.content }</pre>
						<h4 class="price">
							가격 : <span>${dto.price }&#8361;</span>
						</h4>
						<p class="stock">
							재고 : <strong>${dto.stock }</strong>
						</p>
						<h5 class="colors">
							색깔 : <span class="color orange not-available"
								data-toggle="tooltip" title="Not In store"></span> <span
								class="color green"></span> <span class="color blue"></span>
						</h5>
						<c:if test="${dto.stock != 0 }">
							<div class="action">
								<button class="add-to-cart btn btn-default" type="button"
									onclick="buy(${dto.itemNo})">구매하기</button>
							</div>
						</c:if>
						<c:if test="${dto.stock == 0 }">
							<div class="action">
								<button class="btn btn-secondary btn-lg disabled" type="button" >재입고 대기중</button>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
 <footer>
         <jsp:include page="hs_user_footer.jsp"></jsp:include>
     </footer>
  </div>	
	
</body>
</html>