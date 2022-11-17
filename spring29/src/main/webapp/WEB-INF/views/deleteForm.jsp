<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 페이지</title>
</head>
<body>	
	<section align="center">
		<form action="delete" method="post" class="form-horizontal">
			<label>글 비밀번호 : </label>
			<input name="confirmPwd" type="password">
			<br><br>
			<button>삭제하기</button>
			<input type="hidden" name="num" value="${cri.num}"/>
			<input type="hidden" name="nowPage" value="${cri.nowPage}">
			<input type="hidden" name="cntPerPage" value="${cri.cntPerPage}">
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="search" value="${cri.search}">
		</form>
		<input type="button" value="이전으로" onClick="javascript:history.go(-1)"/>
	</section>
</body>
</html>