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

<script>
  function send(){
	  if(document.frm.hs_answer.value!="")
		  document.frm.submit();
  }
  
  function del(a_no,q_no){
	  location.href="hs_answerdelete.do?a_no="+a_no+"&q_no="+q_no;
  }
  
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
					result+="<td style='font-size: 17px; font-weight : 500; padding-right:20px;'>"+item.answerid+"</td>";
					result+="<td style='font-size: 15px; width : 93%;'>"+item.content+"</td>";
					result+="<td><input type='button' value='삭제' onclick='del("+item.a_no+","+item.q_no+")' style='border: 1px transparent; font-weight : 900; font-size : 13px; background-color: rgba(0, 153, 255, 0.7); color : white; padding: 5px 25px; border-radius: 5px'></td>";
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
<style>
/* header nav 질문과답변 글씨색상  */
  .hs_header_nav > a:nth-child(4){
    color: rgb(0, 153, 255);
  }
</style>
<link rel="stylesheet" href="css/hs_questiondetail.css?ver=2" >
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
</head>
<body>
  <c:set var="dto" value="${requestScope.dto}"/>
    <div  class="hs_question_detaildiv">
       <ul>
         <li>
           <p class="hs_question_detail_qa"><a href="hs_hs_questionlist.do">질문과 답변</a></p>
         </li>
         <li style="font-size:18px; font-weight: 800; margin-top: -10px;">
           <c:out value="${dto.title}"/>
         </li>
         <li class="hs_question_detail_qamname" style="margin-top: 15px; font-size: 13px;">
           <i class='fas fa-user-circle' style="font-size: 25px; margin-right: 5px;"></i>
           <c:out value="${dto.mem_name}"/>
         </li>
         <li style="margin-top: 20px; text-align: center;">
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
   
     <c:set var="mem_no" value="${dto.mem_no }"/>
<!--  이렇게 하면 값 비교 > 동일 인물이면 수정, 삭제 가능 -->
    
    <c:set var="session" value="${sessionScope.mem_no }"/>
     <c:if test="${session == mem_no}">
      <a href="hs_questionupdate.do?no=${dto.q_no}"><button class="hs_question_divbtn" >수정</button></a>           
      <a href="hs_questiondelete.do?no=${dto.q_no}"><button class="hs_question_divbtn" style="margin-left: 5px;" >삭제</button></a>
     </c:if>
   
    </div>
    
    <a href="hs_questionlist.do"><button class="hs_question_divbtn" style="" >목록</button></a>
   
    <!-- 댓글  -->
    
    <p style="font-size:18px; font-weight: 800; margin-top: 20px; ">답변</p>
    <div  style="margin-bottom: 20px;">
        <form method="post" action="hs_answeradd.do" name="frm">         
            <label for="hs_answer"><i class='fas fa-user-circle' style="font-size: 30px;"></i></label>
            <input type="hidden" name="no" value="${dto.q_no}">
            <div class="hs_question_answer">
              <input type="text" name="hs_answer" id="hs_answer">
              <input type="submit" onclick="send()" value="등록" style="border: 1px transparent; font-weight : 900; font-size : 13px; background-color: rgba(0, 153, 255, 0.7); color : white; padding: 6px 25px; border-radius: 5px;"> 
            </div>          
         </form> 
         
    </div>
    
    <div id="hs_answer_result"></div>

    
</body>
</html>