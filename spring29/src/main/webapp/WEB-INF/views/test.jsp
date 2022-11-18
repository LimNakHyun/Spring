<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<label>세션에서 ID확인: ${sessionScope.id}</label><br>
	<label>세션에서 PWD확인: ${sessionScope.pwd}</label><br>
	<label>세션에서 로그인 여부 확인: ${sessionScope.loginCondition}</label>

</body>
</html>