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
/* 
$(document).ready(function(){
	
	$("#delete").on("click", function(){
	   
	    $("input[type='checkbox']").each(function() {

	 	   // this.checked = true; //checked 처리

	 	   
	 	    if(this.checked){//checked 처리된 항목의 값. memNo받아옴

	 	          
	 	    	console.log(this.value);
	 	    	

	 	    }

	 	});
	    alert("선택 회원이 삭제 되었습니다.");
	    //location.href="delete.jsp";//블로그에는 .html로 되잇음
	});
	

}); */
/* $(document).ready(function () {
	let values=[];
	//select
	 $('#delete'.on('click',function(){

			$("input[name='select']:checked").each(function(i)
					{
				
				let hi=($this).val()
				values.push(($this).val());
				alert(hi);
				
					});
	let memno=$('checkbox').val();
	alert(memno);
	let values=[];
	$.ajax({
		url:"delete.do",
		type:'post',
		data: values,
		success:function(data){
			alert("완료!");
		
		},
		error:function(jqXHR, textStatus, errorThrown){
			alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
	
	
});//delete click  */

});//ready

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

<form method="post" action="list.do"><!--처음에 list.do햇음  -->
<div id="searchbox">
<select name="search"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value="id">아이디</option>
	<option value="name">이름</option>
</select>
<input type="text" name="txtsearch">
<input type="submit" value="검색">

<div id="line"></div>
<label for="point">적립금</label>
<input type="text" name="stxtsearch">~<input type="text" name="stxtsearch"><br>
<input type="submit" value="상세검색">
</div>



<table>
<thead><tr><th>선택</th><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th></tr>
</thead>
<tbody>
	<!--arraylist니까 foreach  -->
	<c:forEach var="item" items="${list}">
	<tr>
 	<td><input type="checkbox" name="select"
	 id="select" value="${item.memNo }" "></td>
	<td><c:out value="${item.memNo }"></c:out></td> 
	<td>${item.id }</td>
	
	<td>${item.pwd }</td>
	<td>${item.name }</td>
	</tr>
	 </c:forEach>
</tbody>
</table><br>
<c:forEach var="i" begin="${starblock }+1" end="${endblock }" step="1">
	<c:if test="${currpage==i }">
	<c:out value="${i }"/>
	
	</c:if>

	<c:if test="${currpage!=i }">
	<a href="list.do?curr=${i }&search=${search}&txtsearch=${txtsearch }">${i }</a>
	</c:if>
</c:forEach><br>





<input type="submit" value="적립금">

<input type="submit" id="delete" value="삭제">
</form>

</body>
</html>