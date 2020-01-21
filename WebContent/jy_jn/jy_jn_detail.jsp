<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                
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
<!-- Bootstrap -->
<style>
/* header nav 집들이 앤 노하우 글씨색상  */
  .hs_header_nav > a:nth-child(2){
    color: rgb(0, 153, 255);
  }
</style>
<script>

function send(){
	if(document.frm.subcontent.value!="")
		document.frm.submit();
}

function del(sno,bno){
	location.href="jy_subdelete.do?rno="+sno+"&bno="+bno
}

$(document).ready(function(){
	let no = ${dto.bno}
	$.ajax({
		url:'jy_subdetail.do'
		,data:{'num':no}
		,dataType:'json'
		,method :'post'
		,success:function(data){
			$.each(data, function(index,item){
			let result ="<thead><tr><th>작성자</th><th>내용</th></tr></thead><tbody>"
				result+="<td>"+item.subid+"</td>";
				result+="<td>"+item.content+"</td>";
				result+="<td><input type='button' value='삭제' onclick='del("+item.rno+","+item.bno+")'></td>";
				result+="</tr></tbody>";
				$('#result').append(result);
				// 하단에 내가 쓴 댓글들이 추가가 됨
			})
		}
		,error:function(data){
			console.log('error',data);
			// 네트워크 부분을 보면 내가 선택한 글의 번호가 나옴
		}
	})
});

</script>

</head>

<body>
<div class="container">
 <header>
  <jsp:include page="/hs_communityheader.jsp"></jsp:include>
 </header>


<c:set var="dto" value="${requestScope.dto}"/>
<ul>
<li>
<label for="bno">글번호</label><br>
<c:out value="${dto.bno }"/><br>
</li>
<li>
<label for="btitle">제목</label><br>
<c:out value="${dto.btitle }"/><br>
</li>
<li>
<label for="bcontent">내용</label><br>
<c:out value="${dto.bcontent }"/><br>
</li>
<li>
<label for="likeno">좋아요</label><br>
<c:out value="${dto.likeNo }"/><br>
</li>
<li>
<label for="readno">조회수</label><br>
<c:out value="${dto.readNo }"/><br>
</li>
<li>
<label for="file_name">업로드 한 사진</label><br>
 <img src="upload/${dto.file_name}" alt="${file }">
</li>
<li>
<input type="button" onclick="location.href='jy_likeno.do?num=${dto.bno}'" value="좋아요">
</li>
</ul>
<a href="jy_list.do">목록으로</a>
<a href="jy_update.do?num=${dto.bno }">수정</a>
<a href="jy_delete.do?num=${dto.bno }">삭제</a>


  
  <c:set var="subid" value="${requestScope.subid}"/>
  
  
<h3>--댓글--</h3>


<form method="post" action="jy_subadd.do" name="frm">

<input type="hidden" name="num" value="${dto.bno}">
<%-- 
 <label for="subid">아이디</label> <br>
<!-- 로그인이랑 연결시킨 다음에 세션으로 연결, 로그인한 아이디 값 받아와서 readonly로 잡기 현재는 임시로 그냥 아무 값이나 넣겠음-->
<c:out value="${requestScope.subid}"/><br> 

 --%>
<label for="subcontent">댓글</label>
<textarea rows="3" cols="20" name="subcontent" id="subcontent"></textarea><br>

<input type="button" onclick="send()" value="등록">
<input type="reset" value="취소"> 
</form>
<div id="result"></div>

<footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div> 


</body>
</html>