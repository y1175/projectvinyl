<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp65601532'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'KH Books 도서 결제',
            amount : "15000",
            buyer_email : 'x_o215@naverr,com',
            buyer_name : 'wlsdud',
            buyer_tel : '01071443797',
            buyer_addr : '서울',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "ssss.jsp", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + "ssdfsfsd";
                        msg += '\n상점 거래ID : ' + "sdfsdfsdf";
                        msg += '\결제 금액 : ' + "15000";
                        msg += '카드 승인번호 : ' + "1212";
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href="success.jsp";
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="false.jsp";
                alert(msg);
            }
        });
        
    });
    </script>
</head>
<body>

<c:set var="memberdto" value="${requestScope.memberdto }"/>
<c:set var="itemdto" value="${requestScope.itemdto}"/>

<label for="item_name">제품 명</label><br>
<input type="text" id="item_name" name="item_name" value="${itemdto.name}" readonly="readonly"><br>

<label for="item_price">제품 가격</label><br>
<input type="text" id="item_price" name="item_price" value="${itemdto.price}" readonly="readonly"><br>

<label for="member_name">구매자</label><br>
<input type="text" id="member_name" name="member_name" value="${memberdto.name}" readonly="readonly"><br>

<label for="member_phone">연락처</label><br>
<input type="text" id="member_phone" name="member_phone" value="${memberdto.phone}" readonly="readonly"><br>

<label for="member_zipcode">연락처</label><br>
<input type="text" id="member_zipcode" name="member_zipcode" value="${memberdto.zipcode}" readonly="readonly"><br>


<label for="member_addr">주소</label><br>
<textarea rows="4" cols="20" id="member_addr" name="member_addr" readonly="readonly" >${memberdto.addr}</textarea>

<input type="button" onclick="pay()" value="결제">
<input type="reset" value="취소">
<!-- 이거 하면 제품 리스트로 돌아가게 하셈 취소하면 리셋이 아니라 근데 지금 제품 리스트 그게 없어서 걍 이렇게 넣었음 -->



</body>
</html>