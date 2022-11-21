<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 체크</title>
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
</head>
<body>
	<h2>비밀번호가 틀립니다. ${condition}에 실패했습니다.</h2>
	
	&nbsp;&nbsp;<input type="button" value="이전으로" onClick="javascript:history.go(-1)"/>
	
	<form action="list" method="post">
		&nbsp;&nbsp;<button class="btn btn-success">글 목록</button>
		<input type="hidden" name="nowPage" value="${paging.nowPage}">
		<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
		<input type="hidden" name="searchType" value="${paging.searchType}">
		<input type="hidden" name="search" value="${paging.search}">
	</form>
</body>
</html>