<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>회원탈퇴</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="/css/login.css">
  <meta charset="utf-8">

	<script type="text/javascript">

			$("#submit").on("click", function(){
				if($("#passwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#passwd").focus();
					return false;
				}
			});
		})
	</script>
	<body>
		<div class="createbox">
		    <div class="form-block">

			<form
			    action="/user/delete"
			    method="post">

				<div class="info_2">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${dto.id}" readonly="readonly"/>
				</div>
				<div class="info_2">
               		<label class="control-label" for="userName">이름</label>
               		<input class="form-control" type="text" id="mname" name="mname" value="${dto.mname}" readonly="readonly"/>
               	</div>
				<div class="info">
					<label class="control-label" for="passwd">비밀번호</label>
					<input class="form-control" type="password" id="passwd" name="passwd" />
				</div>
				<div align="center">
				<br><br>
					<button class="agreebtn" onclick="location.href='/user/delete'">회원탈퇴</button><br>
                    <button class="btn_2" onclick="history.back()">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
			</div>
		</div>
	</body>
</html>