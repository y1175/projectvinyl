<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
<style>
/* header nav 전문가찾기 글씨색상  */
  .hs_header_nav > a:nth-child(2){
    color: rgb(0, 153, 255);
  }
/* 건들이지 마 */

#ej_orderbutton{
width:110px;
}

#ej_searchbox{border:1px solid silver;
width: 100%;
padding: 20px;
margin: 12px auto;
/* backgroud-color: solid silver !important; */
}
.ej_searchbox1{
position:relative;
	left:190px;
    width: 50%;	
    background-color:white;
    border: 1px solid #757575;
    border-radius: 5px;
}
.ej_txtsearch{
width:72%;
border: 1px transparent;}

.ej_searchop{
	width :24%;
	border: 1px transparent;
	padding: 5px;
	border-radius: 5px;
	position:relative;
	right:5px;
}

#ej_search{
width:29px;
height:29px;
margin:8px;
position:relative;
top:13px;
/* border: 1px solid silver; */
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
.ej_deliveryimage{
width:50px;
height:50px;}

.ej_form-control{
width:100px;
/* background-color:silver; */
border: 1px transparent;
font-size: 20px;
}
.ej_selectbox{
width:130px;
font-size: 20px;
background-color: rgb(220, 234, 248);
}
.ej_control-label{
font-size: 20px 0px 0px 0px;}
#ej_check{
position:relative;
top:5px;
width:30px; height:30px;}
.modal-body{
padding:20px 0px 0px 0px;
}
.ej_modalfooter{
padding: 0px 0px 15px 0px;}
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
     <div class="ej_all">
<img src="http://localhost:9080/projectvinyl/img/ej_delivery.png" alt="delivery"
 class="ej_deliveryimage"><h3>주문배송관리</h3>
<form method="post" action="ej_orderlist.do">
<c:set var="list" value="${requestScope.list }"/>
<c:set var="currpage" value="${requestScope.currpage }"/>
<c:set var="startblock" value="${requestScope.startblock }"/>
<c:set var="endblock" value="${requestScope.endblock }"/>
<c:set var="totalpage" value="${requestScope.totalpage }"/>
<c:set var="search" value="${requestScope.search }"></c:set>
<c:set var="txtsearch" value="${requestScope.txtsearch }"></c:set> 


<div id="ej_searchbox">
<div class="ej_searchbox1">
<select name="search" class="ej_searchop"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value="orderno">주문번호 </option>
	<option value="memno">회원번호 </option>
</select>

<input type="text" name="txtsearch" 
class="ej_txtsearch" placeholder="주문 배송을 검색해보세요">
</div>
<br>
<div id="ej_line"></div>

<label for="cost">가격</label>
<input type="text" name="stxtsearch1" class="ej_stxtsearch1" placeholder="원">~
<input type="text" name="stxtsearch2" class="ej_stxtsearch2" placeholder="원">
<input type="image" 
src="http://localhost:9080/projectvinyl/img/ej_search.png" alt="search"
id="ej_search">
<!-- <input  type="submit" value="상세검색" id="ej_submit" alt="submit"> -->
<!--class="btn btn-primary" 상세검색에 이거 썻엇음 -->
<!-- <input type="submit" value="상세검색">  -->
</div>
</form>


<table class="table">
<thead class="thead-dark"><tr><th scope="col">선택</th><th scope="col">주문번호</th>
<th scope="col">회원번호</th><th scope="col">물품번호</th>
<th scope="col">주문날짜</th><th scope="col">주문상태</th><th scope="col">가격</th><th scope="col">비고</th></tr>
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
	 data-whatever="${item.orderno }" id="ej_orderbutton">${temp }</button></td>
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
        <h4 class="modal-title" id="ej_exampleModalLabel" >주문상태변경</h4>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
    
      <div class="modal-body">
     
          <div class="form-group">
          <ul>
          <li>
            <label for="recipient-name" class="ej_control-label" >주문번호:</label>
            <input type="text" class="ej_form-control" id="recipient-name" name="what" readonly="readonly">
            </li></ul>
          </div>
      </div>
        
         
  <ul>
  <li>
  <div class="ej_modalfooter">
<select name="status" class="ej_selectbox">
	<option value=1>결제확인</option>
	<option value=2>배송준비중</option>
	<option value=3>배송중</option>
	<option value=4>배송완료</option>
	<option value=5>취소승인</option>
</select>
<input type="image" 
src="http://localhost:9080/projectvinyl/img/ej_check.png" alt="check"
id="ej_check">
 </div>
  
      </li> </ul> 
      </div>       
      </div>
    
    
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">적립</button>
      </div> -->
        
    </div>
    </form>
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

</body>
</html>