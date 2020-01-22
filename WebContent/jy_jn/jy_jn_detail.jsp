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
<link rel="stylesheet" href="css/jy_detail.css?ver=1">
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
			let result ="<tbody><tr style='padding-bottom : 10px;'><td><i class='fas fa-user-circle'style='font-size: 30px; margin-right: 20px;'></i></td>"
				result+="<td style='font-size: 17px; font-weight : 500; padding-right:20px;>"+item.subid+"</td>";
				result+="<td style='font-size: 15px; width : 93%;'>"+item.content+"</td>";
				result+="<td><input type='button' value='삭제' onclick='del("+item.rno+","+item.bno+")' style='border: 1px transparent; font-weight : 900; font-size : 13px; background-color: rgba(0, 153, 255, 0.7); color : white; padding: 5px 22px;'></td>";
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
  <div  class="jy_jn_detaildiv">
<ul>
<li>
     <a href="jy_list.do"><p class="jy_jn_detail_jn">집들이 &amp;노하우</p></a>
</li>
<li style="font-size:18px; font-weight: 800; margin-top: -10px;">
     <c:out value="${dto.btitle }"/>
     <br>
</li>
     <c:out value="${dto.id }"/>
    
<li>
<img src="upload/${dto.file_name}" alt="${file }" class="jy_img">
</li>
<li>
<p  style="margin: 30px 20px;">
${dto.bcontent }
<p>
</li>
<li>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="location.href='jy_likeno.do?num=${dto.bno}'" value="좋아요" ></button>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Like it!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">닫기</button>
      </div>
    </div>
  </div>
</div>
<input type="button" onclick="location.href='jy_likeno.do?num=${dto.bno}'" value="좋아요">
</li>
<li style="text-align: right; font-size: 12px; font-weight: 800; margin-right: 20px;">
작성일 <c:out value="${dto.writedate}"/>
좋아요 <c:out value="${dto.likeNo }"/>
조회수 <c:out value="${dto.readNo }"/>
</ul>
</div>
<div class="jy_jn_detail_divline"></div> <!-- 라인 -->
<div style="float: right;"> 
<a href="jy_update.do?num=${dto.bno }"><button class="jy_jn_detaildivbtn" >수정</button></a>
<a href="jy_delete.do?num=${dto.bno }"><button class="jy_jn_detaildivbtn" style="margin-left: 5px;">삭제</button></a>
</div>
<a href="jy_list.do"><button class="jy_jn_detaildivbtn">목록</button></a>
  
  <c:set var="subid" value="${requestScope.subid}"/>
  

<!-- Comments Form -->
        <div class="card my-4">
          <h5 class="card-header">댓글을 입력해주세요.</h5>
          <div class="card-body">
          <form method="post" action="jy_subadd.do" name="frm">
          <input type="hidden" name="num" value="${dto.bno}">
              <div class="form-group">
                <textarea class="form-control" rows="3" name="subcontent" id="subcontent"></textarea>
              </div>
              <button type="submit" class="btn btn-primary" onclick="send()" >등록</button>
              <button type="reset" class="btn btn-primary">취소</button>
            </form>
          </div>
        </div>





<%-- 
 <label for="subid">아이디</label> <br>
<!-- 로그인이랑 연결시킨 다음에 세션으로 연결, 로그인한 아이디 값 받아와서 readonly로 잡기 현재는 임시로 그냥 아무 값이나 넣겠음-->
<c:out value="${requestScope.subid}"/><br> 

 --%>

<div id="result"></div>




<footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div> 


</body>
</html>