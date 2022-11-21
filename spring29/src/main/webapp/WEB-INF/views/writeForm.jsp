<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
textarea {
	resize: none;
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

<h3>게시글 작성하기</h3>

<form action="write" method="post">
	<table class="table table-bordered">
		<tr>
			<td><label> 작성자 </label></td>
			<td>
				<c:choose>
					<c:when test="${loginCondition}">
						<input type="hidden" name="usrname" value="${id}">
						${id}
					</c:when>
					<c:otherwise>
						<input type="text" name="usrname" required="required"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<c:choose>
			<c:when test="${loginCondition}">
				<input type="hidden" name="pwd" value="${pwd}">
			</c:when>
			<c:otherwise>
				<tr>
					<td><label> 비밀번호 </label></td>
					<td><input type="password" name="pwd" required="required"/></td>
				</tr>
			</c:otherwise>
		</c:choose>
		
		<tr>
			<td><label> 제목 </label></td>
			<td><input type="text" name="subject" required="required"/></td>
		</tr>
		<tr>
			<td><label> 내용 </label></td>
			<td><textarea type="text" name="content" cols="40" rows="15" required="required"></textarea></td>
		</tr>
	</table>
	
	
	
	&nbsp;&nbsp;<button class="btn btn-primary search-btn">글 작성</button>
</form>

<form action="list" method="post">
	&nbsp;&nbsp;<button class="btn btn-success">글 목록</button>
	<input type="hidden" name="nowPage" value="${paging.nowPage}">
	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
	<input type="hidden" name="searchType" value="${paging.searchType}">
	<input type="hidden" name="search" value="${paging.search}">
</form>

</body>
</html>