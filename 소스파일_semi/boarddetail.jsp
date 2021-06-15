boarddetail.jsp

  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취꿀팁</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script src="<%=request.getContextPath() %>/resources/jquery-3.2.1.min.js"></script>
<script>
</script>
<style type="text/css">
table {
text-alien:center;
margin:auto;
}
#content {
text-align: center;
}
body{
text-align: center;
}
</style>
</head>
<body>
<h1 id="title">자취 꿀팁</h1>

<br>
<div id="content">
	<table border="3">
		<caption><tr><td>번호</td><td>제목</td><td>작성자</td><td>조회수</td></tr></caption>
		
		<tr><td>${dto.seq}</td><td>${dto.title}</td><td>${dto.writer}</td><td>${dto.viewcount}</td></tr>
		
		</table>
		<h3>${dto.contents}</h3>		
	<br>
	<h2><input type=button value="돌아가기" onclick="location.href='/semi/board/list?page=1'"/></h2>
	<h2><input type=button id=delete_btn class="btn btn-danger" value="게시글 삭제"/></h2>
</div>
<script>
$(document).ready(function(){	
	$("#delete_btn").on('click',function(){	      
	      $.ajax({
	      url: "/semi/delete",
	      data: {'seq':${dto.seq}},
	      type: 'post',
	      dataType:'json',
	      ///서버로 전송
	      success: function(server){
	    	if(server.process == '삭제완료'){
		    	alert("게시글이 삭제되었습니다");
		  		location.href='/semi/board/list?page=1';
	    	}
	      }	      
	      });   //ajax 요청함수	     
	   });//on end
});
</script>
</body>
</html>