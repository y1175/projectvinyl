<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
  function send(){
	  if(document.frm.hs_answer.value!="")
		  document.frm.submit();
  }
  function del(a_no,q_no){
	  location href="hs_answerdelete.do?a_no="+a_no+"&q_no="+q_no
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
<!--icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--icon-->
</head>
<body>
  <c:set var="dto" value="${requestScope.dto}"/>
    <div>
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
            <input type="text" name="hs_answer" id="hs_answer">
            <input type="submit" onclick="send()" value="등록"> 
      </form> 
    </div>
    <div id="hs_answer_result"></div>

    
</body>
</html>