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
</script>


<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
     <header>
         <jsp:include page="/hs_memberadminheader.jsp"></jsp:include>
     </header>
<h3>주문배송조회</h3>
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
<select name="search"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value="orderno">주문번호</option>
	<option value="memno">회원번호</option>
</select>

<input type="text" name="txtsearch">
<!-- <input type="submit" value="검색"> -->

<div id="ej_line"></div>
<label for="cost">가격</label>
<input type="text" name="stxtsearch1">원~<input type="text" name="stxtsearch2">원<br>
<input type="submit" value="상세검색"> 
</div>



<table>
<thead><tr><th>선택</th><th>주문번호</th><th>회원번호</th><th>물품번호</th>
<th>이름</th><th>주문상태</th><th>가격</th><th>삭제</th></tr>
</thead>
<tbody>
	<!--array list니까 for each  -->
	<c:forEach var="item" items="${list}">
	<tr>
 	<td><input type="checkbox" name="select" id="select" value="${item.memno }" ></td>
	<td><c:out value="${item.orderno }"></c:out></td> 
	<td>${item.memno }</td>
	<td>${item.itemno }</td>
	<td>${item.orderdate }</td>
	<td><a href="ej_orderupdate.do?orderno=${item.orderno}" >${item.status }</a></td>
	<td>${item.cost }</td>
	<td><a href="ej_orderdelete.do?orderno=${item.orderno}" onclick="delconfirm();">삭제</a><td>


	</tr>
	 </c:forEach>
</tbody>
</table><br>
<c:forEach var="i" begin="${starblock }+1" end="${endblock }" step="1">
	<c:if test="${currpage==i }">
	<c:out value="${i }"/>
	
	</c:if>

	<c:if test="${currpage!=i }">
	<a href="ej_orderlist.do?curr=${i }&search=${search}&txtsearch=${txtsearch }">${i }</a>
	</c:if>
</c:forEach><br>

<%-- <input type="hidden" name="memno" value="${item.memNo }"> --%>


</form>
     <footer>
         <jsp:include page="/hs_admin_footer.jsp"></jsp:include>
     </footer>
  </div>

</body>
</html>