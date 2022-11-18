<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>

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
<h3>게시글 수정하기</h3>

<form action="update" method="post">
	<table class="table table-bordered">	
		<tr>
			<td>글 번호</td>
			<td><input id="num" type="hidden" name="num" value="${viewlist.num}"/>${viewlist.num}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${viewlist.usrname}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input id="subject" type="text" name="subject" value="${viewlist.subject}" required="required"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="content" cols="40" rows="15" name="content">${viewlist.content}</textarea></td>
		</tr>
	</table>
	&nbsp;&nbsp;<button>수정하기</button>
	<input type="hidden" name="num" value="${cri.num}"/>
	<input type="hidden" name="nowPage" value="${cri.nowPage}">
	<input type="hidden" name="cntPerPage" value="${cri.cntPerPage}">
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="search" value="${cri.search}">
	&nbsp;&nbsp;<input type="reset" value="리셋">
	&nbsp;&nbsp;<button type="button" onclick="location.href='javascript:history.go(-1)'">이전</button>
</form>
	
<form action="list" method="post">
	&nbsp;&nbsp;<button>목록보기</button>
	<input type="hidden" name="num" value="${cri.num}"/>
	<input type="hidden" name="nowPage" value="${cri.nowPage}">
	<input type="hidden" name="cntPerPage" value="${cri.cntPerPage}">
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="search" value="${cri.search}">
</form>
</body>
</html>