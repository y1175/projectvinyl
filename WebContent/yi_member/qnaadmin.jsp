<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
#searchbox{border:1px solid silver;
width: 60%;
padding: 20px;}
#line{border:0.5px solid silver;}
</style>

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
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
     <header>
         <jsp:include page="/hs_communityadminheader.jsp"></jsp:include>
     </header>
<% %>
<!--setAttribute로 지정한것 변수로 받아오기  -->
<c:set var="list" value="${requestScope.list }"/>
<c:set var="currpage" value="${requestScope.currpage }"/>
<c:set var="startblock" value="${requestScope.startblock }"/>
<c:set var="endblock" value="${requestScope.endblock }"/>
<c:set var="totalpage" value="${requestScope.totalpage }"/>
<c:set var="search" value="${requestScope.search }"></c:set>
<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set> 

<form method="post" action="yiqnaadmin.do"><!--처음에 list.do햇음  -->
<div id="searchbox">
<select name="search"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value="id">아이디</option>
	<option value="name">이름</option>
	<option value="btitle">글제목</option>
</select>
<input type="text" name="txtsearch">
<!-- <input type="submit" value="검색"> -->


</div>



<table>
<thead><tr><th>선택</th><th>글번호</th><th>아이디</th><th>회원번호</th><th>질문제목</th><th>질문날짜</th><th>답변하기</th><th>삭제</th></tr>
</thead>
<tbody>
	<!--arraylist니까 foreach  -->
	<c:forEach var="item" items="${list}">
	<tr>
 	<td><input type="checkbox" name="select" id="select" value="${item.q_no }" ></td>
	<td><c:out value="${item.q_no }"></c:out></td> 
	<td>${item.id }</td>
	<td>${item.mem_no }</td>
	<td>${item.title }</td>
	<td>${item.qdate }</td>
	
	
	<td><a href="hs_questiondetail.do?no=${item.q_no}">답변하러가기</a><td>
	<td><a href="yiqnadelete.do?q_no=${item.q_no}">삭제</a><td>


	</tr>
	 </c:forEach>
</tbody>
</table><br>
<c:if test="${startblock > 1 }">
	<a href="yiqnaadmin.do?curr=${startblock-1 }&search=${search }&txtsearch=${txtsearch }">이전 블럭으로</a>
</c:if>

<c:if test="${currpage > 1 }">
	<a href = "yiqnaadmin.do?curr=${currpage -1 }&search=${search }&txtsearch=${txtsearch}">이전</a>
</c:if>

<c:forEach var = "i" begin="${startblock}" end="${endblock}" step ="1">
	<c:if test="${currpage ==i }">
		<!-- 같으면 그냥 출력 -->
		<c:out value="${i}"/>
	</c:if>
	<c:if test="${currpage != i }">
		<!-- 다르면 링크 걸어주고 시작 -->
		<a href="yiqnaadmin.do?curr=${i}&search=${search}&txtsearch=${txtsearch}">${i}</a>
	
	</c:if>


</c:forEach>

<c:if test="${currpage < totalpage }">
	<a href = "yiqnaadmin.do?curr=${currpage +1 }&search=${search }&txtsearch=${txtsearch}">다음</a>
</c:if>

<c:if test="${endblock < totalpage }">
	<a href = "yiqnaadmin.do?curr=${endblock +1 }&search=${search }&txtsearch=${txtsearch}">다음블럭으로</a>
</c:if>
<br>
<%-- <input type="hidden" name="memno" value="${item.memNo }"> --%>


</form>

 <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>

</body>
</html>