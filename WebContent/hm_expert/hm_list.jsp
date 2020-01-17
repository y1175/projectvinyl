<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="hm_list.do">
			<tr><td>
					<select class="form-control" id="hmcity" name="hmcity">
							<!-- select name값을 넘겨서 검색처리하기 -->
							<!-- onchange="hmtownSelect(this.value);" -->
							<option>필요 지역</option>
							<option value="강남">서울특별시 강남구</option>
							<option value="동작">서울특별시 동작구 </option>
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
					</td>
					</tr>
					<tr><td>
				<input type = "submit" value ="검색" id ="hm_search">
				</td></tr>
			</form>
</body>
</html>