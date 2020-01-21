<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script>
  function send(){
	  if(document.frm.hs_answer.value!="")
		  document.frm.submit();
  }
  /*
  function del(a_no,q_no){
	  location href="hs_answerdelete.do?a_no="+a_no+"&q_no="+q_no
  }*/
  
  $(document).ready(function() {
	let no=${dto.q_no}
	$.ajax({
		url:'hs_answerdetail.do'
	   ,data:{'no':no}
	   ,dataType:'json'
	   ,method:'post'
	   ,success:function(data){
		   $.each(data, function(index,item){
			   console.log(item);
				let result ="<tbody><tr style='padding-bottom : 10px;'><td><i class='fas fa-user-circle'style='font-size: 30px; margin-right: 20px;'></i></td>"
					result+="<td style='font-size: 20px; font-weight : 500; padding-right:20px;'>"+item.answerid+"</td>";
					result+="<td style='font-size: 17px; width : 93%;'>"+item.content+"</td>";
					result+="<td><input type='button' value='삭제' onclick='del("+item.a_no+","+item.q_no+")' style='border: 1px transparent; font-weight : 900; font-size : 13px; background-color: rgba(0, 153, 255, 0.7); color : white; padding: 5px 22px;'></td>";
					result+="</tr></tbody>";
					$('#hs_answer_result').append(result);
			    })
		}
		,error:function(data){
			console.log('error',data);
		}			
	}) 
  });
  
</script>
<style type="text/css"></style>
<link rel="stylesheet" href="css/hs_questiondetail.css?ver=1" >
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
</head>
<body>
<div class="container">
 <header>
  <jsp:include page="/hs_communityheader.jsp"></jsp:include>
 </header>
  <c:set var="dto" value="${requestScope.dto}"/>
    <div  class="hs_question_detaildiv">
       <ul>
         <li>
           <p class="hs_question_detail_qa">질문과 답변</p>
         </li>
         <li style="font-size:18px; font-weight: 800; margin-top: -10px;">
           <c:out value="${dto.title}"/>
         </li>
         <li class="hs_question_detail_qamname" style="margin-top: 15px; font-size: 13px;">
           <i class='fas fa-user-circle' style="font-size: 30px; margin-right: 5px;"></i>
           <c:out value="${dto.mem_name}"/>
         </li>
         <li>
           <img src="upload/${dto.filename}" alt="${file}" class="hs_question_detail_qaimg">
         </li>
         <li style="margin: 30px 20px;">
           <c:out value="${dto.content}"/>
         </li>
         <li style="text-align: right; font-size: 12px; font-weight: 800; margin-right: 20px;" >
           <span>작성일 </span><c:out value="${dto.qdate}"/><span>ㆍ조회수 </span>
           <c:out value="${dto.readno}"/><span>ㆍ스크랩 0</span>
         </li>  
       </ul>
    </div>
    <div class="hs_question_divline"></div> <!-- 라인 -->
    <div style="float: right;">    
    <a href="hs_questionupdate.do?no=${dto.q_no}"><button class="hs_question_divbtn" >수정</button></a>           
    <a href="hs_questiondelete.do?no=${dto.q_no}"><button class="hs_question_divbtn" style="margin-left: 5px;" >삭제</button></a>
    </div>
    <a href="hs_questionlist.do"><button class="hs_question_divbtn" style="" >목록</button></a>
    <!-- 댓글  -->
    <p style="font-size:18px; font-weight: 800; margin-top: 20px; ">답변</p>
    <div  style="margin-bottom: 20px;">
        <form method="post" action="hs_answeradd.do" name="frm">         
            <label for="hs_answer"><i class='fas fa-user-circle' style="font-size: 30px; margin-right: 5px;"></i></label>
            <input type="hidden" name="no" value="${dto.q_no}">
            <div class="hs_question_answer">
              <input type="text" name="hs_answer" id="hs_answer">
              <input type="submit" onclick="send()" value="등록" style="border: 1px transparent; font-weight : 900; font-size : 13px; background-color: rgba(0, 153, 255, 0.7); color : white; padding: 5px 22px;"> 
            </div>          
         </form> 
    </div>
    <div id="hs_answer_result"></div>
 <footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div>  
    
</body>
</html>