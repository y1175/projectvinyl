<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
<!--question content style-->
<link rel="stylesheet" href="css/hs_questioncontent.css" >
<!--question content style-->
<style>
/* header nav 질문과답변 글씨색상  */
  .hs_header_nav > a:nth-child(4){
    color: rgb(0, 153, 255);
  }
</style>
</head>
<body>

  <div class="hs_question_titlediv">
    <h1>질문과 답변</h1>
    <p>홈드림 인테리어 고수들과 전문가들에게 조언을 받으세요.
    <form >
       <div class="hs_questionsearch_searchbox">
        <select name="hs_questionsearch" class="hs_questionsearch_searchop">
           <option value="title">제목</option>
           <option value="content">내용순</option>
        </select> 
        <i class='fas fa-search' style="padding: 5px;"></i>
        <input type="text" id="hs_questionsearchtxt" name="hs_questionsearchtxt" placeholder="궁금한 것을 검색해보세요">
       </div>
    </form>
  </div>
  <div class="hs_question_opdiv">
    <form action="">
        <select name="" class="hs_question_op">
           <option value="qdate">최신순</option>
           <option value="readno">인기순</option>
        </select>
    </form>
     <c:if test="${sessionScope.mem_no != null }">
     <a href="hs_questioninsert.do"><button class="hs_question_btn">질문하기</button></a>
      </c:if>
    
    
    
  </div>
  <c:set var="list" value="${requestScope.list}"></c:set>
  <c:forEach var="item" items="${list}">
  <div class="hs_question_divline"></div>
  <div class="hs_question_ul_li">
    <ul class="hs_question_ul">
      <li class="hs_question_ul_li_title">
          <a href="hs_questiondetail.do?no=${item.q_no}"><c:out value="${item.title}"/></a>               
      </li>
      <li class="hs_question_ul_li_content">
          <a href="hs_questiondetail.do?no=${item.q_no}"><c:out value="${item.content}"/></a>       
      </li>
      <li class="hs_question_ul_li_member">
          <i class='fas fa-user-circle' style='margin-right:5px; font-size:20px'></i>
          <c:out value="${item.mem_name}"/><span> | </span>   
          <c:out value="${item.qdate}"/><span> | </span>  
          <span>조회수 </span>
          <c:out value="${item.readno}"/>       
      </li>
      </ul>
      <div>
        <c:if test="${item.filename != null}"> 
           <img src="upload/${item.filename}" alt="${item.filename}"  class="hs_question_ul_li_img">
        </c:if>
        <c:if test="${item.filename == null}">
           <img src="img/hs_noimage.jpg" alt="${item.filename}"  class="hs_question_ul_li_img">      
        </c:if>
      </div>
  </div>
  </c:forEach>
  <div class="hs_question_divline"></div>
 <div class="hs_question_paging">
  <c:set var="startblock" value="${requestScope.startblock}"/>
  <c:set var="endblock" value="${requestScope.endblock}"/>
  <c:set var="currpage" value="${requestScope.currpage}"/>
  <c:set var="totalpage" value="${requestScope.totalpage}"/>
  <c:set var="hs_questionsearchtxt" value="${requestScope.hs_questionsearchtxt}"/>
  <c:set var="hs_questionsearch" value="${requestScope.hs_questionsearch}"/>
  <!-- 이전블록  -->
  <c:if test="${startblock>1}">
     <a href="hs_questionlist.do?curr=${startblock-1}&search=${hs_questionsearch}&searchtxt=${hs_questionsearchtxt}"><i class='fas fa-angle-left' style='font-size:24px'></i></a>
  </c:if>
  <!-- 이전페이지 -->  
  <c:if test="${currpage>1}">
     <a href="hs_questionlist.do?curr=${currpage-1}&search=${hs_questionsearch}&searchtxt=${hs_questionsearchtxt}"><i class='fas fa-angle-left' style='font-size:24px'></i></a>
  </c:if>
  
  <c:forEach var="i" begin="${startblock}" end="${endblock}" step="1">
     <c:if test="${currpage==i}">  <!--현재페이지-->
        <c:out value="${i}"></c:out>
     </c:if>
     <c:if test="${currpage!=i}"> <!--다르면 넘어갈수있게-->
        <a href="hs_questionlist.do?curr=${i}&search=${hs_questionsearch}&searchtxt=${hs_questionsearchtxt}">${i}</a>
     </c:if>
  </c:forEach>
  <!-- 다음페이지 -->
    <c:if test="${currpage<totalpage}">
     <a href="hs_questionlist.do?curr=${currpage+1}&search=${hs_questionsearch}&searchtxt=${hs_questionsearchtxt}"><i class='fas fa-angle-right' style='font-size:24px'></i></a>
  </c:if>
  <!-- 다음블록 -->
  <c:if test="${endblcok<totalpage}">
     <a href="hs_questionlist.do?curr=${endblcok+1}&search=${hs_questionsearch}&searchtxt=${hs_questionsearchtxt}"><i class='fas fa-angle-left' style='font-size:24px'></i></a>
  </c:if>
 </div>
 
</body>
</html>