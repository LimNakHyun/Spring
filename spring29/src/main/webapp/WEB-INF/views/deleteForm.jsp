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
		<form name="deleteForm" action="delete" method="post" class="form-horizontal">
		<%-- <input type = "hidden" name = "page" value = "<%=nowPage %>"/> --%>
			<input type="hidden" name="num" value="${num}"/>
			<label>글 비밀번호 : </label>
			<input name="confirmPwd" type="password">
			<br><br>
			<button>삭제하기</button>
		</form>
		<input type="button" value="이전으로" onClick="javascript:history.go(-1)"/>
	</section>
</body>
</html>