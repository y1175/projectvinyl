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
				let result ="<thead><tr><th><i class='fas fa-user-circle'></i>작성자</th><th>내용</th></tr></thead><tbody>"
					result+="<td>"+item.answerid+"</td>";
					result+="<td>"+item.content+"</td>";
					result+="<td><input type='button' value='삭제' onclick='del("+item.a_no+","+item.q_no+")'></td>";
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
<link rel="stylesheet" href="css/hs_questiondetail.css" >
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
           <p>질문과 답변</p>
         </li>
         <li>
           <c:out value="${dto.mem_name}"/>
         </li>
         <li>
           <c:out value="${dto.title}"/>
         </li>
         <li>
           <img src="upload/${dto.filename}" alt="${file}">
         </li>
         <li>
           <c:out value="${dto.content}"/>
         </li>
         <li>
           <c:out value="${dto.qdate}"/><span>ㆍ</span>
           <c:out value="${dto.readno}"/><span>ㆍ스크랩 0</span>
         </li>  
       </ul>
    </div>
    <div></div> <!-- 라인 -->
    <a href="hs_questionlist.do"><button>목록</button></a>
    
    <a href="hs_questionupdate.do?no=${dto.q_no}"><button>수정</button></a>
    <a href="hs_questiondelete.do?no=${dto.q_no}"><button>삭제</button></a>
    <!-- 댓글  -->
    <div>
      <form method="post" action="hs_answeradd.do" name="frm">
         <p>답변</p>
            <label for="hs_answer"><i class='fas fa-user-circle'></i></label>
            <input type="hidden" name="no" value="${dto.q_no}">
            <input type="text" name="hs_answer" id="hs_answer">
            <input type="submit" onclick="send()" value="등록"> 
      </form> 
    </div>
    <div id="hs_answer_result"></div>
 <footer>
   <jsp:include page="/hs_user_footer.jsp"></jsp:include>
 </footer>
</div>  
    
</body>
</html>