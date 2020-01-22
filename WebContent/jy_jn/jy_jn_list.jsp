<%@page import="jy.com.homedream.DTO.JY_JN_BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집들이 앤 노하우</title>
<link rel = "stylesheet" href="css/jy_list.css?ver=1">
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


    <div class="jy_jn_title_header">
        <h1 style="display: inline-block; font-size: 23px; font-weight: 800; padding: 10px;">집들이 & 노하우</h1>
    </div>
    

    
  <div class="jy_jn_option_box">  
   <div class="jy_jn_option">
        <a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=new">최신순</a>
		<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=readpoint">조회수순</a>
		<a href ="jy_list.do?search=${search }&searchtxt=${searchtxt }&sorting=likepoint">좋아요순</a>
   </div>   
  </div>      
 
   <div class="jy_title_under_bar"></div> 
<c:set var="list" value="${requestScope.jn_list}"/>
<c:forEach var="item" items="${list}">




  <div class="jy_thumbnail_jn">
     <c:if test="${item.file_name != null}"> 
       <a href="jy_detail.do?num=${item.bno }">
         <img src="upload/${item.file_name}" alt="${file }" class="jy_thumbnai_img">
       </a>
     </c:if>
     <c:if test="${item.file_name == null}">
        <a href="jy_detail.do?num=${item.bno }">
          <img src="https://postfiles.pstatic.net/MjAyMDAxMjJfMTA2/MDAxNTc5NjgzNjE3NTA4.D0pd8M4Q4bffOEO5CkV96b_2PQgedutGF8EnuBzJVhUg.B7mzTTcPYVbFyXATq1-0GVxEuHtLal16yuqPIYZn2Owg.JPEG.x_o1215/KakaoTalk_Photo_20200122_1740_52240_-_%EB%B3%B5%EC%82%AC%EB%B3%B8.jpg?type=w966" alt="${file }">
        </a>
     </c:if>
     <p class="jy_thumbnail_jn_title">
         <a href="jy_detail.do?num=${item.bno }" style="">
             <c:out value="${item.btitle }"/>
         </a>
     </p>
     <p  class="jy_thumbnail_jn_id">
         <i class='fas fa-user-circle' style='margin-right:5px; font-size:20px'></i>
         <c:out value="${item.id}"/> 
     </p>
     <p  class="jy_thumbnail_jn_date">
         <c:out value="${item.writedate }"/>
     </p>  
  </div>


</c:forEach>



<br>

<div class="jy_new_write" style="width:100%;">
 <form method="post" action="jy_list.do" class="jy_new_write_form">
  <select name="sorting" class="jy_new_write_select1">
  <option value="new">최신순</option>
  <option value="readpoint">조회수순</option>
  <option value="likepoint">좋아요순</option>
  </select>
  
  <select name="search" class="jy_new_write_select1">
  <option value="btitle">제목</option>
  <option value="bcontent">내용</option>
  <option value="id">글쓴이</option>
  </select>
   <i class='fas fa-search' style="padding: 5px;"></i>
  <input type="text" name="searchtxt" id="searchtxt" class="jy_new_write_searchtxt">
  <input type="submit" value="검색" style="border: 1px transparent; padding: 5px; width :10%; font-size:14px; font-weight: 800; background-color: white;">
 </form>
 </div>
   <a href="jy_upload.do">
     <button type="button" class="btn btn-outline-info" style="font-size: 15px; float: right; height:34px; margin-top: -35px;">글쓰기</button>
   </a>
<br>

<c:set var ="currpage" value = "${requestScope.currpage }"/>
<c:set var ="startblock" value="${requestScope.startblock }"/>
<c:set var ="endblock" value="${requestScope.endblock }"/>
<c:set var ="totalpage" value="${requestScope.totalpage }"/>
<c:set var ="search" value="${requestScope.search }"/>
<c:set var ="searchtxt" value="${requestScope.searchtxt}"/>
<c:set var ="sorting" value="${requestScope.sorting}"/>


<div class="jy_jn_paging">  
<!-- 이전블록  -->
<c:if test="${startblock > 1 }">
	<a href="jy_list.do?curr=${startblock-1 }&search=${search }&searchtxt=${searchtxt }&sorting=${sorting }">
	   <i class='fas fa-angle-left' style='margin: 5px;'></i>
	</a>
</c:if>

<!-- 이전페이지 -->  
<c:if test="${currpage > 1 }">
	<a href = "jy_list.do?curr=${currpage -1 }&search=${search }&searchtxt=${searchtxt}&sorting=${sorting }">
	   <i class='fas fa-angle-left' style='margin: 5px;'></i>
	</a>
</c:if>

<!-- 현재페이지 --> 
<c:forEach var = "i" begin="${startblock}" end="${endblock}" step ="1">
	<c:if test="${currpage ==i }">
		<!-- 같으면 그냥 출력 -->
		<span style="color: rgb(0, 153, 255); padding: 5px;"><c:out value="${i}"/></span>
	</c:if>
	<c:if test="${currpage != i }">
		<!-- 다르면 링크 걸어주고 시작 -->
		<a href="jy_list.do?curr=${i}&search=${search}&searchtxt=${searchtxt}&sorting=${sorting }">${i}</a>
	</c:if>
</c:forEach>

<!-- 다음페이지 -->
<c:if test="${currpage < totalpage }">
	<a href = "jy_list.do?curr=${currpage +1 }&search=${search }&searchtxt=${searchtxt}&sorting=${sorting }">
	    <i class='fas fa-angle-right' style='margin: 5px;'></i>
    </a>
</c:if>

<!-- 다음블록-->
<c:if test="${endblock < totalpage }">
	<a href = "jy_list.do?curr=${endblock +1 }&search=${search }&searchtxt=${searchtxt}&sorting=${sorting }">
	    <i class='fas fa-angle-right' style='margin: 5px;'></i>
	</a>
</c:if>

</div>





</body>
</html>