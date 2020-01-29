<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/yi_qnaadmin.css">
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
<script>


function send(){/* document.form이름.submit() */
	if(document.frm.title.value!="")
		document.frm.submit();
}//send()

$(document).ready(function(){
	let no=${dto.boardno};
	console.log("no:",no);
	$.ajax({
		url:'subdetail.do'
		,data:{'num':no}
		,dataType: 'json'//json으로 하면 ~.do로 자료 사용하는건맞음 SubDetailAction implements 하면안됨
		//class로 하면 자료 받을 수 없다. class가 아닌 servlet만들면됨 객체만들필요없다
		//ublic class SubDetailAction /*implements Action */{//파라미터 받아줘야함

		
	

		,method:'post'//post방식으로 하면 숨겨서 넘김
		,success:function(data)
		{
			$.each(data,function(index,item){
				console.log(index);
				console.log(item);
				console.log(item.subno);
				//let result="<tr><td>"+item.subno+"</td>";//따로 넣어야됨 . 이건 시퀀스인듯
				let result="<tr>";
				result+="<td>"+item.subtitle+"</td>";
				result+="<td>"+item.writer;
				result+="<input type='button' value='삭제' onclick=del("+item.subno+","+item.boardno+")>";
				//result+="<td>"+item.boardno+"</td>";//1번글에 대한 댓글임을 보여줌. 따라서 출력할 필요없음
				result+="</td></tr>";
				$('#result').append(result);
				});
			
		}
		,error:function(data)
		{
			console.log('error',data);
		}
	});
	
});
</script>
<style>
/* header nav 질문과 답변관리 글씨색상  */
  .hs_header_nav > a:nth-child(3){
    color: rgb(0, 153, 255);
  }
</style>
<meta charset="utf-8">
<title>Homedream</title>
</head>
<body>

<% %>
<!--setAttribute로 지정한것 변수로 받아오기  -->
<c:set var="list" value="${requestScope.list }"/>
<c:set var="currpage" value="${requestScope.currpage }"/>
<c:set var="startblock" value="${requestScope.startblock }"/>
<c:set var="endblock" value="${requestScope.endblock }"/>
<c:set var="totalpage" value="${requestScope.totalpage }"/>
<c:set var="search" value="${requestScope.search }"></c:set>
<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set> 


  <div style="margin: -10px 0px 50px;">
    <form method="post" action="yiqnaadmin.do">
    <div class="yi_question_titlediv">
       <div class="yi_questionsearch_searchbox">
        <select name="search" class="yi_questionsearch_searchop">
        	<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="title">글제목</option>
        </select> 
        <i class='fas fa-search' style="padding: 5px;"></i>
        <input type="text" id="yi_questionsearchtxt" name="txtsearch" placeholder="검색">
       </div>
      </div>
     </form>
   </div>
<!-- <input type="submit" value="검색"> -->






<table class='table table-hover'>
<thead class='thead-dark'><tr><th>선택</th><th>글번호</th><th>아이디</th><th>회원번호</th><th>질문제목</th><th>질문날짜</th><th>답변하기</th><th></th><th>삭제</th><th></th></tr>
</thead>
<tbody>
	<!--arraylist니까 foreach  -->
	<c:forEach var="item" items="${list}">
	<tr>
 	<td><input type="checkbox" name="select" id="select" value="${item.q_no }" ></td>
	<td>${item.q_no }</td> 
	<td>${item.id }</td>
	<td>${item.mem_no }</td>
	<td>${item.title }</td>
	<td>${item.qdate }</td>
	
	
	<td><a href="hs_questiondetail.do?no=${item.q_no}" class="btn btn-outline-info">답변하기</a><td>
	<td><a href="yiqnadelete.do?q_no=${item.q_no}" class="btn btn-danger">삭제</a><td>


	</tr>
	 </c:forEach>
</tbody>
</table><br>
<div class="container">
<div class="row">
<div class="col"></div>
<ul class='pagination'>
<c:if test="${startblock > 1 }">
	<li><a class="page-link" href="yiqnaadmin.do?curr=${startblock-1 }&search=${search }&txtsearch=${txtsearch }">이전 블럭으로</a></li>
</c:if>

<c:if test="${currpage > 1 }">
	<li><a class="page-link" href = "yiqnaadmin.do?curr=${currpage -1 }&search=${search }&txtsearch=${txtsearch}">이전</a></li>
</c:if>

<c:forEach var = "i" begin="${startblock}" end="${endblock}" step ="1">
	<c:if test="${currpage ==i }">
		<!-- 같으면 그냥 출력 -->
		<li class="page-item active" ><a class="page-link" href="yiqnaadmin.do?curr=${i}" ><c:out value="${i}" /></a></li>
	</c:if>
	<c:if test="${currpage != i }">
		<!-- 다르면 링크 걸어주고 시작 -->
		<li><a class='page-link' href="yiqnaadmin.do?curr=${i}&search=${search}&txtsearch=${txtsearch}">${i}</a></li>
	
	</c:if>


</c:forEach>

<c:if test="${currpage < totalpage }">
	<li><a class='page-link' href = "yiqnaadmin.do?curr=${currpage +1 }&search=${search }&txtsearch=${txtsearch}">다음</a>
</c:if>

<c:if test="${endblock < totalpage }">
	<li><a class="page-link" href = "yiqnaadmin.do?curr=${endblock +1 }&search=${search }&txtsearch=${txtsearch}">다음블럭으로</a>
</c:if>
</ul>
<div class="col"></div>
</div>
</div>
<br>
<%-- <input type="hidden" name="memno" value="${item.memNo }"> --%>





</body>
</html>