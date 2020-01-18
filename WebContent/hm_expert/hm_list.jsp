<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#table1{
 border: 1px solid pink;
}
table tr td img{
	width:200px;
	height:200px;
}
</style>

</head>
<body>
<form method="post" action="hm_list.do">
					<select class="form-control" id="hmcity" name="hmcity">
							<!-- select name값을 넘겨서 검색처리하기 -->
							<!-- onchange="hmtownSelect(this.value);" -->
							<option value ="">선택하세요</option>
							<option value="강남"<c:if test="${Name eq '강남'}">selected=selected</c:if>>서울특별시 강남구</option>
							<option value="동작" >서울특별시 동작구 </option>
							<option value="강북">서울특별시 강북구</option>
							<option value="강서">서울특별시 강서구</option>
							<option value="관악">서울특별시 관악구</option>
							<option value="광진">서울특별시 광진구</option>
							<option value="구로">서울특별시 구로구</option>
							<option value="금천">서울특별시 금천시</option>
							<option value="노원">서울특별시 노원구</option>
							<option value="도봉">서울특별시 도봉구</option>
							<option value="동대문">서울특별시 동대문구</option>
							<option value="동작">서울특별시 동작구</option>
							<option value="마포">서울특별시 마포구</option>
							<option value="서대문">서울특별시 서대문구</option>
							<option value="서초">서울특별시 서초구</option>
							<option value="성동">서울특별시 성동구</option>
							<option value="성북">서울특별시 성북구</option>
							<option value="송파구">서울특별시 송파구</option>
							<option value="양천구">서울특별시 양천구</option>
							<option value="영등포">서울특별시 영등포구</option>
							<option value="용산">서울특별시 용산구</option>
					</select>
				<input type = "submit" value ="검색" id ="hm_search">
			</form>
			
	<%-- <c:set var="currpage" value="${requestScope.currpage}"></c:set>
	<c:set var="startblock" value="${requestScope.startblock}"></c:set>
	<c:set var="endblock" value="${requestScope.endblock}"></c:set>
	<c:set var="totalpage" value="${requestScope.totalpage}"></c:set>
	<c:set var="search" value="${requestScope.search}"></c:set> --%>
	<c:set var="totalcount" value="${requestScope.totalcount}"></c:set>		
			
			<c:set var = "list" value ="${requestScope.list}"></c:set>
			
			<table id ="table1">
			<thead><tr><th>전체결과 : <c:out value="${totalcount}"/></th></tr></thead>
			
			<tbody>
			<c:forEach var ="item" items ="${list}">
			
			<tr><td><img src="hm_expert/${item.loc}" alt="${item.file_name}"/></td>
			<td><c:out value="${item.name}"></c:out></td>
			<td><c:out value="${item.text}"></c:out></td></tr>
			</c:forEach>
			</tbody>
			</table>

	


<%
int currpage = (Integer)request.getAttribute("currpage");
int startblock = (Integer)request.getAttribute("startblock");
int endblock = (Integer)request.getAttribute("endblock");
int totalpage =(Integer)request.getAttribute("totalpage");
String search = request.getParameter("search");
%> 


<%
	if(startblock>1)
	{
		%>
		<a href="hm_list.do?curr=<%=currpage-1%>&search=<%=search%>">이전</a>
		<% 
		//currpage -> startblock-1 = 블럭단위로 넘어감	
	}
%> 

<%
	for(int i=startblock; i<=endblock; i++)
	{
		if(currpage==i)
		{
			%>
			<%=i %>
			<% 
		}else
		{
			%>
			<a href = "hm_list.do?curr=<%=i%>&search=<%=search%>"><%=i%></a>
			<% 
		}
		%>
		<%
	}
%>
<%-- <c:forEach var = "i" begin="${startblock}" end="${endblock}" step ="1">
	<c:if test="${currpage ==i }">
		<!-- 같으면 그냥 출력 -->
		<c:out value="${i}"/>
	</c:if>
	<c:if test="${currpage != i }">
		<!-- 다르면 링크 걸어주고 시작 -->
		<a href="list.do?curr=${i}&search=${search}">${i}</a>
	
	</c:if>
</c:forEach> 
 --%>


<%
	if(endblock<totalpage)
	{
		%>
		<a href = "hm_list.do?curr=<%=currpage+1%>&search=<%=search%>">다음</a>
		<% 
		//endblock+1로 할수도있음 -> block단위로 다음
	}
%> 

<%-- 

     <c:if test="${startblock>1}">
	<a href="hm_list.do?curr=${currpage-1}&search=${search}">이전</a>
	</c:if>
	
	<c:forEach var ="i" begin ="${startblock}" end="${endblock}" step ="1"> 
	<c:if test="${currpage==i}">
	<!-- 같으면 그냥 출력하기 -->
	<c:out value="${i}"></c:out>
	</c:if>
	<c:if test="${currpage!=i}">
	<a href="hm_list.do?curr=${i}&search=${search}"></a>
	</c:if>
	</c:forEach>

	<c:if test="${endblock<totalpage}">
	<a href="hm_list.do?curr=${currpage+1}">다음</a>
	</c:if>
 --%>

	
</body>
</html>