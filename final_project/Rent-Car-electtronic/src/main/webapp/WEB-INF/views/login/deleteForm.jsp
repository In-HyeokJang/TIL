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
  <style>
  .message{
    color:red;
    font-size:15px;
  }
  </style>

	<script type="text/javascript">

	    function inCheck(f){
        	if(f.passwd.value.length==0){
        		alert("비밀번호를 입력하세요");
        		f.passwd.focus();
        		return false;
        	}else if (confirm("정말 탈퇴하시겠습니까?")) {

                  document.getElementById('frm').submit();

                } else {
                    return false;
                }
        }

	</script>
	<body>
		<div class="createbox">
		    <div class="form-block">

			<form
			    name="frm"
			    action="/user/delete"
			    method="post"
			    onsubmit="return inCheck(this)"
			    >

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
				<div class="message">
                	<c:if test="${msg == false}">
               			비밀번호가 맞지 않습니다.
               		</c:if>
               	</div>
				<div align="center">
				<br><br><br><br>
					<button class="agreebtn">회원탈퇴</button><br>
                    <button type="button" class="btn_2" onclick="location.href='/member/mypage/'">취소</button>
				</div>
			</form>

			</div>
		</div>
	</body>
</html>