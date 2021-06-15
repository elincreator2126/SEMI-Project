<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--  테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<style>
 body {
 background-color: #0c7ae8;
 margin-top:30px;
 }
 #inline{
	display: inline-flex;
}
#button_group{
	display: grid;
}
 
 #title { 	
 	margin-top: 20px;
 	border-radius: 7px; 	
 	text-align: center; 	
 	color: black;
 	margin: auto;
 	width: 500px;
 	
 }
 
 #content {
 	text-align: center;
 }
 table {
 	
 	
 }
 table caption {
 	color: white;
 }
 #logo {
 	float: left;
    width: 100px;
 }
</style>
<img id=logo alt="winwin" src="<%=request.getContextPath() %>/resources/img/22.jpg" width=40%>
<h1 id="title">Win-Win Partnership</h1>

<br>
<div id="content">
	<table border="3" class="table table-condensed table-striped table-hover table-bordered">
		<caption><tr><td>번호</td><td>제목</td><td>작성자</td><td>조회수</td></tr></caption>
		<c:forEach items="${boardlist}" var="board">
		<tr><td>${board.seq}</td><td><a href="<%=request.getContextPath() %>/board/detail?seq=${board.seq}">${board.title}</a></td><td>${board.writer}</td><td>${board.viewcount}</td></tr>
		</c:forEach>
		</table>
	<h2>페이지번호</h2>
	<div id=inline>
	<span><h3><a href="/semi/board/list?page=1">1&nbsp;</a></h3></span>
	<span><h3><a href="/semi/board/list?page=2">2&nbsp;</a></h3></span>
	<span><h3><a href="/semi/board/list?page=3">3&nbsp;</a></h3></span>
	<span><h3><a href="/semi/board/list?page=4">4&nbsp;</a></h3></span><br>
	</div>
	<div id=button_group>
	<input type=button class="btn btn-primary active btn-lg btn-info" value="글쓰기" onclick="location.href='/semi/board/write'">
	<input type=button class="btn btn-primary active btn-lg btn-danger" value="로그아웃" onclick="location.href='/semi'">
	</div>
</div>
<script>

      </script>
</body>
</html>