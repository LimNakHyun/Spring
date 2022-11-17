<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
textarea {
	resize: none;
}
</style>

</head>
<body>

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
	&nbsp;&nbsp;<input type="reset" value="리셋"><br>
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