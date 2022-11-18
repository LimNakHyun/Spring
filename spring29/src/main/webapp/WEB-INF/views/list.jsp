<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>

<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
  body {
    font: 16px Montserrat, sans-serif;
    line-height: 1.8;
  }
  
  .navbar {
    padding-top: 15px;
    padding-bottom: 15px;
    border: 0;
    border-radius: 0;
    margin-bottom: 0;
    font-size: 12px;
    letter-spacing: 5px;
  }
  
  .navbar-nav  li a:hover {
    color: #1abc9c !important;
  }
</style>

</head>
<body>

<!-- Navbar -->
<!-- <nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
      	<a href="/list" class="navbar-brand">
			<span style="width: 300; height: 300;" class="icon-bar glyphicon glyphicon-home btn-lg"></span>
		</a>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Me</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">WHO</a></li>
        <li><a href="#">WHAT</a></li>
        <li><a href="#">WHERE</a></li>
      </ul>
    </div>
  </div>
</nav> -->

<table style="witdh: 100%;">
<tr>
	<td text-align="left">
		<a href="/list">
			<span style="width: 300; height: 300;" class="glyphicon glyphicon-home btn-lg"></span>
		</a>
	</td>
	<td text-align="center">
		<h3>로컬 게시판</h3>
	</td>
</tr>
</table>

<form action="writeForm" method="post">
	<section align="right">
		<button class="btn btn-primary search-btn">글 작성</button>&nbsp;&nbsp;&nbsp;
	</section>
	<input type="hidden" name="nowPage" value="${paging.nowPage}">
	<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
	<input type="hidden" name="searchType" value="${paging.searchType}">
	<input type="hidden" name="search" value="${paging.search}">
</form>

<br>

<c:choose>
	<c:when test="${fn:length(list) eq 0}">
		<h2 align="center">표시할 글이 없습니다.</h2>
	</c:when>
	<c:otherwise>
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
					<td>
						<c:choose>
							<c:when test="${dto.refdepth > 0}">
								<c:forEach var="i" begin="0" end="${dto.refdepth}">
									&nbsp;&nbsp;
								</c:forEach>
								[Re:] <a href="view?num=${dto.num}&numbering=${dto.numbering}&nowPage=${paging.nowPage}&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&search=${paging.search}">${dto.subject}</a>
							</c:when>
							<c:otherwise>
								<a href="view?num=${dto.num}&numbering=${dto.numbering}&nowPage=${paging.nowPage}&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&search=${paging.search}">${dto.subject}</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center"><fmt:formatDate pattern="YYYY-MM-dd" value="${dto.date}"/></td>
					<td align="center">${dto.cnt}
				<tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>

<br>

<form action="list" method="post">
	<table style="margin-left: auto; margin-right: auto;" class="search-wrap">
	<tr>
		<td>
			<select style="width: 104px; height: 30px; white-space: nowrap; font-size: 12px;" class="form-control search-select" name="searchType">
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
			<c:if test="${paging.startPage != 1}">
				<li><a href="#" data-nowpage='${1}'>&lt;&lt;</a></li>
			</c:if>
			
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
			<c:if test="${paging.endPage != paging.lastPage}">
				<li><a href="#" data-nowpage='${paging.lastPage}'>&gt;&gt;</a></li>
			</c:if>
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