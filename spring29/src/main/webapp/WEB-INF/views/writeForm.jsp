<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>


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

<h3>게시글 작성하기</h3>

<form action="write" method="post">
	<table class="table table-bordered">
	
		<tr>
			<td><label> 작성자 </label></td>
			<td><input type="text" name="usrname" required="required"/></td>
		</tr>
		<tr>
			<td><label> 비밀번호 </label></td>
			<td><input type="password" name="pwd" required="required"/></td>
		</tr>
		<tr>
			<td><label> 제목 </label></td>
			<td><input type="text" name="subject" required="required"/></td>
		</tr>
		<tr>
			<td><label> 내용 </label></td>
			<td><textarea type="text" name="content" cols="40" rows="15" required="required"></textarea></td>
		</tr>
	</table>
	
	<!-- <button onclick="location.href='list'">글 목록</button> &nbsp;&nbsp; -->
	&nbsp;&nbsp;<a href="list">목록보기</a>
	&nbsp;&nbsp;<input type="submit" value="입력">
	
</form>
</body>
</html>