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
<link rel = "stylesheet" href="css/jy_list.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
   <script>
      function insertBoard() {
         location.href="jy_upload.do";
      };
      function loginBoard() {
         location.href="yilogin.do";
      };
   </script>
<style>
/* header nav 집들이 앤 노하우 글씨색상  */
  .hs_header_nav > a:nth-child(2){
    color: rgb(0, 153, 255);
  }
</style>

</head>
<body>


    <div class="title-header pens-title-header">
        <h1 style="display: inline-block; font-size: 4em;">집들이 & 노하우</h1>
      
    </div>
    
    <div class="title_under_bar"></div>
    
   <div class="sorting" style=" font-size: 15px; width:100%; padding-left: 83%;">
        <a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=new">최신순</a>
		<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=readpoint">조회수순</a>
		<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=likepoint">좋아요순</a>
        </div>   
        
        <div class="fuckyou">
<c:set var="list" value="${requestScope.jn_list}"/>
<c:forEach var="item" items="${list}">



<div class="content">

    <div class="row" id="picked"><!-- 애가 큰 상자 -->

      <div class="card">
      <figure class="card_header">
      <c:if test="">
       <a href="jy_detail.do?num=${item.bno }"><img src="upload/${item.file_name}" alt="${file }" class="jy_img_list"></a>
        </c:if>
        <c:if test="">
        </c:if>
        </figure>
        <div class="card_text"><h2 class="card_title">
          <a href="jy_detail.do?num=${item.bno }"><c:out value="${item.btitle }"/></a></h2>
          <p class="card_desc">
          <c:out value="${item.id}"/><br>
          <c:out value="${item.writedate }"/><br>
          </p>  
          </div>
        </div>
    </div>
</div>

</c:forEach>







</div>


<br>
<a href="jy_upload.do">새글쓰기</a>
<br>

<c:set var ="currpage" value = "${requestScope.currpage }"/>
<c:set var ="startblock" value="${requestScope.startblock }"/>
<c:set var ="endblock" value="${requestScope.endblock }"/>
<c:set var ="totalpage" value="${requestScope.totalpage }"/>
<c:set var ="search" value="${requestScope.search }"/>
<c:set var ="searchtxt" value="${requestScope.searchtxt}"/>
<c:set var ="sorting" value="${requestScope.sorting}"/>

<div class="jy_page">


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

</div>

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

</body>
</html>