<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>홈</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
<%--   body {
    /* font: 20px Montserrat, sans-serif; */
    line-height: 1.8;
    /* color: #f5f6f7; */
    color: #000000;
  }
  p {font-size: 16px;}
  .margin {
  	margin-bottom: 45px;
  }
  
  .bg-2 { 
    background-color: #474e5d; /* Dark Blue */
    color: #ffffff;
  }
  .bg-3 { 
    background-color: #ffffff; /* White */
    color: #555555;
  }
  .bg-4 { 
    background-color: #2f2f2f; /* Black Gray */
    color: #fff;
  }
  
  .navbar {
    padding-top: 15px;
    padding-bottom: 15px;
    border: 0;
    border-radius: 0;
    margin-bottom: 0;
    margin-left: 30px;
    font-size: 12px;
    letter-spacing: 5px;
  }
  .navbar-nav  li a:hover {
    color: #1abc9c !important;
  }
   --%>
  
  .container-fluid {
    padding-top: 70px;
    padding-bottom: 70px;
  }
  .bg-1 { 
    /* background-color: #1abc9c; */ /* Green */
    background-color: #A2E9FF;
    /* color: #ffffff; */
    color: #000000;
  }
  table {
    margin-left:auto; 
    margin-right:auto;
  }
  
  form {
  	display: inline;
  }
  .container-borhead {
  	display: flex;
  	margin: 20px 0px 20px 20px;
  }
  
  </style>
</head>
<body>
<!-- Navbar -->
<!-- <nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar" type="button" onclick="location.href='/'">홈</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>                        
			</button>
		<button class="navbar-brand" type="button" onclick="location.href='/'">홈</button>
		
		</div>
		
		<div class="navbar-header">
			
		</div>
		
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-left">
      			<li>
      				<form action="logout">
						<button class="navbar-brand">로그아웃</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
</nav> -->

<%-- <nav class="navbar">
	<div>
		<button class="btn btn-default" type="button" onclick="location.href='/'">홈</button>
		<form action="logout">
			<button class="btn btn-default">로그아웃</button>
		</form>
	</div>
	<nav style="margin-right: 30px; font: 16px Montserrat, sans-serif;">
		<c:choose>
			<c:when test="${loginCondition}">
				<label><strong>[${id}]</strong> 로그인됨</label>
			</c:when>
			<c:otherwise>
				<label>로그인</label>
			</c:otherwise>
		</c:choose>
	</nav>
</nav> --%>

<div class="container-borhead">
	<div>
		<button class="btn btn-default" type="button" onclick="location.href='/'">홈</button>
	</div>&nbsp;&nbsp;
	<div>
		<button class="btn btn-default" type="button" onclick="location.href='/list'">게시판 목록</button>
	</div>&nbsp;&nbsp;
	<div>
		<c:choose>
			<c:when test="${loginCondition}">
				<div>
					<form action="logout">
						<button class="btn btn-default">로그아웃</button>
						<input type="hidden" name="whatPage" value="home">
					</form>
				</div>&nbsp;&nbsp;
				<div>
					<label><strong>[${id}]</strong> 로그인됨</label>
				</div>
			</c:when>
			<c:otherwise>
				<button class="btn btn-default" type="button" onclick="location.href='/'">로그인</button>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
	<c:choose>
		<c:when test="${loginCondition}"></c:when>
		<c:otherwise>
			<h3 class="margin">로그인 페이지</h3>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${loginCondition}">
			<h3>환영합니다! [${id}]님!</h3>
		</c:when>
		<c:otherwise>
			<form action="login" method="post">
				<table>
					<tr>
						<td><label>ID : </label></td>
						<td><input type="text" name="id" required="required"/></td>
					</tr>
					<tr>
						<td><label>PW : </label></td>
						<td><input type="password" name="pwd" required="required"/></td>
					</tr>
				</table> 
				<br>
				<button class="btn btn-default">로그인</button>&nbsp;&nbsp;
				<button class="btn btn-default" type="button" onclick="location.href='/registForm'">회원가입</button>
			</form>
		</c:otherwise>
	</c:choose>
	
	<br><br><br>
	
	<!-- <a href="/list">게시판 목록</a> -->
	
</div>

</body>
</html>
