<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈드림</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/yi_loginform.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="/hs_communityheader.jsp"></jsp:include>
		</header>

			<div class="row">
				<div class="col"></div>
				<div class="col">
						
					<form method="post" action="yiloginresult.do">
					<div class="loginform">
						<div class="form-group">

							<label for='id'>아이디</label> <input type="text" name="id" id="id"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label for="pwd">패스워드</label> <input type="password" name="pwd"
								id="pwd" class="form-control" required>

						</div>
						<input type="submit" value="로그인" class="btn btn-info">
						<input type="button" value="회원가입" class="btn btn-outline-info" onclick="location.href='yijoin.do'">
						</div>
					</form>
					
				</div>
				<div class="col"></div>
			</div>

		<footer>
			<jsp:include page="/hs_user_footer.jsp"></jsp:include>
		</footer>
	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>