<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.container-fluid {
    padding-top: 70px;
    padding-bottom: 70px;
}
.bg-1 { 
    background-color: #A2E9FF;
    color: #000000;
  }
form {
	display: inline;
}
.container-borhead {
	display: flex;
	margin: 20px 0px 20px 20px;
}
table {
	margin-left:auto; 
    margin-right:auto;
}
</style>

</head>
<body>

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
					</form>
				</div>&nbsp;&nbsp;
				<div>
					<label><strong>[${id}]</strong> 로그인됨</label>
				</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
	<h3 class="margin">회원가입</h3>
	
	<form action="regist" method="post">
		<table>
			<tr>
				<td><label>ID : </label></td>
				<td><input type="text" name="id" required="required"/></td>
			</tr>
			<tr>
				<td><label>PW : </label></td>
				<td><input type="password" name="pwd" required="required"/></td>
			</tr>
			<tr>
				<td><label>이름 : </label></td>
				<td><input type="text" name="name" required="required"/></td>
			</tr>
		</table> 
		<br>
		<button>가입하기</button>
	</form>
</div>

</body>
</html>
