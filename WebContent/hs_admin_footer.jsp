<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 전체 div */
#hs_footer_wrap{
	background-color: rgb(250, 250, 250);
	padding: 20px 0px;
	margin-top: 150px;
}
/* 고객센터명 */
.hs_footer_cc{
   text-decoration: none;
   color: #222;
   font-size: 13px;
   font-weight: 800;
}
.hs_footer_cc:hover{
   color: rgb(0, 153, 255);
}
/* 고객센터번호 */
.hs_footer_tel{
	font-size: 30px;
	color: #222;
}
.hs_footer_tel:hover{
   color: rgb(0, 153, 255);
}
/* 소셜네트워크 이미지 */
.hs_footer_sn{
    float:right;
	width: 200px;
}
/* footer 내용1 */
.hs_footer_content1{
    display: inline-block;
    margin-top: 10px;
    font-size: 13px;
}
/* footer 내용2 */
.hs_footer_content2{
    display: inline-block;
    margin-top: 15px;
    color: rgb(127, 127, 127);
    font-size: 12px;
}
/* copyright  */
.hs_footer_copyright{
    margin-top:5px;
    font-size: 13px;
}
</style>
</head>
<body>
 <div id="hs_footer_wrap">
    <a href="" class="hs_footer_cc">고객센터</a> 
    <div>     
      <b class="hs_footer_tel">1588-1588</b>
      <img alt="snimg" src="../img/hs_footer_sn.png"  class="hs_footer_sn">  
    </div>
  <div class="hs_footer_content1">
    <b>브랜드 스토리</b>
    <b>회사소개</b>
    <b>채용정보</b>
    <b>이용약관</b>
    <b>개인정보취급방침</b>
    <b>고객센터</b>
  </div>
  <br>
  <div class="hs_footer_content2">
    <span>상호명 : (주)VinylHouse</span>
    <span>이메일 : vinylhouse@homedream.com</span> 
    <span>대표이사 : 하화수</span>
    <span>사업자등록번호 : 219-86-10146</span> 
    <span>주소 : 서울특별시 서초구 강남대로 459 백암빌딩 4층 403호</span>
  </div>
  <div class="hs_footer_copyright">
    <p>Copyright © 2019-2020 by VinylHouse, inc.All rights reserved</p> 
  </div>
 </div>
</body>
</html>