<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<style>
body {
    margin : 20px;
}
</style>

</head>
<body>
<div class="container">

<%

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd-HH-mm");
 String today = formatter.format(new java.util.Date());
 StringTokenizer date = new StringTokenizer(today,"-");
 String[] arr = new String[date.countTokens()];
int i = 0;
 while(date.hasMoreElements()){
	 out.print(date.nextToken()+"년 ");
	 out.print(date.nextToken()+"월 ");
	 out.print(date.nextToken()+"일 ");
	 out.print(date.nextToken()+"시 ");
	 out.print(date.nextToken()+"분 ");
 }



%>











<c:set var="memberdto" value="${requestScope.memberdto }"/>
<c:set var="itemdto" value="${requestScope.itemdto}"/>



  <div class="row" style ="position : relative; left:23%; margin-top : 100px; ">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <address>
                        <strong>HOME DREAM</strong>
                        <br>
                        "${memberdto.mem_no }" "${memerdto.name}" 님의 결제창
                        <br>
                        <abbr title="Phone">P:</abbr> "${memberdto.phone }"                      
                        <br>
                        "${memberdto.addr}"
                    </address>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                         <em>Date: 23th January, 2020</em>
                    </p>
                    <p>
                        <em>Receipt #: 34522677W</em>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
                </span>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>구매목록</th>
                            <th>#</th>
                            <th class="text-center">가격</th>
                            <th class="text-center">총액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-md-9"><em>"${itemdto.name}"</em></h4></td>
                            <td class="col-md-1" style="text-align: center"> 1 </td>
                            <td class="col-md-1 text-center">"${itemdto.price}"</td>
                            <td class="col-md-1 text-center">"${itemdto.price}"</td>
                        </tr>
                  
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right">
                            <p>
                                <strong>Subtotal: </strong>
                            </p>
                            <p>
                                <strong>Tax: </strong>
                            </p></td>
                            <td class="text-center">
                            <p>
                                <strong>$6.94</strong>
                            </p>
                            <p>
                                <strong>$6.94</strong>
                            </p></td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="text-center text-danger"><h4><strong>$31.53</strong></h4></td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-success btn-lg btn-block">
                    Pay Now   <span class="glyphicon glyphicon-chevron-right"></span>
                </button></td>
            </div>
        </div>












<%-- 
<input type="hidden" id="item_no" name="item_no" value="${itemdto.item_no }"><br>

<label for="item_name">제품 명</label><br>
<input type="text" id="item_name" name="item_name" value="${itemdto.name}" readonly="readonly"><br>

<label for="item_price">제품 가격</label><br>
<input type="text" id="item_price" name="item_price" value="${itemdto.price}" readonly="readonly"><br>

<label for="member_name">구매자</label><br>
<input type="text" id="member_name" name="member_name" value="${memberdto.mem_no }"><br>

<input type="hidden" id="mem_no" name="mem_no" value="${memberdto.mem_no }"><br>

<label for="member_phone">연락처</label><br>
<input type="text" id="member_phone" name="member_phone" value="${memberdto.phone }"><br>

<label for="member_zipcode">우편번호</label><br>
<input type="text" id="member_zipcode" name="member_zipcode" value="${memberdto.zipcode }"><br>

<label for="member_addr">주소</label><br>
<textarea rows="4" cols="20" id="member_addr" name="member_addr"> ${memberdto.addr}</textarea>

<button value="결제" onclick="location.href='jy_buydetail.do?mem_no=${memberdto.mem_no}&item_no=${itemdto.item_no }'"></button>
<input type="reset" value="취소">
<!-- 이거 하면 제품 리스트로 돌아가게 하셈 취소하면 리셋이 아니라 근데 지금 제품 리스트 그게 없어서 걍 이렇게 넣었음 -->





 --%>





</div>
</body>
</html>