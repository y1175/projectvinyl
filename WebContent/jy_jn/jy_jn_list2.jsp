<%@page import="jy.com.homedream.DTO.JY_JN_BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집들이 앤 노하우</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="css/jy_list.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   <script>
      function insertBoard() {
         location.href="jy_upload.do";
      };
      function loginBoard() {
         location.href="yilogin.do";
      };
   </script>

<!-- Bootstrap -->
<style>
/* header nav 집들이 앤 노하우 글씨색상  */
  .hs_header_nav > a:nth-child(2){
    color: rgb(0, 153, 255);
  }
</style>

</head>
<body>
<div class="container">
 <header>
  <jsp:include page="/hs_communityheader.jsp"></jsp:include>
 </header>
 
<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=new">최신순</a>
<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=readpoint">조회수순</a>
<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=likepoint">좋아요순</a>

<table>
<thead>
<tr><th>글 번호</th><th>글 제목</th><th>글쓴이</th><th>좋아요</th><th>조회수</th><th>작성일</th></tr>
</thead>
<tbody>
<c:set var="list" value="${requestScope.jn_list}"/>
<c:forEach var="item" items="${list}">
<tr>

<td>
<c:out value="${item.bno }"/>
</td>

<td>
<a href = "jy_detail.do?num=${item.bno }">
<c:out value="${item.btitle }"/>
</a>
</td>

<td>
<c:out value="${item.id}"/>
</td>

<td>
<c:out value="${item.likeNo }"/>
</td>

<td>
<c:out value="${item.readNo }"/>
</td>

<td>
<c:out value="${item.writedate }"/>
</td>

</tr>

</c:forEach>

</tbody>

</table>










<div class="skeleton">
  

<div class="content">
    <div class="title-header pens-title-header">
        <h1>Picked Pens</h1>
    </div>
    <div class="row" id="picked">

      <div class="card">
      <figure class="card_header">
          <a href="#"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAADIBAMAAAA0O6rRAAAAG1BMVEXMzMyWlpajo6O3t7fFxcWqqqq+vr6cnJyxsbHzLcY6AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADL0lEQVR4nO3ZvW7bMBSGYdmWf8Ycp7YyRkWBrNEd2EObjhZQtKs9dI+G7tGdl4ekRMqQk25UgfcZ4i+RBfBIJEUxWQYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACktfpV/LxOY74/dUd/N3/O1ymludiPVkTertKIhTkoJ00bEx6yYUqqsoVoY1xrQhr/trHTpPW6gkNKKRdbyEUbI+dBGv+2ejYd0IZ9Fqeklq6QRn7ktbwO0oi5bM/fSj26lt3hqxRZnJK62EJW2pk2ellDGnPU8WGPXrQztXrnQkqqsYUs5dH8LHdxGlPZC9+Yo/U20xt0ilNKG2m1kJkbHkWcxtR2FqhM0/3weI1TSsdipoW4hs/kEKUx5X3mvu0bLp+ilFS5t4VUtivNzXQUkjKz1MF8NN0NauzYMacsXFcyhYWUkmmFLaT2j5C3KFmthoV0rXTX3Zyy9I+Qhyil9CIHW4i7nnpxQ7LW2vR1PwCebDgW3S0z9y+klOr7zBbiuszKzFghWQt9jF/PrWawr92fLnFKSAfqoJDXKDmlHHK5amT50De/iFJC2ghXiO37uRbSJ+cip83VjKS/r920diyilFC7y1wh4pt/FyVnKfvj1cOuNf3Oz89HiVI6ubbaFeLarYX0qfvOth4+VJZSHNxZ9uSQ0rETzgd3RBfpg5k1b1z5B/1lInfEzjQfjBEzBoarj0pvyMTGiJ2hPpi19J3wOTrHLPu/ZNnEZi3xtu8VspLBEKldR5tqId3z/DFK3lziSWsuxdl9uuf5NkrphEK6FdYpSl41eI1tbcfK+hXWLkrphEJurX6NZhs92HPx7Z3a6jfzg717CzlHyTHvtW2oatl1ue4tZB+lxGbRG6LEyXmRx2MY+cd+4Pv3wrs4pTV7/53drHw34YlY9Wlq7+y+kJu7KHbl2/T3oe470OR2Ufwi6da+1lLXI1W/j9hsP1sT3Nfyhdzaabxol1n36/hunpvgTqMvZNnv+IakSu1Vq27SzUMh5hHf7fiGlNTsvd34hSuh9HdoFRUyud1471//PxJM7f8jAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgf/AXCpmbEoJwejYAAAAASUVORK5CYII="></a>
        </figure>
        <div class="card_text"><h2 class="card_title">
          <a href="#">제목</a></h2>

          <p class="card_desc">내용</p>
            
          </div>
        </div>
    </div>
</div>














<a href="jy_upload.do">새글쓰기</a>

<br>

<c:set var ="currpage" value = "${requestScope.currpage }"/>
<c:set var ="startblock" value="${requestScope.startblock }"/>
<c:set var ="endblock" value="${requestScope.endblock }"/>
<c:set var ="totalpage" value="${requestScope.totalpage }"/>
<c:set var ="search" value="${requestScope.search }"/>
<c:set var ="searchtxt" value="${requestScope.searchtxt}"/>
<c:set var ="sorting" value="${requestScope.sorting}"/>

<c:if test="${startblock > 1 }">
	<a href="jy_list.do?curr=${startblock-1 }&search=${search }&searchtxt=${searchtxt }&sorting=${sorting }">이전 블럭으로</a>
</c:if>

<c:if test="${currpage > 1 }">
	<a href = "jy_list.do?curr=${currpage -1 }&search=${search }&searchtxt=${searchtxt}&sorting=${sorting }">이전</a>
</c:if>

<c:forEach var = "i" begin="${startblock}" end="${endblock}" step ="1">
	<c:if test="${currpage ==i }">
		<!-- 같으면 그냥 출력 -->
		<c:out value="${i}"/>
	</c:if>
	<c:if test="${currpage != i }">
		<!-- 다르면 링크 걸어주고 시작 -->
		<a href="jy_list.do?curr=${i}&search=${search}&searchtxt=${searchtxt}&sorting=${sorting }">${i}</a>
	
	</c:if>


</c:forEach>

<c:if test="${currpage < totalpage }">
	<a href = "jy_list.do?curr=${currpage +1 }&search=${search }&searchtxt=${searchtxt}&sorting=${sorting }">다음</a>
</c:if>

<c:if test="${endblock < totalpage }">
	<a href = "jy_list.do?curr=${endblock +1 }&search=${search }&searchtxt=${searchtxt}&sorting=${sorting }">다음블럭으로</a>
</c:if>



<form method="post" action="jy_list.do">


<select name="sorting">
<option value="new">최신순</option>
<option value="readpoint">조회수순</option>
<option value="likepoint">좋아요순</option>
</select>


<select name="search">
<option value="btitle">제목</option>
<option value="bcontent">내용</option>
<option value="id">글쓴이</option>
</select>
<input type="text" name="searchtxt" id="searchtxt">
<input type="submit" value="검색">
</form>

<footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div> 
</body>
</html>