<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
</head>
<body>
	<form name="updatePwd" action="updatePwd" class="form-horizontal">
		<input type="hidden" name="num" value="${num}"/>
		<label>글 비밀번호 : </label>
		<input name="confirmPwd" type="password">
		<br><br>
		<button>수정하기</button>&nbsp;&nbsp;
	</form>
	<input type="button" value="이전으로" onClick="javascript:history.go(-1)"/>
</body>
</html>