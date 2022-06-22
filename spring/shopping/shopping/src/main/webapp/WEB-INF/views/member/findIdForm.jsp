<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Find ID</title>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/find.js" type="text/javascript"></script>
</head>
<body>
	<div class="container">

		<h1 class="col-sm-offset-2 col-sm-10">Find ID</h1>
		<form class="form-horizontal">

			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mname"
						placeholder="Enter mname" name="mname" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">이메일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email"
						placeholder="Enter email" name="email" required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button id = "findId" class="btn btn-default">아이디 찾기</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='/member/findPw'">패스워드 찾기</button>
				</div>
			</div>
	</form>

	</div>
</body>
</html>