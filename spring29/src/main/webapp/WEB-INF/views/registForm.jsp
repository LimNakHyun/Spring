<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.container-fluid {
    padding-top: 70px;
    padding-bottom: 70px;
}
.bg-1 { 
    background-color: #A2E9FF;
    color: #000000;
  }
form {
	display: inline;
}
.container-borhead {
	display: flex;
	margin: 20px 0px 20px 20px;
}
table {
	margin-left:auto; 
    margin-right:auto;
}
</style>

<script>
	function check_pw(){
		var pw = document.getElementById('pw').value;
		var SC = ["!", "@", "#", "$", "%"];
		var check_SC = 0;
		
		if(pw.length < 6 || pw.length > 16){
			window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
			document.getElementById('pw').value='';
		}
		for(var i = 0; i < SC.length; i++) {
			if(pw.indexOf(SC[i]) != -1){
				check_SC = 1;
			}
		}
		if(check_SC == 0){
			window.alert('!, @, #, $, % 의 특수문자가 들어가 있지 않습니다.')
			document.getElementById('pw').value='';
		}
		if(document.getElementById('pw').value != '' && document.getElementById('pw2').value != ''){
			if(document.getElementById('pw').value == document.getElementById('pw2').value){
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
				document.getElementById('check').style.color = 'blue';
			}
			else{
				document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color = 'red';
			}
		}
	}
</script>

</head>
<body>

<div class="container-borhead">
	<div>
		<button class="btn btn-default" type="button" onclick="location.href='/'">홈</button>
	</div>&nbsp;&nbsp;
	<div>
		<button class="btn btn-default" type="button" onclick="location.href='/list'">게시판 목록</button>
	</div>&nbsp;&nbsp;
</div>

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
	<h3 class="margin">회원가입</h3>
	
	<form action="regist" method="post">
		<table>
			<tr>
				<td width="5%" align="center">*</td>
				<td width="20%"><label>아이디 : </label></td>
				<td><input type="text" name="id" required="required"/></td>
			</tr>
			<tr>
				<td width="5%" align="center">*</td>
				<td width="20%"><label>비밀번호 : </label></td>
				<td><input type="password" name="pwd" id="pw" required="required" onchange="check_pw()"/></td>
			</tr>
			<tr>
				<td width="5%" align="center">*</td>
				<td width="20%"><label>비밀번호 확인 : </label></td>
				<td>
					<input type="password" name="pwd2" id="pw2" required="required" onchange="check_pw()"/>&nbsp;
					<span id="check"></span>
				</td>
			</tr>
			<tr>
				<td width="5%" align="center">*</td>
				<td width="20%"><label>이름 : </label></td>
				<td><input type="text" name="name" required="required"/></td>
			</tr>
		</table> 
		<br>
		<button class="btn btn-default">가입하기</button>
	</form>
</div>

</body>
</html>
