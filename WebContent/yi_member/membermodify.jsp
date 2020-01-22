<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/yi_joinform.css">

</head>
<body>

<div class='row'>
<div class='col'></div>
<div class='col-6'>
<form method="post" action="yimodifyresult.do">

<label for="id">아이디</label>
<input type="text" name="id" id="id" required="required" onkeyup="idCheckFunction();"
value="${list[0].id }" readonly="readonly" class="form-control">


<label for="pwd">패스워드</label>
<input type="password" name="pwd" id="pwd" required="required" value="${list[0].pwd }" class="form-control" >


<label for="pwdcheck">패스워드확인</label>
<input type="password" name="pwdcheck" id="pwdcheck" required="required" value="${list[0].pwd }" onkeyup="passwordCheckFunction();" class="form-control">

<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
<label for="name">이름</label>
<input type="text" name="name" id="name" value="${list[0].name }" required="required" class="form-control">
<label for="birth">생년월일</label>
<input type="date" name="birth" id="birth" value="${list[0].birth }" class="form-control">
<label for="id">전화번호</label>
<input type="text" name="phone" id="phone" value="${list[0].phone }" class="form-control">



<label for='addr'>주소</label>

<div class='form-row'>
<div class='col-5'>
<input type="text" id="sample4_postcode" name='zipcode' placeholder="우편번호" class="form-control">
</div>
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly="readonly" class='btn btn-info'><br>
</div>

<div class='juso'>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadaddr" readonly="readonly" class="form-control">
<input type="radio" id='roadAddress' name='addrselect' value="0" required ><label for="addrselect">도로명주소 선택</label> <br>

<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="jibunaddr" readonly="readonly" class="form-control">
<input type="radio" id='jibunAddress' name='addrselect' value="1" ><label for="addrselect">지번주소 선택</label>
</div>
<span id="guide" style="color:#999"></span>

<label for="detailaddr">상세주소</label>
<input type="text" id="detailaddr" name="detailaddr" class="form-control">

<div class='row submit-btn'>
<div class='col'></div>
<input type="submit" id="submit" value="수정" class='btn btn-info'>
<div class='col'></div>
</div>

</form>
</div>
<div class='col'></div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    document.getElementById('sample4_roadAddress').value = expRoadAddr;
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    //document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    document.getElementById('sample4_jibunAddress').value = expJibunAddr;
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
</script>

<script>
$(function(){ $("#alert-success").hide();
$("#alert-danger").hide(); 
$("input").keyup(function(){ 
var pwd1=$("#pwd").val(); 
var pwd2=$("#pwdcheck").val(); 
if(pwd1 != "" || pwd2 != "")
{ 
	if(pwd1 == pwd2)
	{ 
		$("#alert-success").show();
		$("#alert-danger").hide();
		$("#submit").removeAttr("disabled"); 
		}
	else
	{ 
		$("#alert-success").hide();
		$("#alert-danger").show();
		$("#submit").attr("disabled", "disabled"); 
		} 
	}
});

$("input")



});




</script>

<!-- Optional JavaScript -->

</body>
</html>