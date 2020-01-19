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
</head>
<body>
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
<a href = "detail.do?num=${item.bno }">
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

<a href="upload.do">새글쓰기</a>
<br>

<c:set var ="currpage" value = "${requestScope.currpage }"/>
<c:set var ="startblock" value="${requestScope.startblock }"/>
<c:set var ="endblock" value="${requestScope.endblock }"/>
<c:set var ="totalpage" value="${requestScope.totalpage }"/>
<c:set var ="search" value="${requestScope.search }"/>
<c:set var ="searchtxt" value="${requestScope.searchtxt}"/>

<c:if test="${startblock > 1 }">
	<a href="list.do?curr=${startblock-1 }&search=${search }&searchtxt=${searchtxt }">이전 블럭으로</a>
</c:if>

<c:if test="${currpage > 1 }">
	<a href = "list.do?curr=${currpage }&search=${search }&searchtxt=${searchtxt}">이전</a>
</c:if>

<c:forEach var = "i" begin="${startblock}" end="${endblock}" step ="1">
	<c:if test="${currpage ==i }">
		<!-- 같으면 그냥 출력 -->
		<c:out value="${i}"/>
	</c:if>
	<c:if test="${currpage != i }">
		<!-- 다르면 링크 걸어주고 시작 -->
		<a href="list.do?curr=${i}&search=${search}&searchtxt=${searchtxt}">${i}</a>
	
	</c:if>


</c:forEach>

<c:if test="${currpage < totalpage }">
	<a href = "list.do?curr=${currpage +1 }&search=${search }&searchtxt=${searchtxt}">다음</a>
</c:if>

<c:if test="${endblock < totalpage }">
	<a href = "list.do?curr=${endblock +1 }&search=${search }&searchtxt=${searchtxt}">다음블럭으로</a>
</c:if>



<form method="post" action="list.do">
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