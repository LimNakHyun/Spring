<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>

<link rel="stylesheet" href="bootstrap.css">
<!-- <link rel="stylesheet" href="C:/PRACTICE/00.TOBY/01.CHAP01/gitworkspace/spring29/src/main/webapp/WEB-INF/views/common.css"> -->

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<h3 align="center">게시글 목록</h3>

<section>
	<form action="list" class="navbar-form navbar-left">
		<div class="form-group">
			<input type="search" name="search" class="form-control" placeholder="검색">
		</div>
		<button type="submit" class="btn btn-default">
			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
	</form>
</section>

<section align="right">
	<button onclick="location.href='writeForm'">글 작성</button>
</section><br>


<table class="table table-bordered table-striped">
	
	<tr align="center" class="info">
		<td class="col-sm-1">번호</td>
		<td class="col-sm-2">작성자</td>
		<td class="col-sm-6">제목</td>
		<td class="col-sm-2">작성일</td>
		<td class="col-sm-1">조회수</td>
	</tr>
	
	<c:forEach items="${list}" var="dto" varStatus="status">
	<tr>
		<td align="center">${status.count}</td>
		<td align="center">${dto.usrname}</td>
		<td><a href="view?num=${dto.num}">${dto.subject}</a></td>
		<td align="center"><fmt:formatDate pattern="YYYY-MM-dd" value="${dto.date}"/></td>
		<td align="center">${dto.cnt}
	<tr>
	</c:forEach>
</table>
</body>
</html>