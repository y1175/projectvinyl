<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!-- viewport -->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">
<!-- viewport / shrink-to-fit=no 사파리 브라우저에 영향을 미치는 속성 -->
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script >  

/*     function closeWindow() {  
            setTimeout(function() {  
        window.close();  
            }, 1000);  
        }  
  
    //창이 열린 후 3초후에 닫기  
   window.onload = closeWindow();   */
   
   /* 
   var myWindow;
   function resizeWin() {
	   myWindow.resizeTo(250, 250);
	   myWindow.focus();
	 }
   window.onload=resizeWin(); */
   
   
   

</script>



</head>
<body >
<form method="post" action="ej_update.do">
<c:set var="orderno" value="${requestScope.orderno }"/>
<input type="hidden" value=${orderno } name="orderno"> 
<select name="status"><!--search txtsearch받아야댐 ListAction에서  -->
	<option value=1>결제확인</option>
	<option value=2>배송준비중</option>
	<option value=3>배송중</option>
	<option value=4>배송완료</option>
	<option value=5>취소승인</option>
</select>
<input type="submit" value="변경" >

</form>
</body>
</html>