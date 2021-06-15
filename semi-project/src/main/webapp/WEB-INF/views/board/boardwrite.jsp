<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{background-color:white;
margin : auto;
width : 300px;}
</style>
<script src="<%=request.getContextPath() %>/resources/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/writestyle.css">

</head>
<body>

<div class="container">  
  <form id="contact" action="/semi/board/write" method="post">
    <h3>Win-Win Partnership</h3>
    <h4>단기업무체험 프로젝트 진행 후의 후기 및 평가글을 작성해주세요. (현업자와 예비현업자 구분)</h4>
    <fieldset>
      <input placeholder="제목" name=title type="text" tabindex="1" required autofocus>
    </fieldset>
    <fieldset>
      <textarea placeholder="내용입력" name=contents tabindex="5" required></textarea>
    </fieldset>    
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending" onclick="location.href='/semi/board/list?page=1'">작성</button>
    </fieldset>
  </form>
 
  
</div>
</body>
</html>