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
<script>
	function searchSelChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="list?nowPage=" + ${paging.nowPage} + "&cntPerPage=" + sel + "&search=" + ${paging.search};
	}
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="list?nowPage=" + ${paging.nowPage} + "&cntPerPage=" + sel;
	}
	/* function selChange() {
		if(${paging2} == null) {
			var sel = document.getElementById('cntPerPage').value;
			location.href="list?nowPage=" + ${paging.nowPage} + "&cntPerPage=" + sel;			
		} else {
			var sel = document.getElementById('cntPerPage').value;
			location.href="list?nowPage=" + ${paging2.nowPage} + "&cntPerPage=" + sel + "&search=" + ${paging2.search};
		}
	} */
</script>
<body>

<h3 align="center">게시글 목록</h3>

<section>
	<c:choose>
		<c:when test="${paging2 eq null}">
			<form action="/list?nowPage=${paging.nowPage}&cntPerPage=${paging.cntPerPage}" class="navbar-form navbar-left">
			<%-- <form action="/list?nowPage=${paging.nowPage}&cntPerPage=${paging.cntPerPage}"> --%>
				<div class="form-group">
					<input type="search" name="search" class="form-control" placeholder="검색">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</c:when>
		<c:when test="${paging eq null}">
			<form action="/list?nowPage=${paging2.nowPage}&cntPerPage=${paging2.cntPerPage}" class="navbar-form navbar-left">
			<%-- <form action="/list?nowPage=${paging2.nowPage}&cntPerPage=${paging2.cntPerPage}"> --%>
				<div class="form-group">
					<input type="search" name="search" class="form-control" value="${paging2.search}">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</form>
		</c:when>
	</c:choose>
</section>

<div>
	<c:choose>
		<c:when test="${paging2 eq null}">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</c:when>
		<c:otherwise>
			<select id="cntPerPage" name="sel" onchange="searchSelChange()">
				<option value="5"
					<c:if test="${paging2.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging2.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging2.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging2.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</c:otherwise>
	</c:choose>
</div>


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
	
	<%-- <div style="display: block; text-align: center;">
		<c:if test="${(paging.startPage != 1) && (paging.search eq null)}">
			<a href="/list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:if test="${paging.startPage != 1}">
			<a href="/list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&search=${paging.search}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${(p != paging.nowPage) && (paging.search eq null)}">
					<a href="/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="/list?nowPage=${p}&cntPerPage=${paging.cntPerPage}&search=${paging.search}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${(paging.endPage != paging.lastPage) && (paging.search eq null)}">
			<a href="/list?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/list?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}&search=${paging.search}">&gt;</a>
		</c:if>
	</div> --%>
	<%-- <div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1}">
			<a href="/list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
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
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/list?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div> --%>
	<p>paging: ${paging}</p>
	<p>paging2: ${paging2}</p>
	<div style="display: block; text-align: center;">
		<c:choose>
			<c:when test="${paging.startPage != 1 && paging2 eq null}">
				<a href="/list?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:when>
			<c:when test="${paging.startPage != 1 && paging2 ne null}">
				<a href="/list?nowPage=${paging2.startPage - 1}&cntPerPage=${paging2.cntPerPage}&search=${paging2.search}">&lt;</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${paging2 eq null}">
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
			</c:when>
			<c:otherwise>
				<c:forEach begin="${paging2.startPage}" end="${paging2.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging2.nowPage}">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging2.nowPage}">
							<a href="/list?nowPage=${p}&cntPerPage=${paging2.cntPerPage}&search=${paging2.search}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${paging.endPage != paging.lastPage && paging2 eq null}">
				<a href="/list?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:when>
			<c:when test="${paging.endPage != paging.lastPage && paging2 ne null}">
				<a href="/list?nowPage=${paging2.endPage + 1}&cntPerPage=${paging2.cntPerPage}&search=${paging2.search}">&gt;</a>
			</c:when>
		</c:choose>
	</div>

</body>
</html>