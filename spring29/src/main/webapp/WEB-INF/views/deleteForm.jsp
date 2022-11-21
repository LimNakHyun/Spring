<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
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
						<input type="hidden" name="whatPage" value="list">
						<button class="btn btn-default">로그아웃</button>
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
</head>
<body>	
	<section align="center">
		<form action="delete" method="post" class="form-horizontal">
			<label>글 비밀번호 : </label>
			<input name="confirmPwd" type="password">
			<br><br>
			<button class="btn btn-danger">삭제하기</button>
			<input type="hidden" name="num" value="${cri.num}"/>
			<input type="hidden" name="nowPage" value="${cri.nowPage}">
			<input type="hidden" name="cntPerPage" value="${cri.cntPerPage}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="search" value="${cri.search}">
		</form>
		<button class="btn btn-info" type="button" onClick="history.go(-1)">이전으로</button>
	</section>
</body>
</html>