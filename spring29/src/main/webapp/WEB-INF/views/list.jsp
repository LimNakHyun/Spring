<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
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
		<td align="center">${dto.numbering}</td>
		<td align="center">${dto.usrname}</td>
		<td><a href="view?num=${dto.num}">${dto.subject}</a></td>
		<td align="center"><fmt:formatDate pattern="YYYY-MM-dd" value="${dto.date}"/></td>
		<td align="center">${dto.cnt}
	<tr>
	</c:forEach>
</table>
	
	<section align="right">
		<button onclick="location.href='writeForm'">글 작성</button>
	</section>
	
	<div style="display: block; text-align: center;">
		<!-- 첫 페이지로 버튼 -->
		<a href="/list?nowPage=${1}&cntPerPage=${paging.cntPerPage}">&lt;&lt;</a>
		
		<!-- 이전버튼 활성화 여부 -->
		<c:if test="${paging.startPage != 1}">
			<a href="/list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		
		<!-- 페이지네이션 처리 -->
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<!-- 다음버튼 활성화 여부 -->
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/list?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
		
		<!-- 마지막 페이지로 버튼 -->
		<a href="/list?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}">&gt;&gt;</a>
	</div>


</body>
</html>