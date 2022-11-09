<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 체크</title>
</head>
<body>
	<h2>비밀번호가 틀립니다. ${condition}에 실패했습니다.</h2>
	&nbsp;&nbsp;<button onclick="location.href='list'">글 목록</button>
	&nbsp;&nbsp;<input type="button" value="이전으로" onClick="javascript:history.go(-1)"/>
</body>
</html>