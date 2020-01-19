<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.hm_expertmain{
	background-color:pink;
	border : 1px solid black;
	width:65%;
	height:300px;
	margin : 40px auto 20px;
}
.hm_expertmain img{
	display:inline-block;
	float: left;
	width:85%;
	height:300px;
} 
.hm_expertmain_1{
	display:inline-block;
	float:left;
	width:30%;
	height : 300px;
}
.hm_expertmain_1 hm_expertcontent{
	vertical-align: middle;
	text-align: center;
} 
</style>
</head>
<body>
<form method="post" action="hm_list.do">
					<select class="form-control" id="hmcity" name="hmcity">
							<!-- select name값을 넘겨서 검색처리하기 -->
							<!-- onchange="hmtownSelect(this.value);" -->
							<option value ="">선택하세요</option>
							<option value="강남">서울특별시 강남구</option>
							<%-- <c:if test="${Name eq '강남'}">selected=selected</c:if> --%>
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
			

	<c:set var="totalcount" value="${requestScope.totalcount}"></c:set>		
			<c:set var = "list" value ="${requestScope.list}"></c:set>
				
			<div>
			전체결과 : <c:out value="${totalcount}"></c:out>
			</div>
			
 		    <c:forEach var ="item" items ="${list}">
			<div class="hm_expertmain" onclick="location.href='hm_detail.do';"><!-- 여기다가 detail주소 달기 -->
			<div class="hm_expertmain_1">
			<img src="hm_expert/${item.loc}" alt="${item.file_name}"/>
			</div>
			<div class="hm_expertmain_1">
			<p class ="hm_expertcontent"><c:out value="${item.name}"/></p>
			</div>
			<div class="hm_expertmain_1">
			<p class ="hm_expertcontent"><c:out value="${item.text}"/></p>
			</div>
			</div>
			</c:forEach>
		
			
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


<%
	if(endblock<totalpage)
	{
		%>
		<a href = "hm_list.do?curr=<%=currpage+1%>&search=<%=search%>">다음</a>
		<% 
		//endblock+1로 할수도있음 -> block단위로 다음
	}
%> 

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5dfae15243be710e1d22bb34/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
	
</body>
</html>