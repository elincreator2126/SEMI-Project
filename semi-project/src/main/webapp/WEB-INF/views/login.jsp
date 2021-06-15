<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/resources/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/style.css">
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body width="100%" height="100%">
    <form action="/semi/" method="post" class="loginForm">
      <img alt="winwin" src="<%=request.getContextPath() %>/resources/img/22.jpg" width=40%>
      <h1>Win-Win Partnership</h1>
      <div class="idForm">
        <input type="text" class="id" id=id name="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" id=pw name="pw" placeholder="PW">
      </div>
      <input type=button id=login class="btn" value="Log IN">
      <div id =result></div>
      <br>
      <a href="signup">회원가입</a>
      
      <script>
      	
      	$(document).ready(function(){
      	   $("#login").on('click',function(){
      	      //$("#result").html("테스트완료");
      	      $.ajax({
      	      url: "<%=request.getContextPath()%>/ajax/login",
      	      data: {'id':$("#id").val(), 'pw':$("#pw").val()},
      	      type: 'post',
      	      dataType:'json',
      	      ///서버로 전송
      	      success: function(server){
      	         
      	       	 if(server.process == '정상로그인'){
      	       		alert("로그인되셨습니다");
      	       		location.href='/semi/board/list?page=1';
      	         }else{
      	        	alert("아이디나 비밀번호를 확인하세요");
      	        	
      	         }
      	      }
      	      
      	      });   //ajax 요청함수
      	      
      	   });//on end
      	});
      </script>
      
    </form>
  </body>

</html>