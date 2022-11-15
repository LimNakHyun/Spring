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

<style>
	/* .search-wrap {
		height: 40px;
		width: 400px;
		border: 1px solid #1b5ac2;
		background: #ffffff;
	}
	
	input {
		font-size: 16px;
		width: 325px;
		padding: 10px;
		border: 0px;
		outline: none;
		float: left;
	}
	
	button {
		width: 50px;
		height: 100%;
		border: 0px;
		background: #1b5ac2;
		outline: none;
		float: right;
		color: #ffffff;
	} */
</style>

</head>
<body>

<a href="/list">
	<span style="margin-left: auto; margin-right: auto;" class="glyphicon glyphicon-home btn-lg"></span>
</a>

	<section align="right">
		<button onclick="location.href='writeForm'" class="btn btn-primary search-btn">글 작성</button>&nbsp;&nbsp;&nbsp;
	</section>

<br>

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

<br>

<form action="list" method="post">
	<table style="margin-left: auto; margin-right: auto;" class="search-wrap">
	<tr>
		<td>
			<select style="width:100px;height:30px;white-space: nowrap;" class="form-control search-select" name="searchType">
				<option value="subject" ${paging.searchType eq 'subject' ? 'selected' : ''}>제목</option>
				<option value="content" ${paging.searchType eq 'content' ? 'selected' : ''}>내용</option>
				<option value="usrname" ${paging.searchType eq 'usrname' ? 'selected' : ''}>작성자</option>
				<option value="subCon" ${paging.searchType eq 'subCon' ? 'selected' : ''}>제목+내용</option>
			</select>
		</td>
		<td>
			<input style="width:200px;height:30px;white-space: nowrap;" type="text" class="form-control search-input" name="search" value="${paging.search}">
		</td>
		<td>
			<button style="height:30px;" type="submit" class="btn btn-info search-btn">검색</button>
		</td>
	</tr>
	</table>
	
	<input type="hidden" name="nowPage" value="1">
	<input type="hidden" name="cntPerPage" value="10">
</form>
	
	<form action="list" name="pageForm" method="post">
		<div style="display: block; text-align: center;">
			<ul class="pagination pagination-sm">
				<!-- 첫 페이지로 버튼 -->
				<li><a href="#" data-nowpage='${1}'>&lt;&lt;</a></li>
				
				<!-- 이전버튼 활성화 여부 -->
				<c:if test="${paging.startPage != 1}">
					<li><a href="#" data-nowpage='${paging.startPage - 1}'>&lt;</a></li>
				</c:if>
				
				<!-- 페이지네이션 처리 -->
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<li class="${paging.nowPage eq p ? 'active' : ''}">
						<a href="#" data-nowpage='${p}'>${p}</a>
					</li>
				</c:forEach>
				
				<!-- 다음버튼 활성화 여부 -->
				<c:if test="${paging.endPage != paging.lastPage}">
					<li><a href="#" data-nowpage='${paging.endPage + 1}'>&gt;</a>
				</c:if>
				
				<!-- 마지막 페이지로 버튼 -->
				<li><a href="#" data-nowpage='${paging.lastPage}'>&gt;&gt;</a></li>
			</ul>
			
				<input type="hidden" name="nowPage" value="${paging.nowPage}">
				<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
				<input type="hidden" name="searchType" value="${paging.searchType}">
				<input type="hidden" name="search" value="${paging.search}">
		</div>
	</form>
	
	<script>
		var pagination = document.querySelector(".pagination");
		pagination.onclick = function() {
			event.preventDefault();
			if(event.target.tagName != 'A') return;
			
			document.pageForm.nowPage.value = event.target.dataset.nowpage;
			document.pageForm.submit();
		}
		
		window.onload = function() {
			if(history.state == '') return;
			
			var msg = '<c:out value="${msg}" />';
			
			if(msg != '') {
				alert(msg);
				history.replaceState('', null, null);
			}
		}
	</script>

</body>
</html>