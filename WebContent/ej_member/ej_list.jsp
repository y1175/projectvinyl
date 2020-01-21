<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->

<!-- jQuery -->
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->

<style>
#ej_searchbox{border:1px solid silver;
width: 60%;
padding: 20px;}
#ej_line{border:0.5px solid silver;}
</style>



<script>

function delconfirm(){

	var jbResult = confirm( '해당 회원을 삭제 하시겠습니까?' );
	//document.write( jbResult );	
}
$(document).ready(function(){
	 $('#exampleModal').on('show.bs.modal', function (event) {//보여지는 시점에서 이벤트 발생
		   console.log('rteeeets');
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  var recipient = button.data('whatever'); // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  console.log('test');
		  var modal = $(this);
		 //modal.find('.modal-title').text('New message to ' + recipient)
		  modal.find('.modal-body input').val(recipient);
		  console.log(button);
		  console.log(modal+"!!!"); 
		});
	
	
});

</script>



<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원조회</h3>
<!--setAttribute로 지정한것 변수로 받아오기  -->
<c:set var="list" value="${requestScope.list }"/>
<c:set var="currpage" value="${requestScope.currpage }"/>
<c:set var="startblock" value="${requestScope.startblock }"/>
<c:set var="endblock" value="${requestScope.endblock }"/>
<c:set var="totalpage" value="${requestScope.totalpage }"/>
<c:set var="search" value="${requestScope.search }"></c:set>
<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set> 

<form method="post" action="ej_list.do"><!--처음에 list.do햇음  -->
<div id="ej_searchbox">
<select name="search"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value="id">아이디</option>
	<option value="name">이름</option>
</select>
<input type="text" name="txtsearch">
<!-- <input type="submit" value="검색"> -->

<div id="ej_line"></div>
<label for="point">구매액</label>
<input type="text" name="stxtsearch1">원~<input type="text" name="stxtsearch2">원<br>
<input type="submit" value="상세검색"> 
</div>



<table>
<thead><tr><th>선택</th><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>구매액</th><th>적립금</th>
<th>                  <th><th>삭제</th></tr>
</thead>
<tbody>
	<!--arraylist니까 foreach  -->
	<c:forEach var="item" items="${list}">
	<tr>
 	<td><input type="checkbox" name="select" id="select" value="${item.memNo }" ></td>
	<td><c:out value="${item.memNo }"></c:out></td> 
	<td>${item.id }</td>
	<td>${item.pwd }</td>
	<td>${item.name }</td>
	<td>${item.total }원</td>
	<td><%-- <a href="ej_insert.do?memNo=${item.memNo}" target="_blank"  >${item.point }포인트</a> --%>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
	 data-whatever="${item.memNo }">
  ${item.point }포인트
</button>
	<td> 
<!--target="_blank"  -->
	<td><a href="ej_delete.do?memNo=${item.memNo}" onclick="delconfirm();">삭제</a><td>


	</tr>
	 </c:forEach>
	 
</tbody>
</table><br>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">New message</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label" >Recipient:</label>
            <input type="text" class="form-control" id="recipient-name" name="what">
          </div>
          <!-- <div class="form-group"> -->
           <!--  <label for="message-text" class="control-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea> -->
          
          <!--  --></div>
        </form>
         <form method="post" action="ej_list.do">
            <input type="text" name="addpoint" id="addpoint">
            <input type="submit" value="적립">
            </form>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">적립</button>
      </div> -->
        
    </div>
   
  </div>
  
</div>



<div class="btn-group" role="group" aria-label="...">
<c:forEach var="i" begin="${starblock }+1" end="${endblock }" step="1">
	<c:if test="${currpage==i }">
	 <button type="button" class="btn btn-default"
	  onclick="location.href='ej_list.do?curr=${i }&search=${search}&txtsearch=${txtsearch }'">${i }</button>
	<%-- <c:out value="${i }"/> --%>
	
	</c:if>

	<c:if test="${currpage!=i }">
	 <button type="button" class="btn btn-default"
	  onclick="location.href='ej_list.do?curr=${i }&search=${search}&txtsearch=${txtsearch }'">${i }</button>
	<%-- <a href="ej_list.do?curr=${i }&search=${search}&txtsearch=${txtsearch }">${i }</a> --%>
	</c:if>
</c:forEach><br>
</div>





</form>





</body>
</html>