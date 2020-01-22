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

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->

<style>
#ej_searchbox{border:1px solid silver;
width: 80%;
padding: 20px;
margin: auto;}
.ej_searchbox1{
position:relative;
	left:202px;
    width: 60%;	
    background-color:white;
    border: 1px solid #757575;
    border-radius: 5px;
}

.ej_searchop{
	width :13%;
	border: 1px transparent;
	padding: 5px;
	border-radius: 5px;
}
.ej_selectbox{
width:150px;
margin:6px;
border-radius: 5px;
}
#ej_line{border:0.5px solid silver;}
.ej_all{
margin: auto;
text-align: center;
}
ul li{
list-style:none;
}
table{
width:80%;
margin: auto;
text-align: center;}
.ej_page{
margin: auto;
text-align: center;
}
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
<%request.setCharacterEncoding("UTF-8");%>
<div class="container">
     <header>
         <jsp:include page="/hs_memberadminheader.jsp"></jsp:include>
     </header>
     <div class="ej_all">
<h3>주문배송관리</h3>
<!--setAttribute로 지정한것 변수로 받아오기  -->
<c:set var="list" value="${requestScope.list }"/>
<c:set var="currpage" value="${requestScope.currpage }"/>
<c:set var="startblock" value="${requestScope.startblock }"/>
<c:set var="endblock" value="${requestScope.endblock }"/>
<c:set var="totalpage" value="${requestScope.totalpage }"/>
<c:set var="search" value="${requestScope.search }"></c:set>
<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set> 

<form method="post" action="ej_orderlist.do"><!--처음에 list.do햇음  -->
<div id="ej_searchbox">
<div class="ej_searchbox1">
<select name="search" class="ej_searchop"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value="orderno">주문번호</option>
	<option value="memno">회원번호</option>
</select>

<input type="text" name="txtsearch">
</div>
<br>
<div id="ej_line"></div>
<label for="cost">가격</label>
<input type="text" name="stxtsearch1">원~<input type="text" name="stxtsearch2">원<br>
<input class="btn btn-primary" type="submit" value="상세검색">
<!-- <input type="submit" value="상세검색">  -->
</div>
</form>


<table>
<thead><tr><th>선택</th><th>주문번호</th><th>회원번호</th><th>물품번호</th>
<th>주문날짜</th><th>주문상태</th><th>가격</th><th>비고</th></tr>
</thead>

<tbody>
	<!--array list니까 for each  -->
	<c:forEach var="item" items="${list}">
	<c:choose> 
<c:when test="${item.status == 0 }">
<c:set var="temp" value="주문취소"></c:set>
</c:when>
<c:when test="${item.status == 1 }">
<c:set var="temp" value="결제확인"></c:set>
</c:when>
<c:when test="${item.status == 2 }">
<c:set var="temp" value="배송준비중"></c:set>
</c:when>
<c:when test="${item.status == 3 }">
<c:set var="temp" value="배송중"></c:set>
</c:when>
<c:when test="${item.status == 4 }">
<c:set var="temp" value="배송완료"></c:set>
</c:when>
<c:when test="${item.status == 5 }">
<c:set var="temp" value="취소승인"></c:set>
</c:when>
</c:choose>
	
	<tr>
 	<td><input type="checkbox" name="select" id="select" value="${item.memno }" ></td>
	<td><c:out value="${item.orderno }"></c:out></td> 
	<td>${item.memno }</td>
	<td>${item.itemno }</td>
	<%-- <c:set var="temp" value="${item.status }"/>
	<c:if test= "${item.status }==0">
	<c:set var="temp" value="cancel"/>
	</c:if> --%>
	<td>${item.orderdate }</td>
	<td>
	<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal"
	 data-whatever="${item.orderno }">${temp }</button></td>
	 <!-- btn btn-primary 클래스 이거 엿음 -->
<%-- 	<td><a href="ej_update.do?orderno=${item.orderno}" target="_blank" >${temp}</a> --%>
	
	
	<td>${item.cost }원</td>
	<td><a class="btn btn-outline-secondary" 
	href="ej_orderdelete.do?orderno=${item.orderno}" onclick="delconfirm();">삭제</a></td>


	</tr>
	 </c:forEach>
</tbody>
</table><br>
 <form method="post" action="ej_update.do">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel" >주문상태변경</h4>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
    
      <div class="modal-body">
     
          <div class="form-group">
          <ul>
          <li>
            <label for="recipient-name" class="control-label" >주문번호</label>
            <input type="text" class="form-control" id="recipient-name" name="what" readonly="readonly" maxlength="3">
            </li></ul>
          </div>
      </div>
        
         
  <ul>
  <li>
<select name="status" class="ej_selectbox">
	<option value=1>결제확인</option>
	<option value=2>배송준비중</option>
	<option value=3>배송중</option>
	<option value=4>배송완료</option>
	<option value=5>취소승인</option>
</select>
<input type="submit" value="변경" >
      </li> </ul>        
      </div>
    
    
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">적립</button>
      </div> -->
        
    </div>
    </form>
  </div>
  
</div>
 



<div class="ej_page">
<div class="btn-group" role="group" aria-label="aria">
<c:forEach var="i" begin="${starblock }+1" end="${endblock }" step="1">
	<c:if test="${currpage==i }">
	<button type="button" class="btn btn-default" 
	 onclick="location.href='ej_orderlist.do?curr=${i }&search=${search}&txtsearch=${txtsearch }'">${i }</button>
	<%-- <c:out value="${i }"/> --%>
	
	</c:if>

	<c:if test="${currpage!=i }">
	 <button type="button" class="btn btn-default" 
	 onclick="location.href='ej_orderlist.do?curr=${i }&search=${search}&txtsearch=${txtsearch }'">${i }</button>
	 <!-- 이전에 햇던거 다시쓸수도있음 -->
	<%-- <a href="ej_orderlist.do?curr=${i }&search=${search}&txtsearch=${txtsearch }">${i }</a> --%>
	</c:if>
</c:forEach><br>
</div>
</div>
<%-- <input type="hidden" name="memno" value="${item.memNo }"> --%>



</div> <!--div class=ej_all  -->
     <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>

</body>
</html>