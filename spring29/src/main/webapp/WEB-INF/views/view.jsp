<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세보기</title>


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

<h3>게시글 상세보기</h3>
<%-- <p> 검색어 : ${search} </p> --%>
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

<%-- <button onclick="location.href='list?search=${search}'">글 목록</button> &nbsp;&nbsp; --%>
&nbsp;&nbsp;<button onclick="location.href='list'">글 목록</button>
&nbsp;&nbsp;<button onclick="location.href='/updateForm?num=${viewlist.num}'">글 수정</button>
<%-- &nbsp;&nbsp;<button onclick="location.href='delete?num=${viewlist.num}'">글 삭제</button> --%>
&nbsp;&nbsp;<button onclick="location.href='deleteForm?num=${viewlist.num}'">글 삭제</button>


</body>
</html>