<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세보기</title>

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

<h3>게시글 상세보기</h3>
<table class="table table-bordered">
	<tr>
		<td>글 번호</td>
		<td>${viewlist.numbering}</td>
	</tr>
	<tr>
	 	<td>작성자</td>
	 	<td>${viewlist.usrname}</td>
	 </tr>
	 <tr>
		<td>글 제목</td>
		<td>${viewlist.subject}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate pattern="YYYY-MM-dd" value="${viewlist.date}"/></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${viewlist.cnt}</td>
	</tr>
	<tr>
		<td>글 내용</td>
		<td><textarea cols="40" rows="15" readonly>${viewlist.content}</textarea></td>
	</tr>
</table>
<div align="center">
<form action="list" method="post">
	<button class="btn btn-success">글 목록</button>
	
	<input type="hidden" name="nowPage" value="${paging.nowPage}">
	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
	<input type="hidden" name="searchType" value="${paging.searchType}">
	<input type="hidden" name="search" value="${paging.search}">
</form>
<form action="updateForm" method="post">
	&nbsp;<button class="btn btn-warning">글 수정</button>
	<input type="hidden" name="num" value="${viewlist.num}">
	<input type="hidden" name="nowPage" value="${paging.nowPage}">
	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
	<input type="hidden" name="searchType" value="${paging.searchType}">
	<input type="hidden" name="search" value="${paging.search}">
</form>
<form action="deleteForm" method="post">
	&nbsp;<button class="btn btn-danger">글 삭제</button>
	<input type="hidden" name="num" value="${viewlist.num}">
	<input type="hidden" name="nowPage" value="${paging.nowPage}">
	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
	<input type="hidden" name="searchType" value="${paging.searchType}">
	<input type="hidden" name="search" value="${paging.search}">
</form>
<form action="replyForm" method="post">
	&nbsp;<button class="btn btn-info">답글달기</button>
	<input type="hidden" name="num" value="${viewlist.num}">
	<input type="hidden" name="nowPage" value="${paging.nowPage}">
	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
	<input type="hidden" name="searchType" value="${paging.searchType}">
	<input type="hidden" name="search" value="${paging.search}">
</form>
</div>
</body>
</html>