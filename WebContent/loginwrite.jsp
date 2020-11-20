<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="UTF-8">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

body {
	background-color: #F6F6F6;
	margin-left: 20px;
	margin-right:20px;
}

h1, h3, h5, label, input {
	font-family: 'Nanum Gothic', sans-serif;
}

.inputbtn {
	margin-left: 15px;
}

</style>
<title>과제 알리미 로그인</title>
</head>
<body>
	<br>
	<h3>로그인</h3>
	<hr>
	<br>
	<form action="loginwriteController.jsp" method="post">
		<div class="col-md-2 mb-2">
			<label for="lastName">아이디</label> 
			<input type="text" class="form-control" id="lastName" name="id" required>
		</div>
		<div class="col-md-2 mb-2">
			<label for="lastName">비밀번호</label> <input type="password"
				class="form-control" id="lastName" name="pw" required>
		</div>
		<input class="btn btn-primary inputbtn" type="submit" value="로그인 " />
	</form>
</body>
</html>