<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<% %>
<!--setAttribute로 지정한것 변수로 받아오기  -->
<c:set var="list" value="${requestScope.list }"/>
<c:set var="currpage" value="${requestScope.currpage }"/>
<c:set var="startblock" value="${requestScope.startblock }"/>
<c:set var="endblock" value="${requestScope.endblock }"/>
<c:set var="totalpage" value="${requestScope.totalpage }"/>
<c:set var="search" value="${requestScope.search }"></c:set>
<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set> 

<form method="post" action="yiadminboard.do"><!--처음에 list.do햇음  -->
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
<thead><tr><th>선택</th><th>회원번호</th><th>아이디</th><th>글번호</th><th>글제목</th><th>추천수</th>
<th>                  <th><th>게시글삭제</th></tr>
</thead>
<tbody>
	<!--arraylist니까 foreach  -->
	<c:forEach var="item" items="${list}">
	<tr>
 	<td><input type="checkbox" name="select" id="select" value="${item.memNo }" ></td>
	<td><c:out value="${item.memNo }"></c:out></td> 
	<td>${item.id }</td>
	<td>${item.bno }</td>
	<td>${item.btitle }</td>
	<td>${item.like }</td>
	
		
		
	<td><a href="yiadminboard.do?memNo=${item.memNo}">삭제</a><td>


	</tr>
	 </c:forEach>
</tbody>
</table><br>
<c:forEach var="i" begin="${starblock }+1" end="${endblock }" step="1">
	<c:if test="${currpage==i }">
	<c:out value="${i }"/>
	
	</c:if>

	<c:if test="${currpage!=i }">
	<a href="yiadminboard.do?curr=${i }&search=${search}&txtsearch=${txtsearch }">${i }</a>
	</c:if>
</c:forEach><br>

<%-- <input type="hidden" name="memno" value="${item.memNo }"> --%>





</form>

</body>
</html>