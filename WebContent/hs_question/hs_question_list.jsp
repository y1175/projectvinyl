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
</head>
<body>
  <div>
    <h1>질문과 답변</h1>
    <p>홈드림 인테리어 고수들과 전문가들에게 조언을 받으세요.
    <form>
        <select name="hs_questionsearch">
           <option value="title">제목</option>
           <option value="content">내용순</option>
        </select>
        <i class='fas fa-search' style=""></i>
        <input type="text" id="hs_questionsearchtxt" name="hs_questionsearchtxt" value="궁금한 것을 검색해보세요">
    </form>
  </div>
  <div>
    <form action="">
        <select name="">
           <option value="qdate">최신순</option>
           <option value="readno">인기순</option>
        </select>
    </form>
    <a href="hs_questioninsert.do"><button>질문하기</button></a>
  </div>
  <c:set var="list" value="${requestScope.list}"></c:set>
  <c:forEach var="item" items="${list}">
  <div>
    <ul>
      <li>
                 제목
          <a href="hs_questiondetail.do?no=${item.q_no}"><c:out value="${item.title}"/></a>               
      </li>
      <li>
                 내용
          <a href="hs_questiondetail.do?no=${item.q_no}"><c:out value="${item.content}"/></a>       
      </li>
      <li>
                 작성자
          <c:out value="${item.mem_name}"/>       
      </li>
      <li>
                 올린시간
         <c:out value="${item.qdate}"/>        
      </li>
      <li>
                 댓글수      
      </li>
      <li>
                 조회수
                 
          <c:out value="${item.readno}"/>       
      </li>
      <li>
                 이미지
         <c:out value="${item.filename}"></c:out>
         <img src="upload/${item.filename}" alt="${item.filename}">      
      </li>
    </ul>
  </div>
  </c:forEach>
  <c:set var="startblock" value="${requestScope.startblock}"/>
  <c:set var="endblock" value="${requestScope.endblock}"/>
  <c:set var="currpage" value="${requestScope.currpage}"/>
  <c:set var="totalpage" value="${requestScope.totalpage}"/>
  <c:set var="hs_questionsearchtxt" value="${requestScope.hs_questionsearchtxt}"/>
  <c:set var="hs_questionsearch" value="${requestScope.hs_questionsearch}"/>
  
  <c:if test="${startblock>1}">
     <a href="hs_questionlist.do?curr=${currpage-1}&search=${hs_questionsearch}&searchtxt=${hs_questionsearchtxt}"><i class='fas fa-angle-left' style='font-size:24px'></i>이전</a>
  </c:if>
  
  <c:forEach var="i" begin="${startblock}" end="${endblock}" step="1">
     <c:if test="${currpage==i}">  <!--현재페이지-->
        <c:out value="${i}"></c:out>
     </c:if>
     <c:if test="${currpage!=i}"> <!--다르면 넘어갈수있게-->
        <a href="hs_questionlist.do?curr=${i}&search=${hs_questionsearchtxt}&searchtxt=${hs_questionsearchtxt}">${i}</a>
     </c:if>
  </c:forEach>
  
  <c:if test="${endblcok<totalpage}">
     <a href="hs_questionlist.do?curr=${currpage+1}&search=${hs_questionsearchtxt}&searchtxt=${hs_questionsearchtxt}"><i class='fas fa-angle-right' style='font-size:24px'></i>다음</a>
  </c:if>
  
</body>
</html>