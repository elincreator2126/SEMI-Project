register.jsp

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
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
	   $("#register").on('click',function(){	      
	      $.ajax({
	      url: "/semi/register",
	      data: {'id':$("#id").val(), 'pw':$("#pw").val(), 'name':$("#name").val()},
	      type: 'post',
	      dataType:'json',
	      ///서버로 전송
	      success: function(server){
	         
	    	  if(server.process == '정상'){
    	       		alert($("#name").val()+" 님 회원가입 되셨습니다");
    	       		location.href='/semi/';
    	         }else{
    	        	alert("중복된 회원입니다");
    	        	
    	         }
	       	 
	      }
	      
	      });   //ajax 요청함수
	      
	   });//on end
	});
</script>
</head>
<body width="100%" height="100%">
    <form action="register" method="post" class="loginForm">
      <h2>회원가입</h2>
      <div class="idForm">
        <input type="text" class="id" id=id name="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" id=pw name="pw" placeholder="PW">
      </div>
      <div class="idForm">
        <input type="text" class="id" id=name name="name" placeholder="NAME"/>
      </div>
      <input type=button id=register class="btn" value="회원가입"/>                   
      
      <script>
      </script>
      
    </form>
  </body>

</html>